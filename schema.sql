/* Database schema to keep the structure of entire database. */
DROP DATABASE if exists vet_clinic;
CREATE DATABASE vet_clinic;
CREATE TABLE IF NOT EXISTS animals (
    id INT,
    name varchar,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
ALTER TABLE animals
ADD COLUMN species varchar;

/* Vet clinic database: query multiple tables */
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar,
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar
);

ALTER TABLE animals ALTER COLUMN id 
SET NOT NULL;

ALTER TABLE animals ALTER COLUMN id 
ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals 
ADD CONSTRAINT animal_primary_key 
PRIMARY KEY(id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT species_foregn_key 
FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT owner_forign_key 
FOREIGN KEY(owner_id) REFERENCES owners(id);

/* Vet clinic database: add "join table" for visits */

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name varchar,
    age INT,
    date_of_graduation DATE);