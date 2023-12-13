
-- question 1
ALTER TABLE etudiants
ADD CONSTRAINT chk_note CHECK (note BETWEEN 0 AND 20);

-- question 2
ALTER TABLE etudiants
ADD CONSTRAINT chk_sexe CHECK (sexe IN ('m', 'M', 'f', 'F') OR sexe IS NULL);

-- question 3
ALTER TABLE professeurs
ADD CONSTRAINT chk_salaire_base CHECK (salaire_base < salaire_actuel);

-- Trigger :
-- Question 1
CREATE TRIGGER check_salaire_augmente
BEFORE UPDATE ON professeurs
FOR EACH ROW
BEGIN
    IF :NEW.salaire < :OLD.salaire THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le salaire d’un professeur ne peut pas diminuer');
    END IF;
END;

-- Question 2
CREATE OR REPLACE TRIGGER maj_prof_specialite
AFTER INSERT OR DELETE OR UPDATE ON professeurs
FOR EACH ROW
DECLARE
    nb_prof NUMBER;
BEGIN
    -- Calculer le nombre actuel de professeurs pour une spécialité donnée
    SELECT COUNT(*) INTO nb_prof FROM professeurs WHERE specialite = :NEW.specialite;

    -- Mise à jour ou insertion dans PROF_SPECIALITE
    MERGE INTO prof_specialite ps
    USING DUAL
    ON (ps.specialite = :NEW.specialite)
    WHEN MATCHED THEN
        UPDATE SET ps.nb_professeurs = nb_prof
    WHEN NOT MATCHED THEN
        INSERT (specialite, nb_professeurs) VALUES (:NEW.specialite, nb_prof);
END;

-- Question 3
CREATE OR REPLACE TRIGGER maj_charge_apres_prof
AFTER DELETE OR UPDATE OF numero ON professeurs
FOR EACH ROW
BEGIN
    IF DELETING THEN
        DELETE FROM charge WHERE numero_professeur = :OLD.numero;
    ELSIF UPDATING THEN
        UPDATE charge SET numero_professeur = :NEW.numero WHERE numero_professeur = :OLD.numero;
    END IF;
END;

-- Securité
-- Question 1
CREATE OR REPLACE TRIGGER audit_resultats_trigger
AFTER INSERT OR DELETE OR UPDATE ON resultat
FOR EACH ROW
DECLARE
    operationType VARCHAR(20);
BEGIN
    IF INSERTING THEN
        operationType := 'INSERT';
    ELSIF DELETING THEN
        operationType := 'DELETE';
    ELSIF UPDATING THEN
        operationType := 'UPDATE';
    END IF;

    INSERT INTO audit_resultats (UTILISATEUR, DATE_MAJ, DESC_MAJ, NUM_ELEVE, NUM_COURS, POINTS)
    VALUES (USER_NAME(), CURRENT_TIMESTAMP, operationType, :NEW.NUM_ELEVE, :NEW.NUM_COURS, :NEW.POINTS);
END;

-- Question 2
CREATE OR REPLACE TRIGGER limiter_augmentation_salaire
BEFORE UPDATE ON professeurs
FOR EACH ROW
DECLARE
    augmentationPermise FLOAT;
BEGIN
    IF USER_NAME() != 'GrandChef' THEN
        augmentationPermise := :OLD.salaire * 1.2; -- 20% d'augmentation
        IF :NEW.salaire > augmentationPermise THEN
            RAISE_APPLICATION_ERROR(-20002, 'Modification interdite');
        END IF;
    END IF;
END;

-- Fonctions et procédures
-- Question 1
CREATE FUNCTION fn_moyenne (id_etudiant INT)
RETURNS FLOAT AS
BEGIN
    DECLARE moyenne FLOAT;
    SELECT AVG(points) INTO moyenne FROM resultats WHERE num_eleve = id_etudiant;
    RETURN moyenne;
END;

-- Question 2
CREATE PROCEDURE pr_resultat()
AS
BEGIN
    DECLARE @id_etudiant INT, @moyenne FLOAT, @mention VARCHAR(20);

    DECLARE cursor_etudiant CURSOR FOR
        SELECT num_eleve FROM etudiants;

    OPEN cursor_etudiant;

    FETCH NEXT FROM cursor_etudiant INTO @id_etudiant;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @moyenne = fn_moyenne(@id_etudiant);

        IF @moyenne < 10 THEN
            SET @mention = 'Échec';
        ELSE IF @moyenne BETWEEN 10 AND 12 THEN
            SET @mention = 'Passable';
        ELSE IF @moyenne BETWEEN 12 AND 14 THEN
            SET @mention = 'Assez Bien';
        ELSE IF @moyenne BETWEEN 14 AND 16 THEN
            SET @mention = 'Bien';
        ELSE
            SET @mention = 'Très Bien';

        PRINT 'Étudiant ID: ' + CAST(@id_etudiant AS VARCHAR) + ' - Moyenne: ' + CAST(@moyenne AS VARCHAR) + ' - Mention: ' + @mention;

        FETCH NEXT FROM cursor_etudiant INTO @id_etudiant;
    END;

    CLOSE cursor_etudiant;
    DEALLOCATE cursor_etudiant;
END;
