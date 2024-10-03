DELIMITER $$
CREATE PROCEDURE fibonacciseries(
    IN n INT
)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 1;
    DECLARE temp INT ;
    DECLARE i INT DEFAULT 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS FibonacciNumbers (
        number INT
    );

    WHILE i < n DO
        INSERT INTO FibonacciNumbers (number) VALUES (a);
        SET temp = a + b;
        SET a = b;
        SET b = temp;
        SET i = i + 1;
    END WHILE;

    SELECT * FROM FibonacciNumbers;

    DROP TEMPORARY TABLE IF EXISTS FibonacciNumbers;
END $$
DELIMITER ;

CALL fibonacciseries(10);
