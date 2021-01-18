package com.olena.soloProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.olena.soloProject.models.Cart;


@Repository
public interface CartRepository extends CrudRepository<Cart, Long> {

}
