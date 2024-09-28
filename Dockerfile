# Java tabanlı bir image kullanıyorum
FROM openjdk:11-jre-slim

# Çalışma dizini oluşturdum
WORKDIR /app

# Projeyi kopyaladım
COPY target/kafka-postgres-example-1.0-SNAPSHOT.jar /app/kafka-postgres-example.jar

# Uygulamayı başlattım
CMD ["java", "-jar", "kafka-postgres-example.jar"]

