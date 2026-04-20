
CREATE DATABASE order_management;
USE order_management;

CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    total_amount DECIMAL(12, 0),
    status VARCHAR(20),
    note VARCHAR(255),
    user_id INT
);

INSERT INTO Orders (total_amount, status, note, user_id) VALUES
(1500000, 'COMPLETED', 'đơn thường', 1),
(2500000, 'COMPLETED', 'giao gấp', 2),
(3000000, 'PENDING', 'khách yêu cầu gấp', NULL),
(4500000, 'COMPLETED', 'đơn VIP', 3),
(4800000, 'PENDING', 'gấp trong ngày', NULL),
(5200000, 'COMPLETED', 'đơn lớn', 4),
(2200000, 'COMPLETED', 'không ghi chú', 5),
(2700000, 'CANCELLED', 'gấp nhưng hủy', NULL),
(4100000, 'COMPLETED', 'giao gấp', 6),
(3900000, 'PENDING', 'bình thường', NULL),
(2000000, 'COMPLETED', 'gấp nhẹ', 7),
(5000000, 'COMPLETED', 'gấp cực', NULL),
(3300000, 'COMPLETED', 'test đơn', 8),
(4700000, 'PENDING', 'gấp xử lý', NULL),
(2100000, 'COMPLETED', 'khách mới', 9),
(2600000, 'COMPLETED', 'gấp giao', NULL),
(4300000, 'COMPLETED', 'đơn lớn gấp', 10),
(2400000, 'PENDING', 'test', NULL),
(3600000, 'COMPLETED', 'gấp', 11),
(2800000, 'COMPLETED', 'ok', NULL),
(2900000, 'COMPLETED', 'gấp', 12),
(3100000, 'PENDING', 'gấp', NULL),
(4200000, 'COMPLETED', 'urgent gấp', 13),
(4600000, 'COMPLETED', 'gấp ngay', NULL),
(3400000, 'PENDING', 'test', 14),
(3700000, 'COMPLETED', 'gấp', NULL),
(4400000, 'COMPLETED', 'VIP gấp', 15),
(2300000, 'COMPLETED', 'normal', NULL),
(3800000, 'PENDING', 'gấp', 16),
(4900000, 'COMPLETED', 'gấp xử lý', NULL),
(2550000, 'COMPLETED', 'test', 17),
(2650000, 'COMPLETED', 'gấp', NULL),
(2750000, 'PENDING', 'ok', 18),
(2850000, 'COMPLETED', 'gấp', NULL),
(2950000, 'COMPLETED', 'test', 19),
(3050000, 'PENDING', 'gấp', NULL),
(3150000, 'COMPLETED', 'gấp', 20),
(3250000, 'COMPLETED', 'ok', NULL),
(3350000, 'PENDING', 'gấp', 21),
(3450000, 'COMPLETED', 'gấp', NULL),
(3550000, 'COMPLETED', 'test', 22),
(3650000, 'PENDING', 'gấp', NULL),
(3750000, 'COMPLETED', 'gấp', 23),
(3850000, 'COMPLETED', 'ok', NULL),
(3950000, 'PENDING', 'gấp', 24),
(4050000, 'COMPLETED', 'gấp', NULL),
(4150000, 'COMPLETED', 'test', 25),
(4250000, 'PENDING', 'gấp', NULL),
(4350000, 'COMPLETED', 'gấp', 26),
(4450000, 'COMPLETED', 'ok', NULL);

SELECT
    id,
    total_amount,
    status,
    note,
    user_id,
    CASE
        WHEN total_amount > 4000000 THEN 'Nguy hiểm'
        ELSE 'Bình thường'
    END AS Alert_Level
FROM Orders
WHERE
    total_amount BETWEEN 2000000 AND 5000000
    AND status <> 'CANCELLED'
    AND (
        note LIKE '%gấp%'
        OR user_id IS NULL
    )
ORDER BY total_amount DESC
LIMIT 20 OFFSET 40;

CREATE INDEX idx_orders_filter 
ON Orders (total_amount, status, user_id);