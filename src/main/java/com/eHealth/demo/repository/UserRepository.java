package com.eHealth.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.eHealth.demo.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
