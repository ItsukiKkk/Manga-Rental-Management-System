package com.seiryo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.TitleMapper;
import com.seiryo.pojo.Title;
import com.seiryo.service.TitleService;

/**
 * サービス実装クラス：タイトル
 */
@Service
@Transactional
public class TitleServiceImpl implements TitleService{
	@Autowired
	TitleMapper titleMapper;	
	
	@Override
	public Title getTitleById(String titleId) {
		return titleMapper.getTitleById(titleId);
	}

	@Override
	public Title getTitleByTemCd(String temCd) {
		return titleMapper.getTitleByTemCd(temCd);
	}
	@Override
	public List<Title> getAllTitles() {
		return titleMapper.getAllTitles();
	}

	@Override
	public List<Title> getTitleList(Title title) {
		return titleMapper.getTitleList(title);
	}

	@Override
	public int insertTitle(Title title) {
		return titleMapper.insertTitle(title);
	}

	@Override
	public int updateTitle(Title title) {
		return titleMapper.updateTitle(title);
	}

	@Override
	public int delTitle(String titleId) {
		return titleMapper.delTitle(titleId);
	}


}
