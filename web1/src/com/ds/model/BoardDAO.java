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
				V1_Board vb=new V1_Board();
				vb.setBrd_no(rs.getInt("BRD_NO"));
				vb.setBrd_title(rs.getString("BRD_TITLE"));
				vb.setBrd_writer(rs.getString("BRD_WRITER"));
				vb.setBrd_hit(rs.getInt("BRD_HIT"));
				vb.setBrd_date(rs.getString("BRD_DATE"));

				list.add(vb);
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
	
	//게사판 글쓰기 입력 -insert 이므로 리턴형 int
	public int insertBoard(V1_Board vo) {
		try {
			String sql="INSERT INTO V1_BOARD(BRD_NO,BRD_TITLE,BRD_WRITER,BRD_CONTENT, BRD_HIT, BRD_DATE) VALUES"
					+ "(SEQ_V1_BOARD_NO.NEXTVAL,?,?,?,1,SYSDATE)";
			
			ps=OracleConnStatic.getConn().prepareStatement(sql);
			
			ps.setString(1, vo.getBrd_title());
			ps.setString(2, vo.getBrd_writer());
			ps.setString(3, vo.getBrd_content());
			
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
		public List<V1_Board> selectBoradView(){

			try {
				String sql="SELECT * FROM V1_BOARD ORDER BY BRD_NO DESC";

				ps=OracleConnStatic.getConn().prepareStatement(sql);
				rs=ps.executeQuery();

				//여러개 보관하기 위한 객체
				List<V1_Board> list= new ArrayList<>();
				while(rs.next()) {
					V1_Board vb=new V1_Board();
					vb.setBrd_no(rs.getInt("BRD_NO"));
					vb.setBrd_title(rs.getString("BRD_TITLE"));
					vb.setBrd_writer(rs.getString("BRD_WRITER"));
					vb.setBrd_hit(rs.getInt("BRD_HIT"));
					vb.setBrd_date(rs.getString("BRD_DATE"));

					list.add(vb);
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
	
}
