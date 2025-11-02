package com.seiryo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seiryo.dao.CategoryMapper;
import com.seiryo.pojo.Category;
import com.seiryo.service.CategoryService;
/**
 * サービス実装クラス：カテゴリー
 */
@Service
@Transactional
public class CategoryserviceImpl implements CategoryService{
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public Category getCategoryById(String categoryCd) {
		return categoryMapper.getCategoryById(categoryCd);
	}

	@Override
	public List<Category> getCategoryList() {
		return categoryMapper.getCategoryList();
	}

	@Override
	public List<Category> selctCategoryList(Category category) {
		return categoryMapper.selctCategoryList(category);
	}

	@Override
	public int insertCategory(String category) {
		return categoryMapper.insertCategory(category);
	}

	@Override
	public int updateCategory(Category category) {
		return categoryMapper.updateCategory(category);
	}

	@Override
	public int deleteCategory(String categoryCd) {
		return categoryMapper.deleteCategory(categoryCd);
	}

	@Override
	public Category getCategoryByCategory(String category) {
		return categoryMapper.getCategoryByCategory(category);
	}

}
