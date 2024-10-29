USE Northwind -- chọn để chơi với thùng chứa data nào đó 
              -- tại một thời điểm chơi với một thùng chứa data
SELECT * FROM Customers

SELECT * FROM Employees

------------------------------------------------------------------------------------------------
-- lí thuyết
-- 1. DBE cung cấp câu lệnh Select dùng để
-----   in ra màn hình một cái gì đó ~~~ prinf() sout()
-----   in ra dữ liệu có trong 1 table (hàng/cột)
-----   kết quả hiển thị luôn là table
------------------------------------------------------------------------------------------------

-- 1. Hôm nay là ngày bao nhiêu ??
SELECT GETDATE()

SELECT GETDATE() as [Hôm nay là ngày]

-- 2. Bây giờ là mấy giờ??
SELECT MONTH(GETDATE()) AS [BÂY GIỜ LÀ THÁNG MẤY?]

SELECT YEAR(GETDATE())

-- 3. Trị tuyệt đối của -5 là bao nhiêu ?
SELECT ABS(-5) AS [TRỊ TUYỆT ĐỐI CỦA -5 LÀ MẤY?]

--4. 5 + 5 là mấy?
SELECT 5 + 5

--5. In ra tên của mình
SELECT N'Nguyễn Trần Quốc Khánh' as [Tên tôi là]

SELECT N'Nguyễn' + N'Trần Quốc Khánh' as [Tên tôi là]

--6. Tính tuổi
Select YEAR(GETDATE()) - 2004

--SELECT N'Nguyễn' + N'Trần Quốc Khánh' + (YEAR(GETDATE()) - 2004) + ' YEARS OLD'  Lỗi vì khác kiểu dữ liệu

SELECT N'Nguyễn' + N'Trần Quốc Khánh ' + CONVERT(VARCHAR, YEAR(GETDATE()) - 2004) + ' YEARS OLD' AS [My profile]

SELECT N'Nguyễn' + N'Trần Quốc Khánh ' + CAST(YEAR(GETDATE()) - 2004 AS varchar) + ' YEARS OLD' as MyProfile

CONVERT(VARCHAR, YEAR(GETDATE()) - 2004)

-- 7. Phép nhân 2 số
SELECT 10*10 AS [10 x 10 = ]