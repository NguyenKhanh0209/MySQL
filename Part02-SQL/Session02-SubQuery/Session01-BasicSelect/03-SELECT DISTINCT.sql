Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết
-- Một DB là nơi chứa data (bán hàng, thư viện,...)
-- Data đc lưu dưới dạng table, tách thành nhiều table
-- Dùng lệnh select để xem/ in dữ liệu từ table, cx hiển thị dưới dạng table  
-- CÚ PHÁP CHUẨN: SELECT * FROM<TÊN-TABLE>

-- Khi ta select ít cột từ table góc thì có nguy cơ dữ liệu sẽ bị trùng lại
-- Ko p ta bị sai, kp ng thiết kế table và ng nhập liệu bị sai
-- Do trúng ta có nhiều info trùng nhau/ đặc điểm trùng nhau, nên nếu chỉ tập trung vào data này
-- trùng nhau chắc chẳn xảy ra
-- Lệnh SELECT hỗ trợ loại trừ dòng trùng nhau/ Trùng 100%

------------------------------------------------------------------------------------------------

--1. Liệt kê danh sách nhân viên
SELECT * From Employees
SELECT TitleOfCourtesy From Employees
SELECT Distinct TitleOfCourtesy From Employees

SELECT Distinct EmployeeID, TitleOfCourtesy From Employees

--2. In ra thông tin khách hàng
SELECT * FROM Customers --92 róws

--3. Có bao nhiêu quốc gia xh trong tt khách hàng
SELECT Country FROM Customers
SELECT distinct Country FROM Customers                        