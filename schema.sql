/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);

/* Add a column species of type string to
animals table*/
ALTER TABLE animals
ADD species VARCHAR(100);

-- Create a table named owners
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT,
    PRIMARY KEY (id)
);

-- Create a table named species
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY (id)
);
-- Remove column species
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id
ALTER TABLE animals
ADD species_id INT;

-- Make the specied_id column to hold foreign keys referencing species table
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Add column owner_id
ALTER TABLE animals
ADD owner_id INT;

-- Make the owner_id column to hold foreign keys referencing owners table
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);