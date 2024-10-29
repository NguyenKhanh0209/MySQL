Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết 
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Trong thực tế có những lúc ta muốn tìm dữ liệu / filter theo kiểu gần đúng
-- gần đúng trên kiểu chuỗi, vd liệt kê ai đó có tên An , khác câu liệt kê ai đó bắt đầy = 'A' 
-- Tìm đúng, TOÁN TỬ = 'AN'
-- Tìm gần đúng, ko dùng =, dùng toán tử like
-- % và _
-- %: đại diện cho một chuỗi bất kì nào đó
-- _ cho một kí tự bất kì nào đó
-- VD: Name Like 'A%', bất kì ai có tên xuất hiện bằng chữ A, phần còn lại là j ko care
--     Name Like 'A_', bất kì ai có tên có 2 kí tự, chữ cái đầu là A
------------------------------------------------------------------------------------------------
-- 1. In ra ds nhân viên
SELECT * FROM Employees

-- 2. Nhân viên nào có tên bắt đầu = 'A'
SELECT * FROM Employees where FirstName = 'A%'
SELECT * FROM Employees where FirstName like 'A%'

-- 2.1 Nhân viên nào có tên bắt đầu = 'A', in ra cả full name đc ghép đầy đủ
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title FROM Employees where FirstName like 'A%'
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title FROM Employees where FirstName like 'A%'

-- 3. Tìm nhân viên có chữ A xh cuối cùng
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title FROM Employees where FirstName like '%A'

-- 4. Nhân viên nào tên có 4 kí tự
-- Dùng hàm kt độ dài tên = 4 hay ko ?
SELECT *  FROM Employees where FirstName like '____'

-- 5. Xem ds các sản phẩm/món đồ đang có 
SELECT * FROM Products

-- 6. Những sản phảm bắt đầu = Ch
SELECT * FROM Products Where ProductName like 'Ch%'

SELECT * FROM Products Where ProductName like '%Ch%' -- giữa tên có chứa Ch

-- 7. Những sp tên có 5 kí tự
SELECT * FROM Products Where ProductName like '_____'

-- 8. Những sp tên có từ cuối cùng là 5 kí tự
SELECT * FROM Products Where ProductName like '% _____'

SELECT * FROM Products Where ProductName like '% _____' or ProductName like '_____'