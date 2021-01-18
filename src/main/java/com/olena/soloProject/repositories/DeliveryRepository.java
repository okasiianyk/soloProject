package com.olena.soloProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.olena.soloProject.models.Delivery;

@Repository
public interface DeliveryRepository extends CrudRepository<Delivery, Long>{

}
