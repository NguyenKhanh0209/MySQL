USE Cartesian

-- 1. Liệt kê các cặp từ điển Anh-Việt
SELECT * FROM EnDict e, VnDict v Where e.Nmbr = v.Nmbr

SELECT * FROM EnDict e INNER JOIN VnDict v ON e.Nmbr = v.Nmbr

SELECT * FROM EnDict e JOIN VnDict v ON e.Nmbr = v.Nmbr

-- 2. Hụt mất từ 4 - four và 5 - năm k xuất hiện
-- mún xh thì tích đề các
SELECT * FROM EnDict e, VnDict

-- 3. Tui mún xuất hiện lấy tiếng Anh làm chuẩn, tìm các nghĩa TV tương đương
-- Nếu ko có tương đương vẫn phát hiện ra
SELECT * FROM EnDict e LEFT JOIN VnDict v ON e.Nmbr = v.Nmbr

SELECT * FROM EnDict e LEFT OUTER JOIN VnDict v ON e.Nmbr = v.Nmbr

--4. Tui muốn lấy tiếng Việt làm đầu 
SELECT * FROM VnDict v LEFT OUTER JOIN EnDict e ON e.Nmbr = v.Nmbr
SELECT * FROM VnDict v LEFT JOIN EnDict e ON e.Nmbr = v.Nmbr

-- Vẫn lấy  TV làm đầu mà để TV bên phải
SELECT * FROM EnDict e Right OUTER JOIN VnDict v ON e.Nmbr = v.Nmbr

-- 5. Dù chung và riêng của mỗi bên, lấy tất cả, chấp nhận FA ở 1 vế
SELECT * FROM EnDict e FULL OUTER JOIN VnDict v ON e.Nmbr = v.Nmbr

-- OUTER JOIN ĐẢM BẢO KẾT NỐI GHÉP BẢNG K BỊ MẤT DATA
-- DO INNER JOIN, JOIN = CHỈ TÌM CÁI CHUNG 2 BÊN

-- 6. IN RA NHỮNG BỘ TỪ ĐIỂN ANH VIỆT ( ANH LÀM CHUẨN ) CỦA NHỮNG CON SỐ TỪ 3 TRỞ LÊN
SELECT * FROM EnDict e LEFT JOIN VnDict v ON e.Nmbr = v.Nmbr WHERE e.Nmbr >= 3
SELECT * FROM EnDict e LEFT JOIN VnDict v ON e.Nmbr = v.Nmbr WHERE v.Nmbr >= 3

-- 7. IN RA NHỮNG BỘ TỪ ĐIỂN ANH VIỆT VIỆT ANH CỦA NHỮNG CON SỐ TỪ 3 TRỞ LÊN
SELECT * FROM EnDict e FULL JOIN VnDict v ON e.Nmbr = v.Nmbr WHERE e.Nmbr >= 3 -- MẤT 5 CỦA VN

SELECT * FROM EnDict e FULL JOIN VnDict v ON e.Nmbr = v.Nmbr WHERE V.Nmbr >= 3 -- CÓ 5 MẤT 4

SELECT * FROM EnDict e FULL JOIN VnDict v ON e.Nmbr = v.Nmbr WHERE v.Nmbr >= 3 OR e.Nmbr >=3
