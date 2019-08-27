package com.spring.boot.sensor.repository;

        import com.spring.boot.sensor.entity.Role;
        import com.spring.boot.sensor.entity.Role2Permission;
        import org.springframework.data.jpa.repository.JpaRepository;
        import org.springframework.data.repository.RepositoryDefinition;
        import org.springframework.stereotype.Repository;

@Repository
@RepositoryDefinition(domainClass = Role2Permission.class, idClass = Integer.class)
public interface Role2PermissionRepository extends JpaRepository<Role2Permission, Integer> {

    void deleteAllByRole(Role role);
}