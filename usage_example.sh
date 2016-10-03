allure_version="1.4.24.RC3"

#!/bin/bash
while [[ $# > 0 ]]
do
    key="$1"

    case $key in
        VERSION)
        allure_version="$2"
        shift # past argument
        ;;
    esac
    shift
done

ALLURE_DOCKER_IMAGE="automationwizards/allure:$allure_version"
ALLURE_DOCKER_FILE="$allure_version.Dockerfile"

title="Allure $allure_version Tasks"
prompt="Pick an option:"
options=("Generate Report" "Open Report (Mac/Chrome)" "Build Image" "Push Image" "Pull Image" "Kill All Containers" "Delete All Containers" "Delete All Images")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Exit"; do

    case "$REPLY" in

    1 ) docker run \
        -v $(pwd)/allure-report:/allure-report \
        -v $(pwd)/allure-results:/allure-results \
        ${ALLURE_DOCKER_IMAGE} allure report generate /allure-results -o /allure-report ;;
    2 ) docker run -i \
        --name allure \
        -p 5000:5000 \
        -v $(pwd)/allure-report:/allure-report \
        ${ALLURE_DOCKER_IMAGE}  \
        allure report open -o /allure-report -p 5000 & \
        /usr/bin/open -a "/Applications/Google Chrome.app" 'http://127.0.0.1:5000' ;;
    3 ) docker build -t ${ALLURE_DOCKER_IMAGE} -f ${ALLURE_DOCKER_FILE} . ;;
    4 ) docker push ${ALLURE_DOCKER_IMAGE} ;;
    5 ) docker pull ${ALLURE_DOCKER_IMAGE} ;;
    6 ) docker kill $(docker ps -q) ;;
    7 ) docker rm $(docker ps -a -q) ;;
    8 ) docker rmi $(docker images -q) ;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done

docker stop allure &>/dev/null || true
docker rm allure &>/dev/null || true


