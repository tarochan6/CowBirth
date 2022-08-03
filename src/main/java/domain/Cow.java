package domain;

import java.util.Date;

public class Cow {

	private Integer id;
	private Integer userId;
	private String cowName;
	private Integer varietyId;
	private Date aiDay;
	private Date birthDay;
	private Date ptDay;
	private String note;
	private String varietyName;
	
	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCowName() {
		return cowName;
	}
	public void setCowName(String cowName) {
		this.cowName = cowName;
	}
	public Integer getVarietyId() {
		return varietyId;
	}
	public void setVarietyId(Integer variety) {
		this.varietyId = variety;
	}
	public Date getAiDay() {
		return aiDay;
	}
	public void setAiDay(Date aiDay) {
		this.aiDay = aiDay;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	public Date getPtDay() {
		return ptDay;
	}
	public void setPtDay(Date ptDay) {
		this.ptDay = ptDay;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public String getVarietyName() {
		return varietyName;
	}
	public void setVarietyName(String varietyName) {
		this.varietyName = varietyName;
	}
	
}
