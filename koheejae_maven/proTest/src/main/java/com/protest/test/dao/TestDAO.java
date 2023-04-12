package com.protest.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.protest.test.vo.TestVO;


@Repository
public class TestDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List listTests() throws DataAccessException {
		List<TestVO> testsList = null;
		testsList = sqlSession.selectList("mapper.test.selectTestList");
		return testsList;
	}
}
