Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết
-- Cú pháp chuẩn của lệnh Select
-- SELECT * FROM <TABLE> WHERE...

-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT LIKE PATTERN  NÀO ĐÓ e.g: '_____'
-- WHERE CỘT BETWEEN RANGE
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ CẦN LIỆT KÊ)

-- 1 câu select có thể trả về 1 value(cell)

-- WHERE CỘT BẰNG 1 VALUE NÀO ĐÓ , E.G: YEAR(DOB) = 2004
--           BẰNG THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL
-- KĨ THUẬT VIẾT CÂU SQL THEO KIỂU HỎI GIÁN TIẾP, LỒNG NHAU, TRONG CÂU SQL CHỨA CÂU SQL KHÁC

------------------------------------------------------------------------------------------------

-- 1. In ra ds nv
SELECT * FROM Employees
SELECT FirstName FROM Employees where EmployeeID = 1 -- 1 value
SELECT FirstName FROM Employees -- 1 tập giá trị/ 1 cột/ phép chiếu

--2. Liệt kê các nhân viên ở London
SELECT * FROM Employees where City = 'London'

--3. liệt kê các nhân viên cùng quê với King Robert
SELECT * FROM Employees where FirstName = 'Robert'
SELECT City FROM Employees where FirstName = 'Robert'

-- đáp án
SELECT * FROM Employees where City = quê Robert
SELECT * FROM Employees where City = 'London'    -- thay london = Robert

SELECT * FROM Employees where City = ( SELECT City FROM Employees where FirstName = 'Robert' )  -- trong kq vẫn còn robert nên dư
                                      and FirstName <> 'Robert' 
									  
-- 4. Liệt kê tất cả các đơn hàng
SELECT * FROM Orders order by Freight DESC

-- 4.1 Liệt kê tất cả các đơn hàng có Freight > 252 kg
SELECT * FROM Orders Where Freight >= 252 

-- 4.2 Liệt kê tất cả các đơn hàng có Freight lớn hơn Freight của đơn hàng 10555
SELECT * FROM Orders Where Freight >= (SELECT Freight FROM Orders Where OrderID = 10555) and OrderID <> 10555    order by Freight DESC

-- Bài Tập
-- 1. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận
SELECT * FROM Shippers

-- 2. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có mã số 1
SELECT * FROM Orders Where Shipvia = 1

-- 3. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận Speedy Express
SELECT * FROM Shippers Where CompanyName = 'Speedy Express'

SELECT * FROM Orders Where Shipvia = (SELECT ShipperID FROM Shippers Where CompanyName = 'Speedy Express')

-- 4. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận Speedy Express có freight từ 50 - 100
SELECT * FROM Orders Where Shipvia = (SELECT ShipperID FROM Shippers Where CompanyName = 'Speedy Express') and Freight Between 50 and 100

-- 5. Liệt kê các mặt hàng liên quan đến Filo Mix
-- Filo mix thuộc nhóm nào chưa bik
SELECT * From Categories
SELECT * From Products where CategoryID = (Select CategoryID from Products where ProductName = 'Filo Mix')

-- 6. Liệt kê nv trẻ hơn Janet
Select * From Employees where BirthDate > (Select BirthDate From Employees where FirstName = 'Janet')