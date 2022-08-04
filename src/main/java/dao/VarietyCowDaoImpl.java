package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataSource;

import domain.Variety;

public class VarietyCowDaoImpl implements VarietyCowDao {

	private DataSource ds;

	public VarietyCowDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<Variety> findAll() throws Exception {
		List<Variety> varietyList = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM varietys";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				varietyList.add(mapToVariety(rs));
			}
		}
	}

	@Override
	public Variety findById(Integer id) throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public void insert(Variety variety) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void update(Variety variety) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}

	@Override
	public void delete(Variety variety) throws Exception {
		// TODO 自動生成されたメソッド・スタブ

	}
	
	protected Variety mapToVariety(ResultSet rs) throws Exception {
		Variety variety = new Variety();
		variety.setId(rs.getInt("id"));
		variety.setName(rs.getString("name"));
		return variety;
	}
	

}
