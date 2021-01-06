package com.javaex.sec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaex.sec.GuestVo2;

public class GuestDao2 {

	// 필드
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "webdb";
	private String pw = "webdb";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private int count = 0;

	// 생성자
	// 메소드 겟셋
	// 메소드 일반

	// DB접속 메소드
	public void getConnection() {
		try {
			// 1. JDBC 드라이버 (Oracle) 로딩
			Class.forName(driver);

			// 2. Connection 얻어오기
			conn = DriverManager.getConnection(url, id, pw);

		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}

	// 자원 정리 메소드
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}

	///////////////////////////////////////////////////////

	// 내용 출력(리스트)
	public List<GuestVo2> getList() {
		List<GuestVo2> gList = new ArrayList<GuestVo2>();

		getConnection();

		try {
			// SQL문 준비 / 바인딩 / 실행 
			// --> reg_date 말고 sysdate 넣었는데 reg_date는 그냥 자료형이 date인 거고 날짜 넣는 건 insert에서 sysdate가 하는 거.
			// 여기에 sysdate 넣으면 등록할 때마다 전체 글 등록시간이 갱신됨.   
			String query = "";
			query += " SELECT  no, ";
			query += "         name, ";
			query += "         password, ";
			query += "         content, ";
			query += "         to_char(reg_date, 'YYYY-MM-DD HH24:MI:SS') reg_date ";
			query += " FROM guestbook ";

			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();

			// 결과 처리
			while (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String content = rs.getString("content");
				String regDate = rs.getString("reg_date");

				GuestVo2 gVo = new GuestVo2(no, name, password, content, regDate);
				gList.add(gVo);
			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();

		return gList;
	}

	// 내용 삭제
	public int contentDelete(int no, String password) {

		getConnection();

		try {
			// SQL문 준비 / 바인딩 / 실행
			String query = "";
			query += " delete from guestbook ";
			query += " where no = ? and password = ? "; // 쿼리문에 조건 추가해서 한번에 처리함.

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, no);
			pstmt.setString(2, password);

			count = pstmt.executeUpdate();

			// 결과 처리
			System.out.println(count + "건 삭제");

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();

		return count;
	}

	// 내용 등록
	public int contentAdd(GuestVo2 gVo) {

		getConnection();

		try {
			// SQL문 준비 / 바인딩 / 실행
			String query = "";
			query += " insert into guestbook ";
			query += " VALUES(seq_no.nextval, ?, ?, ?, sysdate) ";

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, gVo.getName());
			pstmt.setString(2, gVo.getPassword());
			pstmt.setString(3, gVo.getContent()); 

			count = pstmt.executeUpdate();

			// 결과 처리
			System.out.println(count + "건 등록");

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();

		return count;
	}

	// 내용 데이터 불러오기 --> 필요없음. 삭제폼에서 입력받은 pw랑 방명록 no를 delete2.jsp로 넘겨서 contentDelete()로 처리함.
	/*
	public GuestVo2 getData(int no) {
		GuestVo2 gVo = null; // for문 안에 있어서 return할 게 없으니까 초기값 정해줌.

		getConnection();

		try {
			String query = "";
			query += " SELECT  no, ";
			query += "         name, ";
			query += "         password, ";
			query += "         content, ";
			query += "         to_char(reg_date, 'YYYY-MM-DD HH24:MI:SS') reg_date ";
			query += " FROM guestbook ";
			query += " where no = ? ";

			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			// 결과처리
			while (rs.next()) {
				int num = rs.getInt("no");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String content = rs.getString("content");

				gVo = new GuestVo2(num, name, password, content);
			}

		} catch (Exception e) {
			System.out.println("error:" + e);
		}

		close();

		return gVo;

	}
	*/

}
