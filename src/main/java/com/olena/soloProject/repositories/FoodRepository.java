package com.olena.soloProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.olena.soloProject.models.Food;

@Repository
public interface FoodRepository extends CrudRepository<Food, Long>{
	List<Food>findAll();
}
