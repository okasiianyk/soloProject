package com.olena.soloProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.olena.soloProject.models.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long>{
	List<Order>findAll();
}
