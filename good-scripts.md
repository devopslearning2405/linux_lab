# Open Terminal from MacOS

osascript -e 'tell app "Terminal" to do script "ping 8.8.8.8"'

# System check and clean journal:

find / -type f -size +1G 

journalctl --vacuum-time=2d




# Run docker on Windows 
docker run --name db -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -v postgresql:/var/lib/postgresql -v postgresql_data:/var/lib/postgresql/data -p 5432:5432 postgres
docker run --name sonarqube --link db -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -e sonar.jdbc.url=jdbc:postgresql://db:5432/sonar -e sonar.jdbc.username=sonar -e sonar.jdbc.password=sonar  -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_conf:/opt/sonarqube/conf -v sonarqube_data:/opt/sonarqube/data -v sonarqube_bundled-plugins:/opt/sonarqube/bundled-plugins -p 9000:9000 sonarqube:8.5-community

# Run build maven project with no more download maven
docker run -v //C/Users/hoang.nguyen.quoc/.m2:/root/.m2 -v //d/Source/payok/payok-backend:/home/maven -w /home/maven quochoang2405/maven3-jdk11-build mvn -DskipTests package


# CLoudformation deploy
aws cloudformation deploy --template-file ./ecs-services_copy.yaml --stack-name test-new-deployment --parameter-overrides $(cat ./ecs-service-dev-backend-SSM.ini) --profile payok

aws cloudformation ${params.command} --region ${params.REGION} --stack-name ${params.STACK_NAME} --template-body file://api-web-acl.yaml --parameters file://${params.ENVIRONMENT}.json --capabilities CAPABILITY_NAMED_IAM

# Edit server before run docker-compose sonarqube

sysctl -w vm.max_map_count=262144

# Install MongoDB shell
echo -e "[mongodb-org-4.0] \nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/4.0/x86_64/\ngpgcheck=1 \nenabled=1 \ngpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-4.0.repo
sudo yum install -y mongodb-org-shell


# Cache yarn build
yarn config set cache-folder /data/yarn-cach






