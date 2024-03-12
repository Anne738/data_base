
-- Запит 1. Вибрати всі записи з таблиці Dinosaurs
SELECT * FROM Dinosaurs;

-- Запит 2. Вибрати всі типи динозаврів з таблиці Dinosaur_Type
SELECT * FROM Dinosaur_Type;

-- Запит 3. Вибрати всі записи з таблиці Medical_Condition
SELECT * FROM Medical_Condition;

-- Запит 4. Вибрати всі записи з таблиці Feeding_Schedule
SELECT * FROM Feeding_Schedule;

-- Запит 5. Вибрати всі записи з таблиці Food
SELECT * FROM Food;

-- Запит 6. Вибрати всі записи з таблиці Work_Schedule
SELECT * FROM Work_Schedule;

-- Запит 7. Вибрати всіх динозаврів, які мають тип "Tyrannosaurus Rex"
SELECT * FROM Dinosaurs WHERE id_type = (SELECT id_type FROM Dinosaur_Type WHERE name_type = 'Tyrannosaurus Rex');

-- Запит 8. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра - "Broken rib"
SELECT * FROM Medical_Condition WHERE condition = 'Broken rib';

-- Запит 9. Вибрати всі записи з таблиці Feeding_Schedule, де порція більше 10
SELECT * FROM Feeding_Schedule WHERE portion > 10;

-- Запит 10. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин більше або рівна 8
SELECT * FROM Work_Schedule WHERE work_hours >= 8;

-- Запит 11. Вибрати всі записи з таблиці Food, де тип їжі - "Carnivore"
SELECT * FROM Food WHERE type = 'Carnivore';

-- Запит 12. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра більше 10 років
SELECT * FROM Dinosaurs WHERE age > 10;

-- Запит 13. Вибрати всі записи з таблиці Medical_Condition, де дата - '2024-02-20'
SELECT * FROM Medical_Condition WHERE date = '2024-02-20';

-- Запит 14. Вибрати всі записи з таблиці Feeding_Schedule, де дата - '2024-02-21'
SELECT * FROM Feeding_Schedule WHERE date = '2024-02-21';

-- Запит 15. Вибрати всі записи з таблиці Work_Schedule, де дата - '2024-02-22'
SELECT * FROM Work_Schedule WHERE date = '2024-02-22';

-- Запит 16. Вибрати всі записи з таблиці Dinosaurs, де ім'я починається на 'T-Rex'
SELECT * FROM Dinosaurs WHERE name LIKE 'T-Rex%';

-- Запит 17. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра починається на 'Sore'
SELECT * FROM Medical_Condition WHERE condition LIKE 'Sore%';

-- Запит 18. Вибрати всі записи з таблиці Food, де ім'я починається на 'Meat'
SELECT * FROM Food WHERE name LIKE 'Meat%';

-- Запит 19. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра менше 15 років
SELECT * FROM Dinosaurs WHERE age < 15;

-- Запит 20. Вибрати всі записи з таблиці Medical_Condition, де дата більша '2024-02-20' і менша '2024-02-22'
SELECT * FROM Medical_Condition WHERE date > '2024-02-20' AND date < '2024-02-22';

-- Запит 21. Вибрати всі записи з таблиці Feeding_Schedule, де порція менше або дорівнює 15
SELECT * FROM Feeding_Schedule WHERE portion <= 15;

-- Запит 22. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин менше 8
SELECT * FROM Work_Schedule WHERE work_hours < 8;

-- Запит 23. Вибрати всі записи з таблиці Dinosaurs, які мають тип "Velociraptor" та вік менше 10 років
SELECT * FROM Dinosaurs WHERE id_type = (SELECT id_type FROM Dinosaur_Type WHERE name_type = 'Velociraptor') AND age < 10;

-- Запит 24. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра не рівний "Healthy"
SELECT * FROM Medical_Condition WHERE condition <> 'Healthy';

-- Запит 25. Вибрати всі записи з таблиці Feeding_Schedule, де ідентифікатор їжі дорівнює 1 та дата - '2024-02-20'
SELECT * FROM Feeding_Schedule WHERE id_food = 1 AND date = '2024-02-20';

-- Запит 26. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин дорівнює 7 та дата - '2024-02-21'
SELECT * FROM Work_Schedule WHERE work_hours = 7 AND date = '2024-02-21';

-- Запит 27. Вибрати всі записи з таблиці Dinosaurs, де ім'я закінчується на '2'
SELECT * FROM Dinosaurs WHERE name LIKE '%2';

-- Запит 28. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра закінчується на 'infection'
SELECT * FROM Medical_Condition WHERE condition LIKE '%infection';

-- Запит 29. Вибрати всі записи з таблиці Food, де тип їжі починається на 'Herb'
SELECT * FROM Food WHERE type LIKE 'Herb%';

-- Запит 30. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра більший або дорівнює 20 рокам
SELECT * FROM Dinosaurs WHERE age >= 20;

-- Запит 31. Вибрати всі записи з таблиці Medical_Condition, де дата менша або дорівнює '2024-02-21'
SELECT * FROM Medical_Condition WHERE date <= '2024-02-21';

-- Запит 32. Вибрати всі записи з таблиці Feeding_Schedule, де порція більша або дорівнює 18
SELECT * FROM Feeding_Schedule WHERE portion >= 18;

-- Запит 33. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин менша або дорівнює 6
SELECT * FROM Work_Schedule WHERE work_hours <= 6;

-- Запит 34. Вибрати всі записи з таблиці Dinosaurs, які мають тип "Triceratops" і вік більший або дорівнює 15 рокам
SELECT * FROM Dinosaurs WHERE id_type = (SELECT id_type FROM Dinosaur_Type WHERE name_type = 'Triceratops') AND age >= 15;

-- Запит 35. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра не починається з 'Healthy'
SELECT * FROM Medical_Condition WHERE condition NOT LIKE 'Healthy%';

-- Запит 36. Вибрати всі записи з таблиці Feeding_Schedule, де ідентифікатор їжі не рівний 3
SELECT * FROM Feeding_Schedule WHERE id_food <> 3;

-- Запит 37. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин не дорівнює 8
SELECT * FROM Work_Schedule WHERE work_hours != 8;

-- Запит 38. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра менший за 5 років
SELECT * FROM Dinosaurs WHERE age < 5;

-- Запит 39. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра не закінчується на 'foot'
SELECT * FROM Medical_Condition WHERE condition NOT LIKE '%foot';

-- Запит 40. Вибрати всі записи з таблиці Food, де тип їжі не дорівнює 'Carnivore'
SELECT * FROM Food WHERE type != 'Carnivore';

-- Запит 41. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин не менша або дорівнює 7
SELECT * FROM Work_Schedule WHERE work_hours >= 7;

-- Запит 42. Вибрати всі записи з таблиці Dinosaurs, де ім'я починається на 'Brachiosaurus'
SELECT * FROM Dinosaurs WHERE name LIKE 'Brachiosaurus%';

-- Запит 43. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра починається на 'Sore' та дата - '2024-02-21'
SELECT * FROM Medical_Condition WHERE condition LIKE 'Sore%' AND date = '2024-02-21';

-- Запит 44. Вибрати всі записи з таблиці Feeding_Schedule, де ідентифікатор їжі менший за 3 та дата - '2024-02-20'
SELECT * FROM Feeding_Schedule WHERE id_food < 3 AND date = '2024-02-20';

-- Запит 45. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин більша за 6 та менша за 8
SELECT * FROM Work_Schedule WHERE work_hours > 6 AND work_hours < 8;

-- Запит 46. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра менший або дорівнює 12 рокам
SELECT * FROM Dinosaurs WHERE age <= 12;

-- Запит 47. Вибрати всі записи з таблиці Medical_Condition, де дата менша за '2024-02-22' та стан динозавра не рівний 'Healthy'
SELECT * FROM Medical_Condition WHERE date < '2024-02-22' AND condition != 'Healthy';

-- Запит 48. Вибрати всі записи з таблиці Feeding_Schedule, де порція менша або дорівнює 10 та дата - '2024-02-21'
SELECT * FROM Feeding_Schedule WHERE portion <= 10 AND date = '2024-02-21';

-- Запит 49. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин більша або дорівнює 7 та дата - '2024-02-22'
SELECT * FROM Work_Schedule WHERE work_hours >= 7 AND date = '2024-02-22';

-- Запит 50. Вибрати всі записи з таблиці Dinosaurs, де ім'я закінчується на '1'
SELECT * FROM Dinosaurs WHERE name LIKE '%1';

-- Запит 51. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра починається на 'In'
SELECT * FROM Medical_Condition WHERE condition LIKE 'In%';

-- Запит 52. Вибрати всі записи з таблиці Food, де тип їжі починається на 'Herb' і містить слово 'Plants'
SELECT * FROM Food WHERE type LIKE 'Herb%' AND name LIKE '%Plants%';

-- Запит 53. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра більший за 15 і менший за 20 років
SELECT * FROM Dinosaurs WHERE age > 15 AND age < 20;

-- Запит 54. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра закінчується на 'ion' і дата - '2024-02-20'
SELECT * FROM Medical_Condition WHERE condition LIKE '%ion' AND date = '2024-02-20';

-- Запит 55. Вибрати всі записи з таблиці Feeding_Schedule, де порція менша за 5 та ідентифікатор їжі - 2
SELECT * FROM Feeding_Schedule WHERE portion < 5 AND id_food = 2;

-- Запит 56. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин дорівнює 6 та дата - '2024-02-20'
SELECT * FROM Work_Schedule WHERE work_hours = 6 AND date = '2024-02-20';

-- Запит 57. Вибрати всі записи з таблиці Dinosaurs, де тип динозавра - "Brachiosaurus" і вік більший або дорівнює 22 рокам
SELECT * FROM Dinosaurs WHERE id_type = (SELECT id_type FROM Dinosaur_Type WHERE name_type = 'Brachiosaurus') AND age >= 22;

-- Запит 58. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра - "Infection" та дата - '2024-02-22'
SELECT * FROM Medical_Condition WHERE condition = 'Infection' AND date = '2024-02-22';

-- Запит 59. Вибрати всі записи з таблиці Feeding_Schedule, де порція більша або дорівнює 20 та дата - '2024-02-21'
SELECT * FROM Feeding_Schedule WHERE portion >= 20 AND date = '2024-02-21';

-- Запит 60. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин менша або дорівнює 5 та дата - '2024-02-22'
SELECT * FROM Work_Schedule WHERE work_hours <= 5 AND date = '2024-02-22';

-- Запит 61. Вибрати всі записи з таблиці Dinosaurs, де ім'я не починається на 'T-Rex'
SELECT * FROM Dinosaurs WHERE name NOT LIKE 'T-Rex%';

-- Запит 62. Вибрати всі записи з таблиці Medical_Condition, де стан динозавра починається на 'Sore' і має дату - '2024-02-21'
SELECT * FROM Medical_Condition WHERE condition LIKE 'Sore%' AND date = '2024-02-21';

-- Запит 63. Вибрати всі записи з таблиці Feeding_Schedule, де порція менша або дорівнює 6 та дата - '2024-02-22'
SELECT * FROM Feeding_Schedule WHERE portion <= 6 AND date = '2024-02-22';

-- Запит 64. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин менша або дорівнює 6 та дата - '2024-02-20'
SELECT * FROM Work_Schedule WHERE work_hours <= 6 AND date = '2024-02-20';

-- Запит 65. Вибрати всі записи з таблиці Dinosaurs, де ім'я закінчується на 'saurus'
SELECT * FROM Dinosaurs WHERE name LIKE '%saurus';

-- Запит 67. Вибрати всі записи з таблиці Dinosaurs та відсортувати їх за віком у спадаючому порядку
SELECT *
FROM Dinosaurs
ORDER BY age DESC;

-- Запит 68. Вибрати всі записи з таблиці Feeding_Schedule та відсортувати їх за порцією у зростаючому порядку
SELECT *
FROM Feeding_Schedule
ORDER BY portion;

-- Запит 69. Підрахувати кількість записів в таблиці Medical_Condition для кожного стану, але вивести тільки ті, у яких кількість записів більше 1
SELECT condition, COUNT(*) AS num_records
FROM Medical_Condition
GROUP BY condition
HAVING COUNT(*) > 1;

-- Запит 70. Вибрати всі записи з таблиці Work_Schedule та відсортувати їх за датою, але вивести тільки ті, які мають кількість робочих годин більше 5
SELECT *
FROM Work_Schedule
WHERE work_hours > 5
ORDER BY date;

-- Запит 71. Підрахувати загальну кількість порцій їжі для кожного типу їжі та відфільтрувати тільки ті, у яких загальна кількість порцій більше 50
SELECT id_food, SUM(portion) AS total_portions
FROM Feeding_Schedule
GROUP BY id_food
HAVING SUM(portion) > 50;

-- Запит 72. Вибрати всі записи з таблиці Dinosaurs разом з їхніми типами
SELECT d.*, dt.name_type
FROM Dinosaurs AS d
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 73. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про динозаврів (імена)
SELECT mc.*, d.name
FROM Medical_Condition AS mc
INNER JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino;

-- Запит 74. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи їжі
SELECT fs.*, f.name AS food_name, f.type AS food_type
FROM Feeding_Schedule AS fs
INNER JOIN Food AS f ON fs.id_food = f.id_food;

-- Запит 75. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про динозаврів (імена)
SELECT ws.*, d.name
FROM Work_Schedule AS ws
INNER JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino;

-- Запит 70. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про динозаврів (імена) та їхніми типами
SELECT mc.*, d.name, dt.name_type
FROM Medical_Condition AS mc
INNER JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 71. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи їжі та динозаврів (імена)
SELECT fs.*, f.name AS food_name, f.type AS food_type, d.name AS dinosaur_name
FROM Feeding_Schedule AS fs
INNER JOIN Food AS f ON fs.id_food = f.id_food
INNER JOIN Dinosaurs AS d ON fs.id_dino = d.id_dino;

-- Запит 72. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про динозаврів (імена) та їхніми типами
SELECT ws.*, d.name, dt.name_type
FROM Work_Schedule AS ws
INNER JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 73. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про типи динозаврів та їхні імена
SELECT mc.*, dt.name_type, d.name
FROM Medical_Condition AS mc
INNER JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 74. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи динозаврів та їхні імена
SELECT fs.*, dt.name_type, d.name
FROM Feeding_Schedule AS fs
INNER JOIN Dinosaurs AS d ON fs.id_dino = d.id_dino
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 75. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про типи динозаврів та їхні імена
SELECT ws.*, dt.name_type, d.name
FROM Work_Schedule AS ws
INNER JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino
INNER JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 76. Вибрати всі записи з таблиці Dinosaurs разом з їхніми типами, включаючи всіх динозаврів навіть якщо для них не встановлено тип
SELECT d.*, dt.name_type
FROM Dinosaurs AS d
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 77. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про динозаврів (імена), включаючи інформацію про динозаврів навіть якщо для них не встановлено жодних медичних умов
SELECT mc.*, d.name
FROM Medical_Condition AS mc
LEFT JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino;

-- Запит 78. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи їжі, включаючи всі записи з таблиці Feeding_Schedule навіть якщо для них не встановлено жодного типу їжі
SELECT fs.*, f.name AS food_name, f.type AS food_type
FROM Feeding_Schedule AS fs
LEFT JOIN Food AS f ON fs.id_food = f.id_food;

-- Запит 79. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про динозаврів (імена), включаючи всі записи з таблиці Work_Schedule навіть якщо для них не встановлено жодної робочої години
SELECT ws.*, d.name
FROM Work_Schedule AS ws
LEFT JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino;

-- Запит 80. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про динозаврів (імена) та їхніми типами, включаючи всі записи з таблиці Medical_Condition навіть якщо для них не встановлено жодного стану
SELECT mc.*, d.name, dt.name_type
FROM Medical_Condition AS mc
LEFT JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 81. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи їжі та динозаврів (імена), включаючи всі записи з таблиці Feeding_Schedule навіть якщо для них не встановлено жодного типу їжі або динозавра
SELECT fs.*, f.name AS food_name, f.type AS food_type, d.name AS dinosaur_name
FROM Feeding_Schedule AS fs
LEFT JOIN Food AS f ON fs.id_food = f.id_food
LEFT JOIN Dinosaurs AS d ON fs.id_dino = d.id_dino;

-- Запит 82. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про динозаврів (імена) та їхніми типами, включаючи всі записи з таблиці Work_Schedule навіть якщо для них не встановлено жодної робочої години
SELECT ws.*, d.name, dt.name_type
FROM Work_Schedule AS ws
LEFT JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 83. Вибрати всі записи з таблиці Medical_Condition разом з інформацією про типи динозаврів та їхні імена, включаючи всі записи з таблиці Medical_Condition навіть якщо для них не встановлено жодного стану
SELECT mc.*, dt.name_type, d.name
FROM Medical_Condition AS mc
LEFT JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 84. Вибрати всі записи з таблиці Feeding_Schedule разом з інформацією про типи динозаврів та їхні імена, включаючи всі записи з таблиці Feeding_Schedule навіть якщо для них не встановлено жодного типу їжі або динозавра
SELECT fs.*, dt.name_type, d.name
FROM Feeding_Schedule AS fs
LEFT JOIN Dinosaurs AS d ON fs.id_dino = d.id_dino
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 85. Вибрати всі записи з таблиці Work_Schedule разом з інформацією про типи динозаврів та їхні імена, включаючи всі записи з таблиці Work_Schedule навіть якщо для них не встановлено жодної робочої години
SELECT ws.*, dt.name_type, d.name
FROM Work_Schedule AS ws
LEFT JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino
LEFT JOIN Dinosaur_Type AS dt ON d.id_type = dt.id_type;

-- Запит 86. Вибрати всі записи з таблиці Dinosaurs, де ім'я динозавра співпадає з ім'ям у таблиці Medical_Condition
SELECT d.*
FROM Dinosaurs AS d
INNER JOIN Medical_Condition AS mc ON d.name = mc.condition;

-- Запит 87. Вибрати всі записи з таблиці Feeding_Schedule, де ідентифікатор їжі співпадає з ідентифікатором у таблиці Food
SELECT fs.*
FROM Feeding_Schedule AS fs
INNER JOIN Food AS f ON fs.id_food = f.id_food;

-- Запит 88. Вибрати всі записи з таблиці Work_Schedule, де ідентифікатор динозавра співпадає з ідентифікатором у таблиці Dinosaurs
SELECT ws.*
FROM Work_Schedule AS ws
INNER JOIN Dinosaurs AS d ON ws.id_dino = d.id_dino;

-- Запит 89. Вибрати всі записи з таблиці Medical_Condition, де ідентифікатор динозавра співпадає з ідентифікатором у таблиці Dinosaurs
SELECT mc.*
FROM Medical_Condition AS mc
INNER JOIN Dinosaurs AS d ON mc.id_dino = d.id_dino;

-- Запит 90. Вибрати всі записи з таблиці Feeding_Schedule, де ідентифікатор динозавра співпадає з ідентифікатором у таблиці Dinosaurs
SELECT fs.*
FROM Feeding_Schedule AS fs
INNER JOIN Dinosaurs AS d ON fs.id_dino = d.id_dino;

-- Запит 91. Вибрати всі записи з таблиці Work_Schedule, де дата з таблиці Work_Schedule співпадає з датою з таблиці Medical_Condition
SELECT ws.*
FROM Work_Schedule AS ws
INNER JOIN Medical_Condition AS mc ON ws.date = mc.date;

-- Запит 92. Вибрати всі записи з таблиці Feeding_Schedule, де дата з таблиці Feeding_Schedule співпадає з датою з таблиці Work_Schedule
SELECT fs.*
FROM Feeding_Schedule AS fs
INNER JOIN Work_Schedule AS ws ON fs.date = ws.date;

-- Запит 93. Вибрати всі записи з таблиці Dinosaurs, де вік динозавра менший за вік у таблиці Medical_Condition
SELECT d.*
FROM Dinosaurs AS d
INNER JOIN Medical_Condition AS mc ON d.age < mc.age;

-- Запит 94. Вибрати всі записи з таблиці Food, де ідентифікатор їжі співпадає з ідентифікатором у таблиці Feeding_Schedule
SELECT f.*
FROM Food AS f
INNER JOIN Feeding_Schedule AS fs ON f.id_food = fs.id_food;

-- Запит 95. Вибрати всі записи з таблиці Dinosaurs, де ідентифікатор динозавра співпадає з ідентифікатором у таблиці Feeding_Schedule
SELECT d.*
FROM Dinosaurs AS d
INNER JOIN Feeding_Schedule AS fs ON d.id_dino = fs.id_dino;

-- Запит 96. Вибрати всі записи з таблиці Dinosaur_Type, де ідентифікатор типу динозавра співпадає з ідентифікатором у таблиці Dinosaurs
SELECT dt.*
FROM Dinosaur_Type AS dt
INNER JOIN Dinosaurs AS d ON dt.id_type = d.id_type;

-- Запит 97. Вибрати всі записи з таблиці Dinosaur_Type, де тип динозавра співпадає з іменем у таблиці Dinosaurs
SELECT dt.*
FROM Dinosaur_Type AS dt
INNER JOIN Dinosaurs AS d ON dt.name_type = d.name;

-- Запит 98. Вибрати всі записи з таблиці Feeding_Schedule, де порція з таблиці Feeding_Schedule співпадає з порцією у таблиці Work_Schedule
SELECT fs.*
FROM Feeding_Schedule AS fs
INNER JOIN Work_Schedule AS ws ON fs.portion = ws.work_hours;

-- Запит 99. Вибрати всі записи з таблиці Feeding_Schedule, де дата з таблиці Feeding_Schedule співпадає з датою у таблиці Medical_Condition
SELECT fs.*
FROM Feeding_Schedule AS fs
INNER JOIN Medical_Condition AS mc ON fs.date = mc.date;

-- Запит 100. Вибрати всі записи з таблиці Work_Schedule, де кількість робочих годин з таблиці Work_Schedule співпадає з порцією у таблиці Feeding_Schedule
SELECT ws.*
FROM Work_Schedule AS ws
INNER JOIN Feeding_Schedule AS fs ON ws.work_hours = fs.portion;





SELECT DISTINCT d.name, mc.date
FROM Dinosaurs as d
JOIN Medical_Condition AS mc ON d.id_dino = mc.id_dino
WHERE EXTRACT (YEAR FROM mc.date) = 2024;