/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(250) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species character(1) COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

SELECT * FROM species;
SELECT * FROM owners;

SELECT * FROM animals
ORDER BY id ASC 

BEGIN;
ALTER TABLE animals DROP COLUMN IF EXISTS species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);
COMMIT;

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER,
  species_id INTEGER,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  animal_id INTEGER,
  vet_id INTEGER,
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date),
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);

