USE Northwind

-------------------------------------------------------------------------
-- LÍ THUYẾT
-- DB ENGINE hỗ trợ 1 loạt nhóm hàng dùng thao tác trên nhóm dòng/cột, gom data tính toán
-- trên đám data gom này - nhóm hàm gom nhóm - AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT() SUM() MAX() AVG()

-- CÚ PHÁP CHUẨN 
-- SELECT CỘT..., HÀM GOM NHÓM(),... FROM<TABLE>

-- * CÚ PHÁP MỞ RỘNG
-- SELECT CỘT..., HÀM GOM NHÓM(),... FROM<TABLE>...WHERE... GROUP BY (GOM THEO CỤM CỘT NÀO)

-- SELECT CỘT..., HÀM GOM NHÓM(),... FROM<TABLE>...WHERE... GROUP BY (GOM THEO CỤM CỘT NÀO) HAVING...

-- * HÀM COUNT() ĐẾM SỐ LẦN XUẤT HIỆN CỦA MỘT CÁI J ĐÓ
--       COUNT(*): ĐẾM SỐ DÒNG TRONG TABLE
--       COUNT(*) FROM...WHERE...
--                           Chọn ra những dòng thoả tiêu chí WHERE trc đã, rồi mới đến filter rồi đếm

--       COUNT(CỘT NÀO ĐÓ): 
-------------------------------------------------------------------------
--1. iN RA DANH SÁCH CÁC NHÂN VIÊN
SELECT * FROM  Employees

-- 2. Đếm xem có bao nhiêu nhân viên 
SELECT COUNT(*) AS [Number of employees] FROM Employees

-- 3. Có bao nhiêu NV ở LONDON
SELECT COUNT(*) AS[Empls in LONDON] FROM Employees WHERE City = 'London'

-- 4. Có bao nhiêu lượt thành phố xuất hiện - ko tính lặp lại
SELECT COUNT(*) From Employees

-- 5. Đếm xem có bao nhiêu Region 
SELECT COUNT(Region) FROM Employees
-- Chứa null, ko tính ko đếm

-- 5. Đếm xem có bao nhiêu khu vực null, có bao nhiêu dòng region null
SELECT COUNT(*) FROM Employees WHERE Region is null -- đếm  sự xh của dòng chứa null

SELECT COUNT(Region) FROM Employees WHERE Region is null -- 0 null ko đếm đc, ko value

-- 6. Có bao nhiêu tp trong table nv
SELECT City FROM Employees
SELECT DISTINCT City FROM Employees
-- SUB QUERY MỚI, COI 1 SELECT LÀ 1 TABLE, BIẾN TABLE NÀY TRONG MỆNH ĐỀ FROM
SELECT * FROM (SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*) FROM (SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*) FROM Employees -- 9 nv
SELECT COUNT(City) FROM Employees -- 9 city
SELECT COUNT(DISTINCT CITY) FROM Employees -- 5

-- 8. Đếm xem 'mỗi' thành phố có bao nhiêu nhân viên
-- KHI CÂU HỎI CÓ TÍNH TOÁN FROM DATA MÀ LẠI CHỨA TỪ KHOÁ 'MỖI' THÌ CÁCH VIẾT PHẢI CÓ SỰ THAY ĐÔỈ
-- GẶP TỪ 'MỖI' (EACH) CHÍNH LÀ CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ 
SELECT * FROM Employees 

-- Seatle 2 | Tacoma 1 | Kirland 1 | Redmon 1 | London 4
-- Sự xuất hiện của nhóm
SELECT COUNT(City) FROM Employees Group by City

SELECT EmployeeID, City, COUNT(City) AS [No employess] FROM Employees Group by City, EmployeeID
-- Khi xài hàm gom nhóm, Liệt kê cột lẻ ở Select nhunge cột lẻ đó
-- Bắt buộc xuất hiện trong mệnh đề group by
-- MUỐN HIỆN THỊ SỐ LƯỢNG CỦA AI ĐÓ, GOM NHÓM THEO CÁI J ĐÓ
-- NẾU BN GOM THEO KEY/PK, VÔ NGHĨA HENG, VÌ KEY KO TRÙNG, MỖI THẰNG 1 NHÓM, KO ĐẾM ĐC 



-- 9. THÀNH PHỐ NÀO CÓ 2 NHÂN VIÊN TRỞ LÊN 
-- 9.1 CÁ TP CÓ BAO NHIU NV
-- 9.2 ĐẾM XONG MỖI THÀNH PHỐ , LỌC LẠI KẾT QUẢ SAU ĐẾM
-- FILTER SAU ĐẾM, WHERE SAU KHI ĐÃ GOM NHÓM, AGGRERATE THÌ GỌI LÀ HAVING

SELECT City ,COUNT(City) FROM Employees Group by City
SELECT City ,COUNT(*) FROM Employees Group by City HAVING COUNT(*) >= 2

-- 10. Đếm số nhân viên của 2 thành phố Seatle và London
SELECT count(*) FROM Employees where City in ('London','Seattle') group by City

SELECT City,count(*) FROM Employees where City in ('London','Seattle') group by City

--11. Trong 2 thành phố Lòdon Seattle, tp nào có nhiều hơn 3 nhân viên
SELECT City,count(*) FROM Employees where City in ('London','Seattle') group by City having count(*) >= 3

--12. Đếm xem có bao nhiêu mặt hàng có trong kho
SELECT count(*) as [No Orders] FROM Orders
SELECT count(OrderID) as [No Orders] FROM Orders -- 830 mã khác nhau, nên đếm mã đơn, hay đếm cả cái đơn là như nhau
-- Coi chừng cột có value null vì ko tính
--12.1 Nước Mĩ có bao nhiêu đơn hàng
-- ko phải câu gom chia nhóm vì ko có chữ 'mỗi'
SELECT count(*) as[No USA Orders] from Orders where ShipCountry = 'USA'

--12.2 MĨ Anh Pháp chiếm tổng cộng bao nhiêu đơn hàng 
SELECT count(*) from Orders where ShipCountry in ('USA','UK','France')
SELECT count(*) from Orders where ShipCountry = 'USA' OR ShipCountry = 'UK' OR ShipCountry = 'France' 

--12.3 MĨ Anh Pháp, mỗi quốc gia có bao nhiêu đơn hàng 
SELECT ShipCountry,count(*) from Orders where ShipCountry in ('USA','UK','France') group by ShipCountry

--12.4 Trong 3 quốc gia trên, quốc gia nào có từ 100 đơn hàng trở lên
SELECT ShipCountry,count(*) from Orders 
                            where ShipCountry in ('USA','UK','France') 
							group by ShipCountry
							having count(*) >= 100


--13. Đếm xem có bao nhiêu đơn hàng trong kho
--14. Đếm xem có bao nhiêu lượt quốc gia đã mua hàng
--15. Đếm xem có bao nhiêu quốc gia đã mua hàng ( mỗi quốc gia đếm 1 lần )
--16. Đếm số lượng đơn hàng của mỗi quốc gia

-- 10. THÀNH PHỐ NÀO CÓ NHIỀU NHÂN VIÊN NHẤT


