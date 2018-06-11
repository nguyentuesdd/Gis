# Gis
Trước khi chạy web thì tạo database bằng postgresql trước, tên database là finaltest.
Sau đó chạy file finaltest.sql để khởi tạo dữ liệu.
Rồi chạy trang importdata.jsp để lấy dữ liệu từ file excel đã thu thập

CÁC CHỨC NĂNG CỦA WEB
1. Khi search các trường đại học trên map, hiển thị các thông tin đã thu thập về trường đó
2. Lấy tọa độ hiện tại của người dùng web, hiện thị các trường đại học gần đó theo bán kính người dùng chọn (hoặc nhập, có xét khoảng cách tối đa được nhập là bao nhiêu)
3. Tìm kiếm các trường có điểm sàn <= điểm người dùng nhập (có xét số tối đa, tối thiểu mà người được dùng nhập), optional: tìm kiếm trong bán kính bao nhiêu với tâm là tọa độ người dùng đang ở (bán kính có giới hạn số được nhập)
4. Tìm kiếm các trường có chỉ tiêu tuyển sinh <= số người dùng nhập (có xét số tối thiểu mà người dùng được nhập), optional: tìm kiếm trong bán kính bao nhiêu với tâm là tọa độ người dùng đang ở (bán kính có giới hạn số được nhập)
5. Tìm kiếm các trường có ngành mà người dùng nhập vào, optional: tìm kiếm trong bán kính bao nhiêu với tâm là tọa độ người dùng đang ở (bán kính có giới hạn số được nhập)
Ghi chú: 
- Khi tìm kiếm, đánh dấu các điểm (marker) mà map tìm được
- Đối với chức năng 1, khi bấm vào marker thì hiển thị thông tin về trường
- Đối với chức năng 5, khi bấm vào marker thì hiển thị thông tin tuyển sinh của ngành mà người dùng nhập
Thực hiện:
-	Đỗ Nguyên Tú: đăng ký google map api key, thiết kế và xây dựng database, thiết kế web, chức năng 1, lấy tọa độ người dùng
-	Hồ Sỹ Huy: chức năng 2
-	Nguyễn Hoàng Hưng: chức năng 3
-	Lê Xuân Nguyên: chức năng 4
-	Trần Quốc Khánh: chức năng 5

