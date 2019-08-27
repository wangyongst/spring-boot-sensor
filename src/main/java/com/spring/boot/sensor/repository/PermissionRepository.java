package com.spring.boot.sensor.repository;

import com.spring.boot.sensor.entity.Permission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.RepositoryDefinition;
import org.springframework.stereotype.Repository;

@Repository
@RepositoryDefinition(domainClass = Permission.class, idClass = Integer.class)
public interface PermissionRepository extends JpaRepository<Permission,Integer> {
}