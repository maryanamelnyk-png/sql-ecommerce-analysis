-- Обчислює середні витрати користувачів (avg_user_spending)
-- і відбирає лише тих, чия середня сума більша за середній показник по всій базі.
-- Це допомагає визначити найцінніших клієнтів (top spenders).
SELECT user_id,
AVG(total_edited) AS avg_user_spending
FROM melnyk_ecommerce_project
WHERE CAST(total_edited AS REAL) > 0
GROUP BY user_id
HAVING AVG(total_edited) > (
   SELECT AVG(CAST(total_edited AS REAL))
   FROM melnyk_ecommerce_project
   WHERE CAST(total_edited AS REAL) > 0
);

--Розраховує загальний обсяг продажів по країнах.
--Дає змогу визначити на яких ринках компанія має більший дохід.
SELECT country,
SUM (total_edited) AS total_sales
FROM melnyk_ecommerce_project mep
GROUP BY country;

--Рахує кількість повернених або скасованих замовлень у кожній країні.
--Важливо для визначення рівня задоволеності сервісом та покращення логістики.
SELECT country,
COUNT(*) AS returned_or_cancelled_order
FROM melnyk_ecommerce_project
WHERE delivery_status IN ('Returned', 'Cancelled')
GROUP BY country
ORDER BY returned_or_cancelled_order DESC;

--Рахує загальну кількість повернених та скасованих замовлень
--Дає загальну картину рівня проблеми по доставках.
SELECT COUNT (*) AS canselled_orders
FROM melnyk_ecommerce_project mep 
WHERE mep.delivery_status IN ('Cancelled','Returned');

--Обчислює середні витрати користувачів і відбирає тих, чия середня сума більша за середній показник по всій базі.
--Це допомагає визначити віп-клієнтів.
SELECT user_id,
AVG(total_edited) AS avg_user_spending
FROM melnyk_ecommerce_project
WHERE CAST(total_edited AS REAL) > 0
GROUP BY user_id
HAVING AVG(total_edited) > (
   SELECT AVG(CAST(total_edited AS REAL))
   FROM melnyk_ecommerce_project
   WHERE CAST(total_edited AS REAL) > 0
);