CREATE TABLE IF NOT EXISTS vets (
  id INT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
); 
CREATE INDEX IF NOT EXISTS vets_last_name ON vets (last_name);

CREATE TABLE IF NOT EXISTS specialties (
   id INT PRIMARY KEY,
   name VARCHAR(80)
);
CREATE INDEX IF NOT EXISTS specialties_name ON specialties (name);

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id INT NOT NULL,
  specialty_id INT NOT NULL,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (specialty_id) REFERENCES specialties(id),
  UNIQUE (vet_id,specialty_id)
);

CREATE TABLE IF NOT EXISTS types (
  id INT PRIMARY KEY,
  name VARCHAR(80)
);
CREATE INDEX IF NOT EXISTS types_name ON types (name);

CREATE TABLE IF NOT EXISTS owners (
  id INT PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  address VARCHAR(255),
  city VARCHAR(80),
  telephone VARCHAR(20)
);
CREATE INDEX IF NOT EXISTS owners_last_name ON owners (last_name);

CREATE TABLE IF NOT EXISTS pets (
  id INT PRIMARY KEY,
  name VARCHAR(30),
  birth_date DATE,
  type_id INT NOT NULL,
  owner_id INT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  FOREIGN KEY (type_id) REFERENCES types(id)
);
CREATE INDEX IF NOT EXISTS pets_name ON pets (name);

CREATE TABLE IF NOT EXISTS visits (
  id INT PRIMARY KEY,
  pet_id INT NOT NULL,
  visit_date DATE,
  description VARCHAR(255),
  FOREIGN KEY (pet_id) REFERENCES pets(id)
);
