package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataSource;

import domain.Cow;

public class CowDaoImpl implements CowDao {

	private DataSource ds;
	
	public CowDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<Cow> findAll() throws Exception {
	List<Cow> cowList = new ArrayList<>();
	
	try (Connection con = ds.getConnection()) {
		String sql = 
				"SELECT * ,\n"
				+ "	CASE variety_id\n"
				+ "				WHEN 1 THEN DATE_ADD(aiday, INTERVAL 10 DAY)\n"
				+ "				WHEN 2 THEN DATE_ADD(aiday, INTERVAL 30 DAY)\n"
				+ "				WHEN 3 THEN DATE_ADD(aiday, INTERVAL 60 DAY)\n"
				+ "				ELSE NULL\n"
				+ "				end birthday,                \n"
				+ "	CASE variety_id\n"
				+ "				WHEN 1 THEN DATE_ADD(aiday, INTERVAL 15 DAY)\n"
				+ "				WHEN 2 THEN DATE_ADD(aiday, INTERVAL 35 DAY)\n"
				+ "				WHEN 3 THEN DATE_ADD(aiday, INTERVAL 65 DAY)\n"
				+ "				ELSE NULL\n"
				+ "				end ptday\n"
				+ "                \n"
				+ "                FROM cowbirth_db.cows\n"
				+ "				WHERE user_id = ? \n"
				+ "                ORDER BY birthday DESC";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setInt(1, userId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			cowList.add(mapToCow(rs));
		}
		}catch (Exception e) {
			throw e;
		}
		return cowList;
	}

	

	@Override
	public Cow findById(int id, int loginId) throws Exception {
Cow cow = null;
try(Connection con = ds.getConnection()){
	String sql = ;
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setInt(1,id);
	ResultSet rs = stmt.executeQuery();
	if(rs.next()) {
		cow = mapToCow(rs);
	}
}
	}

	@Override
	public void insert(Cow cows) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public void update(Cow cows) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	@Override
	public void delete(int id, int loginId) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		
	}
	
	protected Cow mapToCow(ResultSet rs) throws Exception {
	Cow cow = new Cow();
	cow.setId((Integer) rs.getObject("id"));
	cow.setUserId((Integer) rs.getInt("user_id"));
	cow.setVariety((Integer) rs.getInt("variety_id"));
	cow.setCowName(rs.getString("name"));
	cow.setAiDay(rs.getDate("aiday"));
	cow.setNote(rs.getString("note"));
	cow.setBirthDay(rs.getDate("birthday"));
	cow.setPtDay(rs.getDate("ptday"));
	return cow;
	}
	
}
