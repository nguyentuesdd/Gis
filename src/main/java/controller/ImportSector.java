package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import DAO.SectorDAO;

/**
 * Servlet implementation class ImportSector
 */
public class ImportSector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportSector() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		String path = getServletContext().getRealPath("/WEB-INF/data");
		File file = new File(path, "Nganh.xls");
		// Doc file excel
		FileInputStream fis = new FileInputStream(file);

		// Khoi tao workbook cho file cho file excel
		HSSFWorkbook workbook = new HSSFWorkbook(fis);

		// Lay sheet dau tien tu workbook
		HSSFSheet sheet = workbook.getSheetAt(0);

		// Lấy ra Iterator cho tất cả các dòng của sheet hiện tại.
		Iterator<Row> rowIterator = sheet.iterator();

		// Bỏ qua dòng tiêu đề
		rowIterator.next();
		while (rowIterator.hasNext()) {
			Row row = rowIterator.next();

			// Lấy Iterator cho tất cả các cell của dòng hiện tại.
			Iterator<Cell> cellIterator = row.cellIterator();

			int sectorid = (int) cellIterator.next().getNumericCellValue();
			if (sectorid == 0) {
				break;
			}
			String sid = cellIterator.next().getStringCellValue();
			String sectorName = cellIterator.next().getStringCellValue();
			int sectorQuota = (int) cellIterator.next().getNumericCellValue();
			double sectorPoint = cellIterator.next().getNumericCellValue();

			SectorDAO.add_sector(sectorid, sid, sectorName, sectorQuota, sectorPoint);
		}
		workbook.close();
		String link = request.getContextPath() + "/index.jsp";
		response.sendRedirect(link);
	}

}
