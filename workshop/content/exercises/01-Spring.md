
#### Switch to Java 21 for Spring Boot 3
```execute-1
sdk use java 21.0.1-graalce && java -version
```

#### Start the Spring Boot application
```execute-1
cd hello-spring-boot-2-6.git && ./mvnw -q clean package spring-boot:start -DskipTests 2>&1 | tee '$1' &
```

#### Stop the Spring Boot application
```execute-1
./mvnw spring-boot:stop -Dspring-boot.stop.fork
```

#### Check the health of the application
```execute-1
http :8080/actuator/health
```

#### Display memory usage of the application
```execute-1
pid=$1 && log_file=$2 && rss=$(ps -o rss= "$pid" | tail -n1) && mem_usage=$(bc <<< "scale=1; ${rss}/1024") && echo "The process was using ${mem_usage} megabytes" && echo "${mem_usage}" >> "$log_file"
```

#### Generate the dependencies of Springboot 2.6
```execute-1

```

#### Upgrade the application to Spring Boot 3.0
```execute-1
./mvn -U org.openrewrite.maven:rewrite-maven-plugin:run -Drewrite.recipeArtifactCoordinates=org.openrewrite.recipe:rewrite-spring:RELEASE -Drewrite.activeRecipes=org.openrewrite.java.spring.boot3.UpgradeSpringBoot_3_0
```

#### Generate the dependencies of Springboot 3.0
```execute-1

```

#### Upgrade the application to Spring Boot 3.2
```execute-1
./mvnw -U org.openrewrite.maven:rewrite-maven-plugin:run -Drewrite.recipeArtifactCoordinates=org.openrewrite.recipe:rewrite-spring:LATEST -DactiveRecipes=org.openrewrite.java.spring.boot3.UpgradeSpringBoot_3_2
```

#### Build a native image of the application

```execute-1
./mvnw -Pnative native:compile
```

#### Start the native image
```execute-1
./target/hello-spring 2>&1 | tee nativeWith3.2.log &
```

#### Stop the native image
```execute-1
npid=$(pgrep hello-spring) && kill -9 $npid
```

#### Generate the dependencies of Springboot 3.2
```execute-1

```

#### Build OCI images
```execute-1
docker pull dashaun/builder:tiny && docker tag dashaun/builder:tiny paketobuildpacks/builder:tiny && docker tag dashaun/builder:tiny paketobuildpacks/builder:base && ./mvnw clean spring-boot:build-image -Dspring-boot.build-image.imageName=demo:0.0.1-JVM -Dspring-boot.build-image.createdDate=now && ./mvnw clean -Pnative spring-boot:build-image -Dspring-boot.build-image.imageName=demo:0.0.1-Native -Dspring-boot.build-image.createdDate=now
```

#### 
```execute-1
echo "$(sed -nE 's/.* in ([0-9]+\.[0-9]+) seconds.*/\1/p' < $1)"
```

#### Comparison of memory usage and startup times
```execute-1
printf "%-35s %-25s %-15s %s\n" "Configuration" "Startup Time (seconds)" "(MB) Used" "(MB) Savings" && echo "--------------------------------------------------------------------------------------------" && echo  "Spring Boot 2.6 with Java 8" && STARTUP1=$(sed -nE 's/.* in ([0-9]+\.[0-9]+) seconds.*/\1/p' < java8with2.6.log) && STARTUP1=$(grep -o 'Started HelloSpringApplication in .*' < java8with2.6.log) && MEM1=$(cat java8with2.6.log2) && printf "%-35s %-25s %-15s %s\n" "Spring Boot 2.6 with Java 8" "$(startupTime 'java8with2.6.log')" "$MEM1" "-" && echo  "Spring Boot 3.2 with Java 21" && STARTUP2=$(grep -o 'Started HelloSpringApplication in .*' < java21with3.2.log) && MEM2=$(cat java21with3.2.log2) && PERC2=$(bc <<< "scale=2; 100 - ${MEM2}/${MEM1}*100") && printf "%-35s %-25s %-15s %s \n" "Spring Boot 3.2 with Java 21" "$(startupTime 'java21with3.2.log')" "$MEM2" "$PERC2%" && echo "Spring Boot 3.2 with AOT processing, native image" && STARTUP3=$(grep -o 'Started HelloSpringApplication in .*' < nativeWith3.2.log) && MEM3=$(cat nativeWith3.2.log2) && PERC3=$(bc <<< "scale=2; 100 - ${MEM3}/${MEM1}*100") && printf "%-35s %-25s %-15s %s \n" "Spring Boot 3.2 with AOT, native" "$(startupTime 'nativeWith3.2.log')" "$MEM3" "$PERC3%" && echo "--------------------------------------------------------------------------------------------"
```

#### 
```execute-1

```
