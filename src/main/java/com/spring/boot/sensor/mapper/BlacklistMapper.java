package com.spring.boot.sensor.mapper;

import com.spring.boot.sensor.entity.Blacklist;
import com.spring.boot.sensor.entity.Dept;
import com.spring.boot.sensor.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BlacklistMapper {

    @Select("select * from blacklist where type = #{type}")
    List<Blacklist> findAll(int type);

    @Select("select * from blacklist where type <> 2 and type = 1 and ip like concat('%',#{ip},'%') ")
    List<Blacklist> findAllByBlack(String ip);

    @Update("update blacklist set ip = #{ip} where type = #{type}")
    void update(@Param("ip") String ip, @Param("type") int type);
}
