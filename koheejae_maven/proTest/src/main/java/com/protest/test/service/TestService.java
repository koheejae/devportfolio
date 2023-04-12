package com.protest.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.protest.test.dao.TestDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class TestService {
	@Autowired
	private TestDAO testDAO;
	
	public List listtests() throws DataAccessException {
		List testsList = null;
		testsList = testDAO.listTests();
		return testsList;
	}
	
}
