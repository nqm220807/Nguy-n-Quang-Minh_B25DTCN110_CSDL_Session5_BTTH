
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
    --  khoảng tiền
    total_amount BETWEEN 2000000 AND 5000000

    -- : không phải CANCELLED
    AND status != 'CANCELLED'

    --  bộ lọc kép 
    AND (
        note LIKE '%gấp%'
        OR user_id IS NULL
    )

ORDER BY
    total_amount DESC   -- ưu tiên đơn đắt nhất

LIMIT 20 OFFSET 40;
