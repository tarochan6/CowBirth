package dao;

import java.util.List;

import domain.Cow;

public interface CowDao {

	List<Cow> findAll() throws Exception;
	
	Cow findById(int id, int loginId) throws Exception;
	
	void insert(Cow cows) throws Exception; 
	void update(Cow cows) throws Exception; 
	void delete(int id, int loginId) throws Exception; 
	
}
