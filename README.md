              |  Docker Allure
--------------------------|------------------------------------------------------------
:sparkles: | Use Allure with a single command and keep your system clean
:wrench: |  Built with Alpine Linux so the whole image is only **76mb!**
:computer: | Reports are shared back to your local filesystem
:octocat: | Supports custom allure.properties files
:rocket: | Use your favourite OS/CI without worrying about dependancies

### Commands

#### Pull Image
	$ docker pull automationwizards/allure:1.4.24.RC3 # Tag can be any recent allure version
	
#### Build Image
	$ docker build -t <tag_name> -f 1.4.24.RC3.Dockerfile # Pass -f to use specific version of Allure
	
#### Generate Report
	$ docker run \
        -v $(pwd)/allure-report:/allure-report \   # Mandatory - Where to place the complied report
        -v $(pwd)/allure-results:/allure-results \ # Mandatory - Where to look for test runs
		-v $(pwd)/allure-config:/allure-config \   # Optional - Where to look for an allure.properties file
        automationwizards/allure:1.4.24.RC3 allure report generate /allure-results -o /allure-report	

#### Open Report in Chrome on Mac
	$ docker run -i \
        -p 5000:5000 \
        -v $(pwd)/allure-report:/allure-report \
        automationwizards/allure:1.4.24.RC3 allure report open -o /allure-report -p 5000 & \
        /usr/bin/open -a "/Applications/Google Chrome.app" 'http://127.0.0.1:5000'

#### Start Webserver (go to 127.0.0.1:5000 in any browser to view report)
	$ docker run -i \
        -p 5000:5000 \
        -v $(pwd)/allure-report:/allure-report \
        automationwizards/allure:1.4.24.RC3  \
        allure report open -o /allure-report -p 5000
	
#### 1.4.23
	$ automationwizards/allure:1.4.23
You can use all of the commands given above, just change the tag version when calling the docker image!


### Helper CLI Tool

I have included an cli script and a demo allure-results folder in this repo to highlight the ease of using allure inside a docker container. Simply use the command below and then select any of the options from the list. Have Fun :) 

```
$ ./usage_example.sh VERSION 1.4.24.RC3

Allure 1.4.24.RC3 Tasks
1) Generate Report	     6) Kill All Containers
2) Open Report (Mac/Chrome)  7) Delete All Containers
3) Build Image		     8) Delete All Images
4) Push Image		     9) Exit
5) Pull Image
```
