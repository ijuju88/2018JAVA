package com.ds.sts1.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.sts1.vo.V1_Item;


public interface ItemDAO {

	
	//물품리스트
	public List<V1_Item> selectItem ();


	//추가용물품번호추가
	public int selectItemNo();

	//물품번호
	public int insertItemOne(V1_Item vo) ;

	//이미지 출력용
	public V1_Item selectItemImg(int no, int idx);


	//사용자용 이미지
	public V1_Item selectItemImg(int no);

	//선택지우기
	public int deleteItemChk(List<Integer> list) ;

	//선택수정
	public V1_Item selectEditItemOne(int no) ;

	
	//한개삭제
	public void deleteItem(int no);


	//선태수정후
	public int updateItemOne(V1_Item vo) ;

	
}
