package com.marcelo.scrumBoard.models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="projects")
public class Project implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String description;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private User user;
	
	@OneToMany(mappedBy="project", fetch = FetchType.LAZY)
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private List<Sprint> sprints;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "projects_members",
			joinColumns = @JoinColumn (name="project_id"),
			inverseJoinColumns = @JoinColumn (name="user_id")
			)
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private List<User> members;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "projects_clients",
			joinColumns = @JoinColumn (name="project_id"),
			inverseJoinColumns = @JoinColumn (name="user_id")
			)
	@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
	private List<User> clients;
	
	
	public Project() {
		
	}
	@PrePersist
    protected void onCreate(){
	    this.createdAt = new Date();
        this.updatedAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
	    this.updatedAt = new Date();
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Sprint> getSprints() {
		return sprints;
	}
	public void setSprints(List<Sprint> sprints) {
		this.sprints = sprints;
	}
	public List<User> getMembers() {
		return members;
	}
	public void setMembers(List<User> members) {
		this.members = members;
	}
	public List<User> getClients() {
		return clients;
	}
	public void setClients(List<User> clients) {
		this.clients = clients;
	}
    
    
	
}
