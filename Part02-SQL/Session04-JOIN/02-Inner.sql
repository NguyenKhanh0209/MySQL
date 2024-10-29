SELECT * FROM VnDict, EnDict -- TÍCH ĐỀ CÁC

SELECT * FROM VnDict cross join EnDict

SELECT * FROM VnDict vn, EnDict en WHERE vn.Nmbr = en.Nmbr 

SELECT * FROM VnDict vn, EnDict en WHERE vn.Nmbr = en.Nmbr

--CHUẨN THẾ GIỚI
SELECT * FROM VnDict vn INNER JOIN EnDict en ON vn.Nmbr = en.Nmbr -- NHÌN SÂU TABLE R GHÉP, KO GHÉP BỪA BÃI, GHÉP THEO ĐIỂM TRUNG

SELECT * FROM VnDict vn JOIN EnDict en ON vn.Nmbr = en.Nmbr
-- Có thể dùng thêm where đc hay ko ?? khi xài inner, join