package com.spring.boot.sensor.repository;

import com.spring.boot.sensor.entity.Role;
import com.spring.boot.sensor.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.RepositoryDefinition;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RepositoryDefinition(domainClass = User.class, idClass = Integer.class)
public interface UserRepository extends JpaRepository<User, Integer>, JpaSpecificationExecutor<User> {
    List<User> findByMobileAndPassword(String mobile, String password);

    List<User> findByMobile(String mobile);

    List<User> findByRole(Role role);
}