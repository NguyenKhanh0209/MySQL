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