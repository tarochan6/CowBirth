package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import domain.Cow;

public class CowDaoImpl implements CowDao {

	private DataSource ds;

	public CowDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	
	
	@Override
	public List<Cow> findCowData(int userId) throws Exception {
		List<Cow> cow = new ArrayList<>();

		try (Connection con = ds.getConnection()) {
			String sql = "SELECT cows.id, cows.user_id, cows.name, cows.note, cows.aiday, varietys.name as variety_name, varietys.id as variety_id,"
					+ " CASE variety_id"
					+ "  WHEN 1 THEN DATE_ADD(aiday, INTERVAL 280 DAY)"
					+ "  WHEN 2 THEN DATE_ADD(aiday, INTERVAL 285 DAY)"
					+ "  WHEN 3 THEN DATE_ADD(aiday, INTERVAL 280 DAY)"
					+ " ELSE NULL"
					+ " end birthday,"
					+ " CASE variety_id"
					+ "  WHEN 1 THEN DATE_ADD(aiday, INTERVAL 28 DAY)"
					+ "  WHEN 2 THEN DATE_ADD(aiday, INTERVAL 28 DAY)"
					+ "  WHEN 3 THEN DATE_ADD(aiday, INTERVAL 28 DAY)"
					+ " ELSE NULL"
					+ " end ptday"
					+ " FROM cowbirth_db.cows"
					+ " JOIN varietys ON cows.variety_id = varietys.id"
					+ " WHERE user_id = ?"
					+ " ORDER BY birthday ASC";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, userId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				cow.add(mapToCow(rs));
			}
		} catch (Exception e) {
			throw e;
		}
		return cow;
	}

	@Override
	public Cow findById(int id, int userId) throws Exception {
		Cow cow = null;
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT *,varietys.name AS variety_name, varietys.id AS variety_id"
			+ "	FROM cowbirth_db.cows"
			+ " JOIN varietys ON cows.variety_id = varietys.id"
			+ "	WHERE cows.id = ? AND user_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setInt(2, userId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				cow = mapToCow(rs);
			}
		} catch (Exception e) {
			throw e;
		}
		return cow;
	}

	@Override
	public void insert(Cow cows) throws Exception {

		try (Connection con = ds.getConnection()) {
			String sql = "INSERT INTO cows "
					+ " (user_id, variety_id, name, aiday, note) "
					+ " VALUES (?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, cows.getUserId());
			stmt.setInt(2, cows.getVarietyId());
			stmt.setString(3, cows.getCowName());
			stmt.setDate(4, new java.sql.Date(cows.getAiDay().getTime()));
			stmt.setString(5, cows.getNote());
			stmt.executeLargeUpdate();
		}catch (Exception e) {
			throw e;
		}

	}

	@Override
	public void update(Cow cows) throws Exception {
		
		try (Connection con = ds.getConnection()) {
			String sql = "UPDATE cows SET "
					+ " variety_id = ?, name = ?, aiday = ?, note = ? "
					+ " WHERE id = ? AND user_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, cows.getVarietyId());
			stmt.setString(2, cows.getCowName());
			stmt.setDate(3, new java.sql.Date(cows.getAiDay().getTime()));
			stmt.setString(4, cows.getNote());
			stmt.setInt(5, cows.getId());
			stmt.setInt(6, cows.getUserId());
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public void delete(int id, int userId) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "DELETE FROM cows WHERE id = ? AND user_id = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setInt(2, userId);
			stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		}

	}

	protected Cow mapToCow(ResultSet rs) throws Exception {
		Cow cow = new Cow();
		cow.setId(rs.getInt("id"));
		cow.setUserId(rs.getInt("user_id"));
		cow.setVarietyId(rs.getInt("variety_id"));
		cow.setCowName(rs.getString("name"));
		cow.setAiDay(rs.getDate("aiday"));
		cow.setNote(rs.getString("note"));
		cow.setBirthDay(rs.getDate("birthday"));
		cow.setPtDay(rs.getDate("ptday"));
		cow.setVarietyName(rs.getString("variety_name"));
		return cow;
	}

}
