package com.terran.boilerplate.entity;

import java.util.Date;

public class FilterCondition {
	
    private String deliverable;

    
	private String assigned_to_team;

    private Date deadline;

    private Long po_id;
	
	public String getDeliverable() {
		return deliverable;
	}

	public void setDeliverable(String deliverable) {
		this.deliverable = deliverable;
	}

	public String getAssigned_to_team() {
		return assigned_to_team;
	}

	public void setAssigned_to_team(String assigned_to_team) {
		this.assigned_to_team = assigned_to_team;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Long getPo_id() {
		return po_id;
	}

	public void setPo_id(Long po_id) {
		this.po_id = po_id;
	}

	public FilterCondition(){ }

}
