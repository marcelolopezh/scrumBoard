package com.marcelo.scrumBoard.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.marcelo.scrumBoard.models.Project;

@Repository
public interface ProjectRepository extends CrudRepository<Project,Long>{
	List<Project> findAll();
	Optional<Project> findById(Long id);
}
