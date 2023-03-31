/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


SELECT * FROM public.animals
ORDER BY id ASC 

BEGIN;
DELETE FROM animals where id=0;
COMMIT;

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg, species)

	VALUES ('Ditto', '2022-05-14', 4, true, 22, '');
	
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;

COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK;
SELECT * FROM public.animals
ORDER BY id ASC

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;

SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = -1 * weight_kg;
SELECT * FROM animals;

ROLLBACK TO SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
SELECT * FROM animals;

COMMIT;


SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) as total_escapes 
FROM animals 
GROUP BY neutered 
ORDER BY total_escapes DESC 
LIMIT 1;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight 
FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) as avg_escapes 
FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' 
GROUP BY species;

SELECT * FROM public.animals
ORDER BY id ASC

BEGIN;
UPDATE animals SET date_of_birth = '1998-10-13' WHERE date_of_birth = '1998-09-13';
COMMIT;

SELECT species, AVG(escape_attempts) 
FROM animals
WHERE date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31'
GROUP BY species;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
