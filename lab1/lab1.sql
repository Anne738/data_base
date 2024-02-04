CREATE DATABASE jurassic_world;

CREATE TABLE "Dinosaurs" (
  "id_dino" SERIAL PRIMARY KEY,
  "name" VARCHAR(255),
  "species" VARCHAR(255),
  "age" INT
);

CREATE TABLE "Medical_Condition" (
  "id_medical" SERIAL PRIMARY KEY,
  "id_dino" INT,
  "date" DATE,
  "condition" VARCHAR(255)
);

CREATE TABLE "Feeding_Schedule" (
  "id_feed" SERIAL PRIMARY KEY,
  "id_dino" INT,
  "date" DATE,
  "portion" INT
);

CREATE TABLE "Work_Schedule" (
  "id_schedule" SERIAL PRIMARY KEY,
  "id_dino" INT,
  "date" DATE,
  "work_hours" INT
);

ALTER TABLE "Medical_Condition" ADD FOREIGN KEY ("id_dino") REFERENCES "Dinosaurs" ("id_dino");

ALTER TABLE "Feeding_Schedule" ADD FOREIGN KEY ("id_dino") REFERENCES "Dinosaurs" ("id_dino");

ALTER TABLE "Work_Schedule" ADD FOREIGN KEY ("id_dino") REFERENCES "Dinosaurs" ("id_dino");


INSERT INTO dinosaurs (name, species, age) VALUES
    ('Tiry', 'Tyrannosaurus', 25),
    ('Timy', 'Triceratops', 18),
    ('Stery', 'Stegosaurus', 30);

INSERT INTO medical_condition (id_dino, date, condition) VALUES
    (1, '2023-12-01', 'Healthy'),
    (1, '2024-01-01', 'Healthy'),
    (2, '2024-01-01', 'Stable'),
    (3, '2024-01-01', 'Good');

INSERT INTO feeding_schedule (id_dino, date, portion) VALUES
    (1, '2024-01-02', 10),
    (1, '2024-01-03', 9),
    (2, '2024-01-02', 5),
    (2, '2024-01-03', 7),
    (3, '2024-01-02', 10),
    (3, '2024-01-03', 12);

INSERT INTO work_schedule (id_dino, date, work_hours) VALUES
    (1, '2024-01-01', 2),
    (2, '2024-01-03', 2),
    (3, '2024-01-02', 2);