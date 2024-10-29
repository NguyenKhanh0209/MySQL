Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết 
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Mệnh đề Where dùng để làm bộ lọc, lọc ra dữ liệu ta cần theo tiêu chí nào đó

-- Cú pháp dùng bộ lọc 
-- SELECT * (cột bạn muốn in ra) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
-- * ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI CỘT CÓ GIÁ TRỊ CẦN LỌC
-- CELL: 1 Ô
-- Để viết đk lọc ta cần
--    > tên cột
--    value cảu cột (cell)
--    toán tử (operator)   > >= < <= = , !=, <> ( != hoặc <> cùng ý nghĩa)
--    nhiều điều kiện lọc đi kèm, dùng thêm toán tử logic operators, AND, OR, NOT (~~~~~ J, C: ||, !)
--    ví dụ: WHERE City = N'Bình Dương'
--           WHERE City = N'Tiền Giang' AND Gpa >= 8

-- Lọc liên quan đến giá trị/value/cell chứa gì, ta phải quan tâm đến data types
-- Số: nguyên/ thực, ghi ra số như truyền thống 1, 2, 3, 5.4,...
-- Chuỗi/ Kí tự: 'A', 'Ahihi'
-- Ngày tháng năm: '2004-02-09'...

------------------------------------------------------------------------------------------------
-- 1. In ra ds các khách hàng
SELECT * FROM Customers -- 92 dòng

-- 2. In ra ds các khách hàng đến từ Ý
SELECT * FROM Customers Where Country = 'Italy'

-- 3. In ra những kh đến từ Mĩ, Ý
SELECT * FROM Customers Where Country = 'Italy' OR Country = 'USA'
SELECT * FROM Customers Where Country = 'Italy' AND Country = 'USA' -- sai, vì k thể vừa Mĩ vừa Ý

-- sort theo Ý, Mĩ để gom cùng cụm cho dễ đổi
SELECT * FROM Customers Where Country = 'Italy' OR Country = 'USA' order by Country

--4. In ra khách hàng từ thủ đô nước Germany
SELECT * FROM  Customers WHERE Country = 'Germany' AND City = 'Berlin'

--5. In ra tt nhân viên có năm sinh từ năm 1960 trở lại đây
SELECT * FROM Employees WHERE year(BirthDate) >= 1960 order by year(BirthDate)

--5. In ra tt nhân viên có tuổi từ 60 trở lên
SELECT  year(GETDATE()) - year(BirthDate) as Age, *
FROM Employees WHERE year(GETDATE()) - year(BirthDate) >= 60 order by Age

-- 6. Những nhân viên nào ở London
SELECT * FROM  Employees WHERE City = 'London'

-- 7. Những nv nào ko ở London
SELECT * FROM  Employees WHERE City != 'London'
SELECT * FROM  Employees WHERE City <> 'London'

-- Vi diệu( Đảo mệnh đề )
SELECT * FROM  Employees WHERE NOT(City = 'London')
SELECT * FROM  Employees WHERE !(City = 'London') -- sai cú pháp, đảo mệnh đề, phép ss thì dùng not

-- 8. In ra hồ sơ nhân viên có mã số 1
SELECT * FROM  Employees WHERE EmployeeID = 1 -- Kiểu số, ko có ''
-- Where trên key chi ra 1
-- Select mà có where key chỉ 1 dòng trả về, Distinct là vô nghĩa

SELECT DISTINCT EmployeeID, City From Employees Where EmployeeID = 1 order by EmployeeID

-- Công thức full ko che của Select
-- SELECT ...       FROM ...      WHERE ... GROUP BY ... HAVING ... ORDER BY
--        DISTINCT      1, N TABLE
--           HÀM()
--          NESTED QUERY/SUB QUERY

-- 9. XEM TT BÊN ĐƠN HÀNG
SELECT * FROM Orders

-- 10. XEM TT BÊN ĐƠN HÀNG SẮP XẾP GIẢM DẦN THEO TRỌNG LƯỢNG
SELECT * FROM Orders ORDER BY Freight DESC

-- 11. XEM TT BÊN ĐƠN HÀNG SẮP XẾP GIẢM DẦN THEO TRỌNG LƯỢNG, TRỌNG LƯỢNG NẰM TRONG KHOẢNG TỪ 100-500
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 ORDER BY ShipVia

-- 12. XEM TT BÊN ĐƠN HÀNG SẮP XẾP GIẢM DẦN THEO TRỌNG LƯỢNG, TRỌNG LƯỢNG NẰM TRONG KHOẢNG TỪ 100-500 VÀ SHIP BỞI CTY GIAO VẬN SỐ 1
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1

--13. Và ko ship tới London
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND ShipCity <> 'London'
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND NOT(ShipCity = 'London') 


-- Rất Cẩn thận khi trg mệnh đề Where lại có AND OR trộn với nhau, ta p xài thêm ()
-- Để phân tách thứ tự FIlter... (SS AND OR khác nữa) AND ( SS khác)


-- 14. Liệt kê KH từ MĨ Hoạc Mexico
SELECT * FROM  Customers WHERE Country = 'USA' AND Country = 'Mexico' --0
SELECT * FROM  Customers WHERE Country = 'USA' OR Country = 'Mexico' --18

-- 15. Liệt kê KH ko từ MĨ Hoạc Mexico
SELECT * FROM  Customers WHERE NOT(Country = 'USA' OR Country = 'Mexico') --73

SELECT * FROM  Customers WHERE Country <> 'USA' AND Country != 'Mexico' --73

-- 16. Liệt kê các nhân viên sinh ra trong khoảng 1960-1970
SELECT * FROM  Employees WHERE Year(BirthDate) >= 1960 AND Year(BirthDate) <= 1970 order by BirthDate DESC