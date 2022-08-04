package dao;

import java.util.List;

import domain.Variety;


public interface VarietyCowDao {

	List<Variety> findAll() throws Exception;
	Variety findById(Integer id) throws Exception;
	void insert(Variety variety) throws Exception;
	void update(Variety variety) throws Exception;
	void delete(Variety variety) throws Exception;
	
}
