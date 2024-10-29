Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết
-- Cú pháp chuẩn của lệnh Select
-- SELECT * FROM <TABLE> WHERE...
-- WHERE CỘT TOÁN TỬ SO SÁNH VỚI VALUE CẦN LỌC
--       CỘT > >= < <= != VALUE
--       DÙNG SAU SUB-QUERY TUỲ NGỮ CẢNH
-- CỘT = (SUB CHỈ CÓ 1 VALUE)
-- CỘT IN (SUB CHỈ CÓ 1 CỘT NHƯNG NHIỀU VALUE)
-- CỘT > >= < <= ALL(1 CÂU SUB 1 CỘT NHIỀU VALUE)
--               ANY(1 CÂU SUB 1 CỘT NHIỀU VALUE)
------------------------------------------------------------------------------------------------
-- tạo 1 table có 1 cọt tên là Numbr
CREATE TABLE Num (Numbr int )
select * from Num
INSERT INTO Num values (1)
INSERT INTO Num values (1)
INSERT INTO Num values (2)
INSERT INTO Num values (9)
INSERT INTO Num values (5)
INSERT INTO Num values (100)
INSERT INTO Num values (101)

-- 1. In ra những số > 5
SELECT * FROM Num where Numbr > 5

-- 2. In ra số lớn nhất trong số đã nhập
SELECT * FROM Num where Numbr >= All (SELECT * FROM Num)

-- 2. In ra số bé nhất trong số đã nhập
SELECT * FROM Num where Numbr <= All (SELECT * FROM Num)

-- 3. Nhân viên lớn tuổi nhất
SELECT * FROM Employees where BirthDate <= ALL(SELECT BirthDate from Employees)

-- 4. Đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHere Freight >= ALL(Select Freight from Orders)

