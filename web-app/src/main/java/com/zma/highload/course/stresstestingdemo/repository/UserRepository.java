package com.zma.highload.course.stresstestingdemo.repository;

import com.zma.highload.course.stresstestingdemo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
