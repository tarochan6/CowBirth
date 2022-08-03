package dao;

import java.util.List;

import domain.Cow;

public interface CowDao {

	List<Cow> findCowData(int userId) throws Exception;
	
	Cow findById(int id,int userId) throws Exception;
	
	void insert(Cow cows) throws Exception; 
	void update(Cow cows) throws Exception; 
	void delete(int id,int userId) throws Exception;


	
}
