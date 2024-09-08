package com.dev.sandbox;

import org.springframework.boot.SpringApplication;

public class TestDevSandboxApplication {

	public static void main(String[] args) {
		SpringApplication.from(DevSandboxApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
