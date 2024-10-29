Use Cartesian
CREATE DATABASE Cartesian
-- Database: thùng chứa data bên trong

CREATE TABLE EnDict                       --DDL (một nhánh của SQL)
(                                         --Data Definition Language
	Nmbr int, 
	EnDesc varchar(30)
)

--Drop TABLE EnDict                         --DDL  

-- Từ điển Tiếng Anh số đếm
-- 1 One
-- 2 Two
-- Chèn Data
SELECT * FROM EnDict                       --DML Data Manipulation Language

Insert INTO EnDict VALUES(1, 'One')
Insert INTO EnDict VALUES(2, 'Two')
Insert INTO EnDict VALUES(3, 'Three')

--PHẦN NÀY THÊM CHO OUTER JOIN
Insert INTO EnDict VALUES(4, 'Four')

CREATE TABLE VnDict                       --DDL (một nhánh của SQL)
(                                         --Data Definition Language
	Nmbr int, 
	EnDesc nvarchar(30)                   -- nvarchar() String lưu tiếng Việt
)                                         -- varchar()  String lưu tiếng Anh

--DROP Table VnDict

SELECT * FROM VnDict                       

Insert INTO VnDict VALUES(1, N'Một')
Insert INTO VnDict VALUES(2, N'Hai')
Insert INTO VnDict VALUES(3, N'Ba')
Insert INTO VnDict VALUES(5, N'Năm')

SELECT * FROM VnDict 
SELECT * FROM EnDict  

-- Join là select cùng lúc nhiều table
SELECT * FROM Vndict, Endict  -- sinh table mới, tạm thời chạy 2 bên
                              -- số cột = tổng 2 bên
							  -- số dòng = tích 2 bên
SELECT * FROM Vndict, Endict order by Nmbr
-- GHÉP TABLE, TRÙNG TÊN CỘT, DÙNG ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU 
--                            CHỈ ĐỊNH CỘT THUỘC TABLE TRÁNH NHẦM
SELECT * FROM Vndict, Endict order by Vndict.Nmbr -- tham chiếu cột qua tên table
SELECT * FROM Vndict vn, Endict en order by en.Nmbr -- đặt tên giả cho table 
                                                    -- dùng tham chiếu cho các cột

SELECT vn.EnDesc, vn.Nmbr, en.EnDesc FROM Vndict vn, Endict en order by en.Nmbr

SELECT vn.*, vn.Nmbr, en.EnDesc FROM Vndict vn, Endict en order by en.Nmbr


-- Cú pháp viết thứ 2 -- CHUẨN
SELECT vn.*, vn.Nmbr, en.EnDesc FROM Vndict vn CROSS JOIN Endict en order by en.Nmbr

SELECT vn.*,en.* FROM Vndict vn CROSS JOIN Endict en order by en.Nmbr

-- Có cặp sai cặp xài đc
SELECT * FROM Vndict vn, Endict en where vn.Nmbr = en.Nmbr -- rút từ  3x3 còn 3
-- GHÉP CÓ CHỌN LỌC TÌM TƯƠNG QUAN ĐỂ GHÉP --> INNER JOIN  /OUTER
                   -- EQUI JOIN
				   -- ĐA PHẦN TƯƠNG GHÉP THEO TOÁN TỬ =
				   -- CÒN CÓ THỂ GHÉP THEO > >= < <= !=

-- Thí nghiệm thêm cho inner join, ghép ngang xem có điểm chung k ?
SELECT * FROM EnDict
SELECT * FROM VnDict   

SELECT * FROM Endict e, VnDict v where e.Nmbr = v.Nmbr

SELECT * FROM Endict e, VnDict v where e.Nmbr > v.Nmbr   -- ghép có chọn lọc, k xài dấu =
													     -- mà dùng dấu > >= < <= !=
														 -- NON-EQUI JOIN
														 -- VẪN KO LÀ GHÉP BỪA BÃI

SELECT * FROM Endict e, VnDict v where e.Nmbr != v.Nmbr -- THỰC DỤNG

SELECT * FROM Endict e JOIN VnDict v ON e.Nmbr != v.Nmbr   -- CHUẨN