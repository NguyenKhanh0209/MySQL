USE Northwind


------------------------------------------------------------------------------------------------
-- lí thuyết
-- Một DB là nơi chứa data (bán hàng, thư viện,...)
-- Data đc lưu dưới dạng table, tách thành nhiều table
-- Dùng lệnh select để xem/ in dữ liệu từ table, cx hiển thị dưới dạng table  
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Cú pháp mở rộng:
--                 SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-DẤU-PHẨY FROM <TÊN-TABLE>
                   
-- SELECT có thể dùng các hàm xử lí các cột để độ lại thông tin hiển thị
-- From <TÊN-Table>

-- Data trả về có cell/ô có NULL, hiểu rằng chưa xác định value
-- từ từ cập nhật sau
------------------------------------------------------------------------------------------------

-- 1. Xem thong tin của tất cả khách hàng đang giao dịch với mình
SELECT * FROM Customers
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
                   VALUES('ALFKI', 'FPT University', 'Thanh Nguyen Khac')
				   -- lỗi vì trùng
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
                   VALUES('FPTU', 'FPT University', 'Thanh Nguyen Khac')
				   -- chạy được



--2. Xem thông tin nhân viên, xem hết các cột
SELECT * FROM Employees

-- 3. Xem các sản phẩm có trong kho
SELECT * FROM Products

--4. Mua hàng, thì thông tin sẽ nằm ở table Orders và OrderDetail
SELECT * FROM Orders -- 830 bills

--5. Xem tt cty giao hàng
SELECT * FROM Shippers
INSERT INTO Shippers(CompanyName, Phone) VALUES('Fedex Vietnam', '(084)90...')

--6. Xem chi tiết mua hàng
SELECT * FROM Orders           -- phần trên của bill siêu thị
SELECT * FROM [Order Details]  -- phần table kẻ gióng lề những món hàng đã mua

-- 7. In ra thông tin khách hàng, chỉ gồm cột id, ComName, ContactName, Country
SELECT CustomerID, CompanyName, ContactName, Country  FROM Customers

-- 8. In ra thông tin nhân viên, chỉ cần ID, Last, First, Title, DOB
-- Tên người tách thành Last & First: DÀNH CHO MỤC TIÊU SORT THEO TIÊU CHÍ NÀO ĐÓ 
SELECT * FROM Employees
SELECT EmployeeID, LastName, FirstName, Title, BirthDate FROM Employees

-- 9. In ra thông tin nhân viên, ghép tên cho đẹp/gộp cột, tính luôn tuổi
SELECT EmployeeID, LastName + ' ' + FirstName AS [FULL Name], Title, BirthDate FROM Employees

SELECT EmployeeID, LastName + ' ' + FirstName AS [FULL Name], Title, YEAR(BirthDate) FROM Employees

SELECT EmployeeID, LastName + ' ' + FirstName AS [FULL Name], Title, YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees

-- 10. In ra thông tin chi tiết mua hàng 
SELECT * FROM [Order Details]
SELECT *, UnitPrice * Quantity FROM [Order Details]        
-- Công thức tính tổng tiền phải trả từng món, có trừ đi giảm giá, phần trăm
-- SL * DG - Tiền Giảm Giá ==> Phải Trả
-- SL * DG - SL * DG * Discount (%) ==> phải trả
-- SL * DG(1 - Discount %) ==> Tiền hải trả
SELECT *, UnitPrice * Quantity * (1 - Discount) AS Subtotal FROM [Order Details]