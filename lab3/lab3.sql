-- процедури

-- пошук динозавра за його ідентифікатором
CREATE OR REPLACE PROCEDURE GetDinosaurById(IN dino_id INT)
AS $$
BEGIN
    SELECT * FROM Dinosaurs WHERE id_dino = dino_id;
END;
$$ LANGUAGE plpgsql;

-- оновлення віку динозавра
CREATE OR REPLACE PROCEDURE UpdateDinosaurAge(IN dino_id INT, IN new_age INT)
AS $$
BEGIN
    UPDATE Dinosaurs SET age = new_age WHERE id_dino = dino_id;
END;
$$ LANGUAGE plpgsql;

-- видалення динозаврів старше певного віку
CREATE OR REPLACE PROCEDURE DeleteOlderDinosaurs(IN threshold_age INT)
AS $$
BEGIN
    DELETE FROM Dinosaurs WHERE age > threshold_age;
END;
$$ LANGUAGE plpgsql;


CALL GetDinosaurById(1);
CALL UpdateDinosaurAge(2, 20);
CALL DeleteOlderDinosaurs(100);


-- функції

-- фуункція для знаходження ім'я динозавра за його ідентифікатором:

CREATE OR REPLACE FUNCTION get_dinosaur_name(dino_id INT)
RETURNS VARCHAR(255) AS $$
DECLARE
    dino_name VARCHAR(255);
BEGIN
    SELECT name INTO dino_name FROM Dinosaurs WHERE id_dino = dino_id;
    
    RETURN dino_name;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM dinosaurs

SELECT get_dinosaur_name(10)

-- функція для визначення середнього віку динозаврів певного типу:

CREATE OR REPLACE FUNCTION average_age_by_type(type_name VARCHAR(255))
RETURNS FLOAT AS $$
DECLARE
    avg_age FLOAT;
BEGIN
    SELECT AVG(age) INTO avg_age 
    FROM Dinosaurs 
    JOIN Dinosaur_Type ON Dinosaurs.id_type = Dinosaur_Type.id_type 
    WHERE Dinosaur_Type.name_type = type_name;
    
    RETURN avg_age;
END;
$$ LANGUAGE plpgsql;

SELECT average_age_by_type('Velociraptor');


-- функція для знаходження найпопулярнішого виду їжі серед динозаврів за певний період:

CREATE OR REPLACE FUNCTION find_most_popular_food(start_date DATE, end_date DATE)
RETURNS VARCHAR(255) AS $$
DECLARE
    popular_food_name VARCHAR(255);
BEGIN
    SELECT name INTO popular_food_name
    FROM (
        SELECT id_food, COUNT(*) AS food_count
        FROM Feeding_Schedule
        WHERE date BETWEEN start_date AND end_date
        GROUP BY id_food
        ORDER BY food_count DESC
        LIMIT 1
    ) AS popular_food
    JOIN Food ON popular_food.id_food = Food.id_food;
    
    RETURN popular_food_name;
END;
$$ LANGUAGE plpgsql;

SELECT find_most_popular_food('2024-01-01', '2024-12-31');


-- тригери

-- тригер для видалення динозавра із розкладу роботи та мед стану при його видаленні з бази даних
CREATE OR REPLACE FUNCTION RemoveDinosaur()
RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM Work_Schedule WHERE id_dino = OLD.id_dino;
    DELETE FROM Medical_Condition WHERE id_dino = OLD.id_dino;
    DELETE FROM feeding_schedule WHERE id_dino = OLD.id_dino;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER RemoveFromAll
BEFORE DELETE ON Dinosaurs
FOR EACH ROW
EXECUTE FUNCTION RemoveDinosaur();

SELECT 
    d.name AS dinosaur_name, 
    mc.condition AS medical_condition, 
    ws.date AS work_date, 
    ws.work_hours
FROM Dinosaurs d
JOIN Medical_Condition mc ON d.id_dino = mc.id_dino
JOIN Work_Schedule ws ON d.id_dino = ws.id_dino;

DELETE FROM Dinosaurs
WHERE id_dino = 3;

SELECT * FROM medical_condition

-- тригер для автоматичного створення нового запису в таблиці Feeding_Schedule при додаванні нового динозавра

CREATE OR REPLACE FUNCTION CreateFeedingScheduleForNewDinosaur()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion)
    VALUES (NEW.id_dino, DEFAULT, CURRENT_DATE, DEFAULT);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CreateFeedingScheduleOnDinosaurInsert
AFTER INSERT ON Dinosaurs
FOR EACH ROW
EXECUTE FUNCTION CreateFeedingScheduleForNewDinosaur();

SELECT d.name AS dinosaur_name, fs.date AS feeding_date, f.name AS food_name, fs.portion
FROM Dinosaurs d
JOIN Feeding_Schedule fs ON d.id_dino = fs.id_dino
JOIN Food f ON fs.id_food = f.id_food;

INSERT INTO Dinosaurs (name, id_type, age)
VALUES ('Tyrannosaurus*', 1, 10);



-- тригер, який перевіряє кількість занесеної їжі у таблицю Feeding_Schedule
CREATE OR REPLACE FUNCTION check_food_portion()
RETURNS TRIGGER AS $$
DECLARE
    total_portion INT;
BEGIN
    SELECT SUM(portion) INTO total_portion 
    FROM Feeding_Schedule 
    WHERE id_dino = NEW.id_dino AND date = NEW.date;

    IF total_portion > 100 THEN
        RAISE EXCEPTION 'Exceeded maximum food portion for the day';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_food_portion_trigger
BEFORE INSERT ON Feeding_Schedule
FOR EACH ROW
EXECUTE FUNCTION check_food_portion();

SELECT * FROM dinosaurs

INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion) VALUES (4, 1, '2024-03-11', 50);
INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion) VALUES (4, 2, '2024-03-11', 30);
INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion) VALUES (4, 3, '2024-03-11', 21);


INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion) VALUES (4, 4, '2024-03-11', 100);



-- DROP TRIGGER  ON ;




--транзакції

-- транзакція для вставки нового динозавра та відповідного запису в таблицю Feeding_Schedule
BEGIN;
INSERT INTO Dinosaurs (name, id_type, age) VALUES ('Tyrannosaurus', 1, 15);
INSERT INTO Feeding_Schedule (id_dino, id_food, date, portion) VALUES (LASTVAL(), 1, CURRENT_DATE, 20);
COMMIT;

-- транзакція для оновлення віку динозавра та відповідного запису в таблиці Medical_Condition
BEGIN;
UPDATE Dinosaurs SET age = 30 WHERE name = 'Tyran';
INSERT INTO Medical_Condition (id_dino, date, condition) VALUES ((SELECT id_dino FROM Dinosaurs WHERE name = 'Tyran'), CURRENT_DATE, 'Healthy');
COMMIT;

-- транзакція для видалення динозавра та всіх його записів в інших таблицях:
BEGIN;
DELETE FROM Dinosaurs WHERE name = 'Tyran';
COMMIT;

-- індекс 

CREATE INDEX idx_dinosaurs_type ON Dinosaurs (id_type);

SELECT *
FROM Dinosaurs
WHERE id_type = 1; 


SELECT * 
FROM pg_indexes 
WHERE tablename = 'dinosaurs';




SELECT * FROM feeding_schedule




















CREATE OR REPLACE FUNCTION PreventDeleteIfMedicalConditionsExist()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Medical_Condition WHERE id_dino = OLD.id_dino) THEN
        RAISE EXCEPTION 'Cannot delete dinosaur with existing medical conditions';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- тригер для обмеження видалення динозаврів із таблиці, які мають медичні стани
CREATE TRIGGER PreventDinosaurDeletion
BEFORE DELETE ON Dinosaurs
FOR EACH ROW
EXECUTE FUNCTION PreventDeleteIfMedicalConditionsExist();