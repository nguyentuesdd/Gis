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
drop table if exists universitys;
create table universitys 
(
  id int primary key,
  sid char(3) not null,
  sname character varying(255) not null,
  saddress character varying(255),
  benchmark double precision /*Điểm chuẩn*/ not null,
  quota int /*Chỉ tiêu*/ not null,
  website character varying(80),
  lng double precision not null,
  lat double precision not null,
  geom geometry(Point,4326)
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