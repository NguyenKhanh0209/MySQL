Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết 
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>
-- Ta muốn sắp xếp dữ liệu/ sort theo tiêu cí nào đó, thường là ascending, descending
-- Mặc định ko nói j cả thì là sort tăng dần
-- A < B < C
-- Ta có thể sort trên nhiều cột, logic này tutu tính
-- SELECT.... FROM<TÊN-TABLE> Order by tên-cột muốn sort <Kiếu sort>

------------------------------------------------------------------------------------------------
--1. In ra ds nhân viên tăng dần theo năm sinh
SELECT * FROM Employees Order by BirthDate ASC
SELECT * FROM Employees Order by BirthDate -- mặc định tăng dần

--2. In ra ds nhân viên giảm dần theo năm sinh
SELECT * FROM Employees Order by BirthDate DESC

--3. Tính tiền chi tiết mua hàng
SELECT * From [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS Subtotal FROM [Order Details]

--4. Tính tiền chi tiết mua hàng, sắp xếp giảm dần theo tg
SELECT * From [Order Details]
SELECT *, UnitPrice * Quantity * (1 - Discount) AS Subtotal FROM [Order Details]
Order by Subtotal DESC

--5. In ra ds nhân viên giảm dần theo tuổi
SELECT *, YEAR(GETDATE()) - YEAR(BirthDate) AS Age FROM Employees
Order by Age DESC