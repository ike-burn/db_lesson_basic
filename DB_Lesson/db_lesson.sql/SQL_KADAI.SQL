-- Q1 --
CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;



-- Q2 --
ALTER TABLE people ADD department_id INT unsigned AFTER email;



-- Q3 --
INSERT INTO departments (name)
VALUES 
('営業'),
('開発'), 
('経理'), 
('人事'), 
('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
VALUES
('片岡だいすけ', 'kataoka@gizumo.jp', 1, 20, 1),
('中谷みさき', 'nakatani@gizumo.jp', 1, 27, 2),
('高橋しょうた', 'takahashi@gizumo.jp', 1, 41, 1), 
('清原あやか', 'kiyohara@gizumo.jp', 2, 35, 2),
('栗山けんいち', 'kuriyama@gizumo.jp', 2, 29, 1),
('渡辺ゆうな', 'watanabe@gizumo.jp', 2, NULL, 2),
('中村かずま', NULL, 2, 55, 1),
('山本かのん', 'yamamoto@gizumo.jp', 3, 31, 2),
('小林りょうすけ', 'kobayashi@gizumo.jp', 4, 48, 1),
('古賀ひろみ', 'koga@gizumo.jp', 5, 19, NULL);

INSERT INTO reports (person_id, content)
VALUES
(2, '本日は出張で使う資料を作成しました。'),
(3, '本日は先日の商談の反省会を実施しました。'),
(4, '本日はオフィス移動に伴う挨拶まわりを実施しました。'),
(3, '本日は会議室の掃除を実施しました。'),
(6, '本日は草むしりを実施しました。'),
(2, '本日は部署内での内部交流として食事会を実施しました。'),
(3, '本日は次回の商談に向けたミーティングを実施しました。'),
(4, '本日は昇格試験の面接対策を行いました。'),
(6, '本日は新卒採用の説明会を実施しました。'),
(2, '本日は出張のため、北海道へ行きます。');



-- Q4 --
UPDATE people SET department_id = 5 WHERE person_id = 1;
UPDATE people SET department_id = 4 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 2 WHERE person_id = 4;
UPDATE people SET department_id = 1 WHERE person_id = 6;



-- Q5 --
SELECT name, age FROM people where gender = 1 ORDER BY age DESC;


 
-- Q6 --
/* 下記のSQL文は、peopleというテーブルから、営業部署所属のname、email、ageを含むカラムを、作成された順番でレコードとして取得するクエリです。*/
SELECT name, email, age FROM people where department_id = 1 ORDER BY created_at;



-- Q7 --
SELECT name FROM people WHERE  (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1);



-- Q8 --
SELECT name, age, department_id FROM people where department_id = 1 ORDER BY age;



-- Q9 --
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;



-- Q10 --
SELECT people.name, departments.name, reports.content
FROM people 
INNER JOIN departments ON people.department_id = departments.department_id
INNER JOIN reports ON people.person_id = reports.person_id;



-- Q11 --
SELECT people.name
FROM people 
LEFT  JOIN reports ON people.person_id = reports.person_id
WHERE reports.content is NULL;