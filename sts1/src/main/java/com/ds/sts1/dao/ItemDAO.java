package com.ds.sts1.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Item;

@Service
public class ItemDAO {

	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession = null;

	public List<V1_Item> selectItem (){
		return sqlSession.selectList("V1_Item.selectItem");
	}


	public int selectItemNo() {
		return sqlSession.selectOne("V1_Item.selectItemNo");
	}

	public int insertItemOne(V1_Item vo) {
		return sqlSession.selectOne("V1_Item.insertItemOne", vo);
	}

	public V1_Item selectItemImg(int no, int idx) {
		if(idx == 1) {
			return sqlSession.selectOne("V1_Item.selectImgOne", no);
		}
		else if(idx == 2) {
			return sqlSession.selectOne("V1_Item.selectImgTwo", no);
		}
		//3번
		return sqlSession.selectOne("V1_Item.selectImgThree", no);

	}


	//사용자용 이미지
	public V1_Item selectItemImg(int no) {
		return sqlSession.selectOne("V1_Item.selectImgAll", no);
	}


	//선택지우기
	public int deleteItemChk(List<Integer> list) {
		return sqlSession.selectOne("V1_Item.deleteItem", list);
		
	}


	//선택수정
	public V1_Item selectEditItemOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("V1_Item.selectEditItemOne", no);
	}


	
	//한개삭제
	public void deleteItem(int no) {
		// TODO Auto-generated method stub
		sqlSession.selectOne("V1_Item.deleteOne", no);
	}


	//선태수정후
	public int updateItemOne(V1_Item vo) {
		return sqlSession.selectOne("V1_Item.updateItemOne", vo);
		
	}
	
}
