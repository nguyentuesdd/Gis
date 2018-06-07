# Gis
Trước khi chạy web thì tạo database bằng postgresql trước, tên database là finaltest.
Sau đó chạy file finaltest.sql để khởi tạo dữ liệu
Rồi chạy trang importdata.jsp để lấy dữ liệu từ file excel đã thu thập

CÁC CHỨC NĂNG CỦA WEB
1. Khi search các trường đại học trên map, hiển thị các thông tin đã thu thập về trường đó
2. Lấy tọa độ hiện tại của người dùng web (hoặc tọa độ người dùng chọn), hiện thị các trường đại học gần đó theo bán kính người dùng chọn (hoặc nhập, có xét khoảng cách tối đa được nhập là bao nhiêu)
3. Tìm kiếm các trường có điểm sàn <= điểm người dùng nhập (có xét số tối đa, tối thiểu mà người được dùng nhập), optional: tìm kiếm trong bán kính bao nhiêu với tâm là tọa độ người dùng đang ở (bán kính có giới hạn số được nhập)
4. Tìm kiếm các trường có chỉ tiêu tuyển sinh <= số người dùng nhập (có xét số tối thiểu (0) mà người dùng được nhập), optional: tìm kiếm trong bán kính bao nhiêu với tâm là tọa độ người dùng đang ở (bán kính có giới hạn số được nhập)
Ghi chú: 
- Khi tìm kiếm, đánh dấu các điểm (marker) mà map tìm được
- Khi tìm kiếm theo vùng, nếu bán kính người dùng nhập là 0, sẽ hiển thị toàn bộ các trường trong thành phố
- Chỉ hiển thị loại google map là ROADMAP
- Đối với chức năng 1, chỉ khi bấm hoặc trỏ vào marker mới hiển thị thông tin về trường
SRID cho google map là WGS84: 4326
