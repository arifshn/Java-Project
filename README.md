# Kafka ve PostgreSQL ile Mesaj Saklama Java Uygulaması

Bu proje, Kafka kullanarak mesaj üreten bir **producer** ve bu mesajları alıp PostgreSQL veritabanına kaydeden bir **consumer** içeren bir Java uygulamasıdır. Mesajlar, Kafka üzerinden üretilir ve PostgreSQL veritabanında saklanır. Aşağıda, projeyi oluşturmak için izlenen adımlar yer almaktadır.

## Adımlar:

1. **Maven Projesi Oluşturma**:
   İlk olarak Maven ile bir proje oluşturdum. Projeyi başlatmak için şu komutu kullandım:
   ```bash
   mvn archetype:generate -DgroupId=com.example -DartifactId=kafka-postgres-example -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
2. **PostgreSQL Kurulumu (Ubuntu)**:
   PostgreSQL'i Ubuntu üzerinde kurmak için aşağıdaki adımları izledim:
   ```bash
   sudo apt update
   sudo apt install postgresql postgresql-contrib
  Ardından, PostgreSQL terminaline geçerek veritabanı ve kullanıcı oluşturmak için şu komutları kullandım:
  
    sudo -i -u postgres
    psql
    CREATE USER youruser WITH PASSWORD 'password';
    CREATE DATABASE deneme_database;
    GRANT ALL PRIVILEGES ON DATABASE deneme_database TO youruser;
3. **Kafka Kurulumu**:
   Kafka'yı kurmak için doğrudan indirme linkini vererek indirmesini sağladım:
   ```bash
   wget https://downloads.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
(Sürümlerde adres değişiklik gösterebilir.) İndirdiğim dosyayı arşivden çıkarmak için aşağıdaki komutu çalıştırdım:

    tar -xzf kafka_2.13-3.1.0.tgz
    mv kafka_2.13-3.1.0 kafka
4. **Producer ve Consumer Oluşturma**:
   Daha sonrasında, Kafka'ya mesaj gönderen Producer ve mesajları alıp PostgreSQL'e kaydeden Consumer adlı Java dosyalarını ayarladım. Producer ve Consumer dosyalarını çalıştırmak için şu komutları sırasıyla kullandım:
   ```bash
   mvn exec:java -Dexec.mainClass="com.example.Producer"
   mvn exec:java -Dexec.mainClass="com.example.Consumer"
5. **Verilerin Kontrolü**:
   Son olarak, PostgreSQL terminalinde kaydedilen verileri kontrol etmek için şu SQL komutunu kullandım:
   ```bash 
    sql
    SELECT * FROM kafka_data;
6. **Docker ile Projeyi Çalıştırma**:
   Dockerfile ve Compose dosyalarımı kullanarak projeyi image haline getirdim ve container'da ayağa kaldırdım. Projeyi çalıştırmak için aşağıdaki komutu kullandım:
   ```bash
    docker-compose up --build
Sonuç:
Bu uygulama, Kafka üzerinden alınan mesajları PostgreSQL veritabanında başarıyla saklamaktadır. Proje, Docker kullanarak container ortamında sorunsuz bir şekilde çalıştırıldı.
