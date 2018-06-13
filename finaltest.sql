--drop database finaltest;
/* 
CREATE DATABASE finaltest
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;
*/

-- Tạo bảng chứa thông tin các trường đại học
alter table sectors drop constraint sectors_sid_fkey;
drop table if exists universitys;
create table universitys 
(
  id int not null,
  sid char(3) primary key not null,
  sname character varying(255) not null,
  saddress character varying(255),
  benchmark double precision /*Điểm chuẩn*/ not null,
  quota int /*Chỉ tiêu*/ not null,
  website character varying(80),
  lng double precision not null,
  lat double precision not null,
  geom geometry(Point,4326)
  );

-- Tạo bảng chứa các ngành trong trường đại học
drop table if exists sectors;
create table sectors
(
  idsector int,
  sid char(3)  references universitys(sid),
  namesector character varying(255),
  quotasector int,
  pointsector double precision,
  constraint pk_sector primary key (idsector, sid)
);

-- Tạo procedure có chức năng insert dữ liệu vào bảng universitys
drop function if exists st_add_universitys(int, char(3), character varying(255), character varying(255), double precision, int, character varying(80), double precision, double precision);
 create or replace function st_add_universitys(id int, sid char(3), sname character varying(255), saddress character varying(255),
                                                benchmark double precision, quota int, website character varying(80), lng double precision, lat double precision) 
    returns void as $$
    begin
      insert into universitys values (id, sid, sname, saddress, benchmark, quota, website, lng, lat, ST_SetSRID(st_point(lng, lat), 4326));
    end;
    $$ language plpgsql;
-- select * from universitys;
-- select st_add_universitys(1, 'QSB', 'Đại học Bách Khoa TpHCM', '268 Lý Thường Kiệt, phường 14, quận 10, TP.Hồ Chí Minh', 20, 4330, 'aao.hcmut.edu.vn', 106.659306, 10.773277);

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m (Dành cho câu 2)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập
drop function if exists st_search_univercities(double precision, double precision, double precision);
create or replace function st_search_univercities(stlng double precision, stlat double precision, radius double precision)
	returns void as $$
	begin
		select * from universitys where st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true;
	end;
	$$ language plpgsql;

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m với điểm sàn(Dành cho câu 3)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập
-- point là điểm người dùng nhập
drop function if exists st_search_univercities_with_benchmark(double precision, double precision, double precision, double precision);
create or replace function st_search_univercities_with_benchmark(stlng double precision, stlat double precision, radius double precision, point double precision)
	returns void as $$
	begin
		select * from universitys where (st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true) and (benchmark <= point);
	end;
	$$ language plpgsql;

-- Procedure có chức năng tìm ra các trường nằm trong bán kính bao nhiêu m với chỉ tiêu(Dành cho câu 4)
-- lng và lat là tọa độ tâm (tọa độ của người dùng hoặc tọa độ của địa chỉ người dùng nhập)
-- radius là bán kính người dùng nhập
-- num là chỉ tiêu người dùng nhập
drop function if exists st_search_univercities_with_quota(double precision, double precision, double precision, int);
create or replace function st_search_univercities_with_quota(stlng double precision, stlat double precision, radius double precision, num int)
	returns void as $$
	begin
		select * from universitys where (st_intersects(geom, ST_Buffer(ST_SetSRID(st_point(stlng, stlat), 4326), radius)) = true) and (quota <= int);
	end;
	$$ language plpgsql;


-- Insert các ngành, nhóm ngành vào bảng sector, Lưu ý: phải insert sau khi bảng universitys đã có dữ liệu
-- select * from sectors;