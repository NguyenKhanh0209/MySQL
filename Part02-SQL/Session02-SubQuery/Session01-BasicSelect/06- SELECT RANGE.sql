Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết 
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Khi cần lọc dữ liệu trong 1 đoạn cho trc, thay vì dùng >= ... AND <= ..., ta có thể thay thế
-- Bằng mệnh đề between, in
-- * Cú pháp: Cột Between value-1 And value-2
-- * Cú phá: In... ( một tập các giá trị được liẹt kê cách nhau bằng dấu phẩy) ( In thay thế cho 1 loạt OR)


------------------------------------------------------------------------------------------------

-- 1. Liệt kê ds nhân viên sinh trong đoạn 1960 - 1970
SELECT * FROM  Employees WHERE Year(BirthDate) >= 1960 AND Year(BirthDate) <= 1970 
                         order by BirthDate DESC

SELECT * FROM  Employees WHERE Year(BirthDate) Between 1960 and 1970 
                         order by BirthDate DESC

-- 2. Liệt kê các đơn hàng có trọng lượng từ 100..500
SELECT * FROM Orders WHERE Freight between 100 and 500

-- 3. Liệt kê các đơn hàng gửi tới Anh Pháp Mĩ
SELECT * FROM Orders Where ShipCountry = 'USA' OR ShipCountry = 'France' OR ShipCountry = 'UK'

SELECT * FROM Orders Where ShipCountry in ('USA', 'France', 'UK')

-- 4. Liệt kê các đơn hàng ko gửi tới Anh Pháp Mĩ
SELECT * FROM Orders Where NOT(ShipCountry = 'USA' OR ShipCountry = 'France' OR ShipCountry = 'UK')

SELECT * FROM Orders Where ShipCountry Not in ('USA', 'France', 'UK')

-- 5. Liệt kê các đơn hàng trong năm 1996 ngoại trừ các tháng 6789
SELECT * FROM Orders Where year(OrderDate) = 1996 AND Month(OrderDate) not in (6,7,8,9)

-- LƯU Ý IN: Chỉ khi ta liệt kê đc tập giá trị thì mới chơi In
-- Khoảng số thực thì k làm được

--6. Liệt kê các đơn hàng có trọng lượng từ 100-110
SELECT * FROM Orders where Freight >= 100 and Freight <= 110 order by Freight DESC

SELECT * FROM Orders where Freight between 100 and Freight 110 order by Freight DESC

SELECT * FROM Orders where Freight In()  --100..110 vô số giá trị thực
