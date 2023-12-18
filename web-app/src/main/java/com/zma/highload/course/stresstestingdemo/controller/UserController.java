package com.zma.highload.course.stresstestingdemo.controller;

import com.zma.highload.course.stresstestingdemo.model.User;
import com.zma.highload.course.stresstestingdemo.repository.UserRepository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.Random;

@RestController
@RequestMapping("/users")
public class UserController {

    private static final int FIFTY_YEARS = 50 * 365;
    private final Random random;
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
        random = new Random();
    }

    @PostMapping()
    public void createUser() {
        userRepository.save(new User(getFirstname(), date()));

    }

    private String getFirstname() {
        return "u" + random.nextInt(40000000);
    }

    public LocalDate date() {
        return LocalDate.ofEpochDay(random.nextInt(0, FIFTY_YEARS));
    }
}
