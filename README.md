# Docker Allure

## Synopsis

Docker Allure aims to simplify the use of allure in multi tennant environments by relegating it to a docker container. Users will not need to install allure or any of its dependancies to use it! 
This is especially useful when generating reports in CI/CD environments where package management can be a pain. 

## Installation 

### (1.4.24.RC3)
	$ docker pull automationwizards/allure:1.4.24.RC3
OR
	$ ./example_usage.sh VERSION 1.4.24.RC3 #(pick option 5)

### (1.4.23)
	$ docker pull automationwizards/allure:1.4.23
OR
	$ ./example_usage.sh VERSION 1.4.23 #(pick option 5)

## Example CLI Usage

I have included an cli script in this repo to show how one might go about using allure in a docker container. 

The big wins are 
1. Easily generate Allure reports against different versions of allure!
2. Easily open Allure reports while running the webserver inside the docker container! 

	$ ./usage_example.sh VERSION 1.4.24.RC3

	`Allure 1.4.24.RC3 Tasks
	1) Generate Report	     6) Kill All Containers
	2) Open Report (Mac/Chrome)  7) Delete All Containers
	3) Build Image		     8) Delete All Images
	4) Push Image		     9) Exit
	5) Pull Image`