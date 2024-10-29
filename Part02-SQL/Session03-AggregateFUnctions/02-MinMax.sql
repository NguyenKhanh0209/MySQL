USE Northwind

-------------------------------------------------------------------------
-- LÍ THUYẾT
-- DB ENGINE hỗ trợ 1 loạt nhóm hàng dùng thao tác trên nhóm dòng/cột, gom data tính toán
-- trên đám data gom này - nhóm hàm gom nhóm - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MAX() AVG()

-- * Cú pháp chuẩn
-- SELECT CÔT..., HÀM GOM NHÓM(),... FROM<TABLE>
-- SELECT CỘT,... HÀM GOM NHÓM(),.. FROM <TABLE> WHERE... GROUP BY... HAVING
-------------------------------------------------------------------------

-- 1. NĂM SINH NÀO LÀ BÉ NHẤT
SELECT MIN(BirthDate) from Employees
SELECT MAX(BirthDate) from Employees

--2. Ai sinh năm bé nhất
SELECT * FROM Employees WHERE BirthDate = ( SELECT MIN(BirthDate) from Employees )

SELECT * FROM Employees WHERE BirthDate <= ALL( SELECT MIN(BirthDate) from Employees )

SELECT * FROM Employees WHERE BirthDate <= ALL( SELECT BirthDate from Employees ) -- 3 câu như nhau 

-- 3. Đơn hàng nào có trọng lượng nặng nhất/ nhỏ nhất

SELECT MAX(Freight) FROM Orders 
--3.1 trọng lượng nào là lớn nhất trong các đơn hàng đã bán
select * from Orders where Freight = (SELECT MAX(Freight) FROM Orders )

-- >= ALL(Tất cả các trọng lượng)

-- 4. Tính tổng khối lượng các đơn hàng đã vận chuyển
SELECT SUM(Freight) FROM Orders 

-- Tính trung bình các đơn hàng nặng bn
SELECT AVG(Freight) FROM Orders 

-- Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả
select * from Orders where Freight >= (SELECT AVG(Freight) FROM Orders )

-- Có bn đơn hàng có trọng lương nặng hơn trọng lượng trung bình của tất cả
SELECT COUNT(*) FROM (select * from Orders 
                              where Freight >= (
							                     SELECT AVG(Freight) FROM Orders 
											   )
		            ) AS [AVG]
SELECT COUNT(*) FROM Orders
                WHERE Freight >= (
				                      SELECT AVG(Freight) FROm Orders 
								 )

-- NHẮC LẠI
-- CỘT XH TRONG SELECT HÀM Ý THEO CỘT NÀY
-- TỈNH , <ĐẾM CÁI GÌ ĐÓ CỦA TỈNH> -> RÕ RÀNG P CHIA THEO TỈNH MÀ ĐẾM , GROUP BY TỈNH

--CHUYÊN NGÀNH , <ĐẾM CỦA CHUYÊN NGÀNH> -> CHIA THEO CN MÀ ĐẾM , GROUP BY CHUYÊN NGÀNH

-- CÓ QUYỀN GRP BY TRÊN NHIỀU CỘT

-- MÃ CHUYÊN NGÀNH, TÊN CHUYÊN NGÀNH <SL SV> ->  GROUP BY MÃ CHUYÊN NGÀNH, TÊN CHUYÊN NGÀNH

-- ÔN TẬP
-- 1. In ra ds nhân viên
SELECT * FROM Employees order by Region

-- 2. Đếm xem mỗi khu vực có bao nhiêu nv
SELECT COUNT(*) FROM Employees GROUP BY Region

SELECT COUNT(Region) FROM Employees GROUP BY Region -- đếm region, ko đếm null nên là 0 và WA có 5

SELECT Region ,COUNT(Region) FROM Employees GROUP BY Region --  sai do đếm null
SELECT Region ,COUNT(*) FROM Employees GROUP BY Region -- đúng do đếm dòng

-- 3. Khảo sát đơn hàng
SELECT * FROM Orders

-- Mỗi quốc gia có bao nhiêu đơn hàng
SELECT ShipCountry,COUNT(*) FROM Orders group by ShipCountry

-- 4. Quốc gia nào có từ 100 đơn hàng 
SELECT ShipCountry,COUNT(*) AS [No orders] FROM Orders group by ShipCountry Having COUNT(*) >= 100

-- 5. Quốc gia nào có nhiều đơn hàng nhất 
SELECT MAX([No orders]) FROM (SELECT ShipCountry,COUNT(*) AS [No orders] FROM Orders group by ShipCountry) as country

SELECT ShipCountry,COUNT(*) AS [No orders] FROM Orders group by ShipCountry Having COUNT(*) >= (
SELECT MAX([No orders]) FROM (SELECT ShipCountry,COUNT(*) AS [No orders] FROM Orders group by ShipCountry) as country)

-- 6. Liệt kê các đơn hàng của K/H có mã số VINET
SELECT * FROM Orders WHERE CustomerID = 'VINET'

-- 7. VINET đã mua bao nhiêu lần 
SELECT CustomerID ,COUNT(*) FROM Orders WHERE CustomerID = 'VINET' group by CustomerID -- phải có group by để đếm theo VINET

SELECT CustomerID ,COUNT(*) FROM Orders group by CustomerID Having CustomerID = 'VINET' -- having chia theo mã kh mà đếm



  