package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import DAO.UniversityDAO;
import model.University;

/**
 * Servlet implementation class SearchBenchMark
 */
public class SearchBenchMark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchBenchMark() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		double bm = Double.parseDouble(request.getParameter("bm"));
		double radius = Double.parseDouble(request.getParameter("radius"));
		JSONArray uniArray = new JSONArray();
		JSONObject uni;
		JSONObject returnJson = new JSONObject();
		/*ArrayList<University> uniList = (ArrayList<University>) UniversityDAO.getUniversitiesByBenchMark(0, 0, radius,bm);

		for (University university : uniList) {
			try {
				uni = new JSONObject();
				uni.put("sid", university.getSid());
				uni.put("sname", university.getSname());
				uni.put("saddress", university.getSaddress());
				uni.put("benchmark", university.getBenchmark());
				uni.put("quota", university.getQuota());
				uni.put("website", university.getWebsite());
				uni.put("lat", university.getLat());
				uni.put("lng", university.getLng());
				uniArray.put(uni);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		try {
			returnJson.put("jsonArray", uniArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		PrintWriter pw = response.getWriter();
		pw.print(returnJson.toString());
		pw.close();*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
