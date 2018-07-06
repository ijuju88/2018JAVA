package com.ds.sts1;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.sts1.dao.BoardImpl;
import com.ds.sts1.vo.V1_Board;


@Controller
public class BoardController{

	@Autowired
	private BoardImpl bDAO= null;

	//글작성
	//localhost:8088/sts1/boardw.do
	@RequestMapping(value="boardw.do", method=RequestMethod.GET)
	public String Boardw(Model model) {

		/*
		 * request.setAttribte("키","값");
		 * model.addAttribute(arg0, arg1);
		 */

		V1_Board vo=new V1_Board();
		int no=bDAO.BoardInsertNO();
		vo.setBrd_no(no);

		model.addAttribute("vo", vo);

		//jsp의 select에 표시할 항목임의 지정
		/*
				 List<String> selectList=new ArrayList<String>();

				vo.setSlist("jstl");
				String[] tmp= {"java","spring","jstl"};
				vo.setSlistary(tmp);

				selectList.add("abc");
				selectList.add("jsp");

				model.addAttribute("slist", selectList);
				model.addAttribute("slistary", tmp);
		 */

		//화면표시
		return "board/boardw";
	}



	//글작성후
	@RequestMapping(value="boardw.do", method=RequestMethod.POST)
	public String Boardw(@ModelAttribute("vo") V1_Board vo) {
		System.out.println("쓴내용 출력용 : "+vo.toString());
		try {
			bDAO.BoardInsert(vo);
		} catch (Exception e) {
			System.out.println("BoardController에러 : "+e.getMessage());
		}

		return "redirect:board.do";
	}


	//게시판
	@RequestMapping(value="board.do", method=RequestMethod.GET)
	public String Board(Model model) {

		try {
			List<V1_Board> list=bDAO.BoardSelectList();
			model.addAttribute("list", list); 
			
			
			return "board/board";
		} catch (Exception e) {
			System.out.println("Board 컨트롤러 에러 : "+e.getMessage());
		}
		return null;
	}
	
	
	    //게시판글보기
		@RequestMapping(value="boardv.do", method=RequestMethod.GET)
		public String BoardView(Model model, @RequestParam("brd_no")int no) {

			try {
				
				//System.out.println("글보기 번호 : "+no);
				V1_Board vo=bDAO.BoardSelertView(no);
				//System.out.println("게시판 글보기 : "+bDAO.BoardUpHit(no));
				
				bDAO.BoardUpHit(no);
				
				model.addAttribute("vo", vo); 

				return "board/boardv";
			} catch (Exception e) {
				System.out.println("BoardView 컨트롤러 에러 : "+e.getMessage());
				return "redirect:board.do";
			}
			
		}
		
		
		 private int BoardUpHit(int no) {
			// TODO Auto-generated method stub
			return 0;
		}



		//게시판글수정 불러오기
		@RequestMapping(value="boarde.do", method=RequestMethod.GET)
		public String BoardEditSelect(@ModelAttribute("vo") V1_Board vo) {

			try {
				System.out.println("수정들어옴");
				return "board/boarde";
			} catch (Exception e) {
				System.out.println("BoardEditSelect 컨트롤러 에러 : "+e.getMessage());
				return null;
			}
			
		}
		
		
		 //게시판글수정
		@RequestMapping(value="boardu.do", method=RequestMethod.POST)
		public String BoardUpdate(@ModelAttribute("vo")V1_Board vo) {

			try {

				bDAO.BoardUpdate(vo);

			} catch (Exception e) {
				System.out.println("BoardUpdateSelect 컨트롤러 에러 : "+e.getMessage());
				
			}
			
			return "redirect:boardv.do?brd_no="+vo.getBrd_no();
		}

		
		 //게시판글삭제
		@RequestMapping(value="boardd.do", method=RequestMethod.GET)
		public String BoardDelete(@RequestParam("brd_no")int no) {

			try {
				System.out.println("글삭제 번호 : "+no);
				bDAO.BoardDelete(no);

				return "redirect:board.do";
			} catch (Exception e) {
				System.out.println("BoardEditSelect 컨트롤러 에러 : "+e.getMessage());
				return "redirect:board.do";
			}
			
		}
	
}
