Use Northwind
------------------------------------------------------------------------------------------------
-- lí thuyết
-- Cú pháp chuẩn của lệnh Select
-- SELECT * FROM <TABLE> WHERE...

-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT IN (MỘT TẬP HỢP NÀO ĐÓ)
-- NẾU CÓ 1 CÂU SQL MÀ TRẢ VỀ 1 CỘT MÀ NHIỀU DÒNG
-- MỘT CỘT NHIỀU DÒNG THÌ TA CÓ THỂ XEM NÓ TƯƠNG ĐƯƠNG MỘT TẬP HỢP
-- TA CÓ THỂ NHÉT/LỒNG CÂU 1 CỘT VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI
--* CÚ PHÁP
-- WHERE CỘT IN ( MỘT CÂU SELECT TRẢ VỀ 1 CỘT NHIỀU DÒNG - NHIỀU VALUE CÙNG KIỂU)
------------------------------------------------------------------------------------------------

-- 1. Liệt kê các nhóm hàng
SELECT * FROM Categories

-- 2. In ra các nhóm hàng thuộc nhóm 1,6,8
SELECT * FROM Products where CategoryID in(1,6,8)

-- In ra các nhóm hàng thuộc nhóm bia, thịt, hải sản 
SELECT * FROM Products where CategoryID in(SELECT CategoryID FROM Categories where CategoryName in('Beverages','Meat/Poultry','Seafood'))

-- 4. Nhân viên quê London phụ trách đơn hàng nào
SELECT * FROM Employees where City = 'London'
SELECT EmployeeID FROM Employees where City = 'London'
SELECT * FROM Orders where EmployeeID in(SELECT EmployeeID FROM Employees where City = 'London')

--BT
-- 1. Các nhà cung cấp đến từ Mĩ cc những mặt hàng nào ?
-- 2. Các nhà cung cấp đến từ Mĩ cc những nhóm hàng nào ?
-- 3. Các đơn hàng vận chuyển tới tp Sao Paulo đc vận chuyển bởi những hãng nào
