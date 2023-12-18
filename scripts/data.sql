-- Генерируем случайную дату
SET @start_date = CURDATE() - INTERVAL 50 YEAR;

-- Вставляем данные в таблицу "users" с ограничением по дате
INSERT INTO users (firstname, birthday)
SELECT
    CONCAT('User', FLOOR(RAND() * 1000000000)) AS firstname,
    DATE_ADD(@start_date, INTERVAL FLOOR(RAND() * 50 * 365) DAY) AS birthday
FROM (
         SELECT 1 AS n
         FROM (
                  SELECT NULL AS n
                  FROM information_schema.columns
                           LIMIT 10000  -- Измените этот лимит, если необходимо
              ) a
                  CROSS JOIN (
             SELECT NULL AS n
             FROM information_schema.columns
                      LIMIT 4000  -- Этот лимит указывает на количество блоков из 10,000 строк
         ) b
                  CROSS JOIN (
             SELECT NULL AS n
             FROM information_schema.columns
                      LIMIT 4  -- Этот лимит указывает на количество блоков из 4,000 блоков
         ) c
     ) num
    LIMIT 40000000;
