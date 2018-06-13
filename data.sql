USE master;
GO


IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'finaltest')
BEGIN 
	ALTER DATABASE finaltest SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE finaltest;
END
GO

create database finaltest;
go

use finaltest;
go

create table universitys 
(
  id int not null,
  sid char(3) primary key not null,
  sname nvarchar(255) not null,
  saddress nvarchar(255),
  benchmark real /*Điểm chuẩn*/ not null,
  quota int /*Chỉ tiêu*/ not null,
  website nvarchar(80),
  lng real not null,
  lat real not null
  );
  go

-- Tạo bảng chứa các ngành trong trường đại học
create table sectors
(
  idsector int,
  sid char(3),
  namesector nvarchar(255),
  quotasector int,
  pointsector real,
  constraint pk_sector primary key (idsector, sid)
);
ALTER TABLE sectors
ADD CONSTRAINT sectors_universitys FOREIGN KEY (sid) REFERENCES universitys (sid)
go
-- select * from universitys;

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m (Dành cho câu 2)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập

-- select * from universitys where st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true;
go

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m với điểm sàn(Dành cho câu 3)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập
-- point là điểm người dùng nhập

-- select * from universitys where (st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true) and (benchmark <= point);
go

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m với chỉ tiêu(Dành cho câu 4)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập
-- num là chỉ tiêu người dùng nhập

-- select * from universitys where (st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true) and (quota <= int);
go

-- Insert các ngành, nhóm ngành vào bảng sector, Lưu ý: phải insert sau khi bảng universitys đã có dữ liệu
-- select * from sectors;