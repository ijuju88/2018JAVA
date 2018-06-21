package com.ds.model;

import java.sql.*;
import java.util.*;

import com.ds.vo.V1_Board;

//계시판관련
public class BoardDAO {
	PreparedStatement ps;
	ResultSet rs;

	//게시판 리스트
	public List<V1_Board> selectBoradList(){

		try {
			String sql="SELECT * FROM V1_BOARD ORDER BY BRD_NO DESC";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			rs=ps.executeQuery();

			//여러개 보관하기 위한 객체
			List<V1_Board> list= new ArrayList<>();
			while(rs.next()) {
				V1_Board vo=new V1_Board();
				vo.setBrd_no(rs.getInt("BRD_NO"));
				vo.setBrd_title(rs.getString("BRD_TITLE"));
				vo.setBrd_writer(rs.getString("BRD_WRITER"));
				vo.setBrd_hit(rs.getInt("BRD_HIT"));
				vo.setBrd_date(rs.getString("BRD_DATE"));

				list.add(vo);
			}
			if(list.size()>0) {
				return list;
			}
			return null;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	//게시판 리스트2
	public List<V1_Board> selectBoradList1(int startnum){

		try {
			String sql="SELECT * FROM (SELECT BRD_NO, BRD_TITLE, BRD_WRITER, "
					+ "TO_CHAR(BRD_HIT, '999,999,999')BRD_HIT1, TO_CHAR(BRD_DATE, 'YYYY-MM-DD') BRD_DATE,"
					+" ROW_NUMBER() OVER (ORDER BY BRD_NO desc) RNUM"
					+" FROM V1_BOARD) WHERE RNUM BETWEEN ? AND ?";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, startnum);
			ps.setInt(2, startnum+9);
			rs=ps.executeQuery();

			//여러개 보관하기 위한 객체
			List<V1_Board> list= new ArrayList<>();
			while(rs.next()) {
				V1_Board vo=new V1_Board();
				vo.setBrd_no(rs.getInt("BRD_NO"));
				vo.setBrd_title(rs.getString("BRD_TITLE"));
				vo.setBrd_writer(rs.getString("BRD_WRITER"));
				//vo.setBrd_hit(rs.getInt("BRD_HIT"));
				vo.setBrd_hit1(rs.getString("BRD_HIT1"));
				vo.setBrd_date(rs.getString("BRD_DATE"));

				list.add(vo);
			}
			if(list.size()>0) {
				return list;
			}
			return null;

		} catch (Exception e) {
			System.out.println("리스트 갯수 관련 에러 : "+e.getMessage());
			return null;
		}
	}

	//게시판 전체 갯수 
	public int selectBordadListCount() {

		try {
			String sql="SELECT COUNT(*) CNT FROM V1_BOARD";
			ps=OracleConnStatic.getConn().prepareStatement(sql);
			rs=ps.executeQuery();

			if(rs.next()) {
				System.out.println("전체페이지수 : "+rs.getInt("cnt"));
				return rs.getInt("cnt");
			}

			return 0;
		} catch (Exception e) {
			System.out.println("전체갯수 에러 : "+e.getMessage());
			return 0;
		}


	}

	//게사판 글쓰기 입력 -insert 이므로 리턴형 int
	public int insertBoard(V1_Board vo) {
		try {
			String sql="INSERT INTO V1_BOARD"
					+ "(BRD_NO,BRD_TITLE,BRD_WRITER,BRD_CONTENT, BRD_HIT, BRD_DATE, BRD_FILE) VALUES"
					+ "(SEQ_V1_BOARD_NO.NEXTVAL,?,?,?,1,SYSDATE,?)";

			ps=OracleConnStatic.getConn().prepareStatement(sql);

			ps.setString(1, vo.getBrd_title());
			ps.setString(2, vo.getBrd_writer());
			ps.setString(3, vo.getBrd_content());
			ps.setString(4, vo.getBrd_file());

			return ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}


	}

	//조회수 증가
	public int updateBoardHit(int no) {
		try {
			String sql="UPDATE V1_BOARD SET BRD_HIT=BRD_HIT+1 "
					+ "WHERE BRD_NO=?";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, no);

			return ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}

	}  


	//게시판 글보기
	public V1_Board selectBoradView(int no){

		try {
			String sql="SELECT * FROM V1_BOARD WHERE BRD_NO=?";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();


			//1개라서 List 말고 그냥 if문으로 작성
			if(rs.next()) {
				V1_Board vo=new V1_Board();
				vo.setBrd_no(rs.getInt("BRD_NO"));
				vo.setBrd_title(rs.getString("BRD_TITLE"));
				vo.setBrd_writer(rs.getString("BRD_WRITER"));
				vo.setBrd_content(rs.getString("BRD_CONTENT"));
				vo.setBrd_hit1(rs.getString("BRD_HIT"));
				vo.setBrd_date(rs.getString("BRD_DATE"));
				vo.setBrd_file(rs.getString("BRD_file"));

				return vo;
			}

			return null;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}


	//이전글
	public int prevBoardNo(int no) {
		try {
			String sql="SELECT NVL(MAX(BRD_NO),0) BNO FROM V1_BOARD WHERE BRD_NO < ?";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();


			//1개라서 List 말고 그냥 if문으로 작성
			if(rs.next()) {
				return rs.getInt("BNO");
			}

			return 0;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}


	//이후글
	public int nextBoardNo(int no) {
		try {
			String sql="SELECT NVL(MIN(BRD_NO),0) BNO FROM V1_BOARD WHERE BRD_NO > ?";

			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();

			//1개라서 List 말고 그냥 if문으로 작성
			if(rs.next()) {
				return rs.getInt("BNO");
			}

			return 0;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	//게시판 수정
	public int boardUpdate(V1_Board vo) {
		try {

			String sql=null;
			System.out.println(vo.getBrd_content());
			if(vo.getBrd_file() != null) {
				sql="UPDATE V1_BOARD SET BRD_TITLE=?, BRD_CONTENT=?"
						+ ", BRD_WRITER=?, BRD_FILE=? WHERE BRD_NO=?";
				
				ps=OracleConnStatic.getConn().prepareStatement(sql);
				ps.setString(1, vo.getBrd_title());
				ps.setString(2, vo.getBrd_content());
				ps.setString(3, vo.getBrd_writer());
				ps.setString(4, vo.getBrd_file());
				ps.setInt(5, vo.getBrd_no());
				return ps.executeUpdate();

			}else {
				sql="UPDATE V1_BOARD SET BRD_TITLE=?, BRD_CONTENT=?"
						+ ", BRD_WRITER=? WHERE BRD_NO=?";
				ps=OracleConnStatic.getConn().prepareStatement(sql);
				ps.setString(1, vo.getBrd_title());
				ps.setString(2, vo.getBrd_content());
				ps.setString(3, vo.getBrd_writer());
				ps.setInt(4, vo.getBrd_no());
				return ps.executeUpdate();
			}


		} catch (Exception e) {
			System.out.println("글수정 sql 오류 : "+e.getMessage());
			return 0;
		}
	

	}


	//게시판 삭제
	public int boardDelete(int no) {
		try {
			String sql="DELETE FROM V1_BOARD WHERE BRD_NO=?";
			ps=OracleConnStatic.getConn().prepareStatement(sql);
			ps.setInt(1, no);

			return ps.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제SQL 에러 : "+e.getMessage());
		}
		return no;
	}

}
