Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết 
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Trong thực tế có những lúc dữ liệu/Info chưa xác định đc nó là gì?
-- kí tên danh sách thi, ds kí tên có cột điểm, điểm ngay lúc kí tên chưa xđ đc. Sẽ update sau
-- Hiện tượng dữ liệu chưa xác định, chưa bik, tutu đưa vào sau, hiện nhin vào
-- chưa thấy có data , thì ta gọi này là NULL
-- Null là thứ đại diện cho thứ chưa xđ, ko có giá trị
-- thì k thể ss > < >= <= !=
-- ta dùng toán tử, Is null, Is not null, not(is null) để filter cell có giá trị null

------------------------------------------------------------------------------------------------
-- 1. In ra ds nhân viên
SELECT * FROM Employees

-- 2. Ai chưa xác định khu vực, region null\
SELECT * FROM Employees WHERE Region = NULL -- sai vì null ko dùng > < =
SELECT * FROM Employees WHERE Region is NULL

--3. Những ai xác định đc khu vực cư trú
SELECT * FROM Employees WHERE Region is not NULL
SELECT * FROM Employees WHERE NOT(Region is NULL)

--4. Những nhân viên đại diện kinh doanh và xác định đc nơi cư trú
SELECT * FROM Employees Where Title = 'Sales Representative' and Region is not null

--5. Liệt kê danh sách khách hàng đến tuewf ANh Pháp Mĩ, có cả tt số fax và region
SELECT * FROM Customers Where Country in('UK', 'USA', 'France') and Fax is not null and Region is not null
