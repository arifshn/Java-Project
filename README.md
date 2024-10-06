Bu projemde kafka kullanarak üretilen mesajları postgresql de kaydeden bir java uygulaması yaptım 
Kafka producer mesajları gönderir kafka consumer ise bu mesajları alır ve postgresql veritabanına kaydeder

ilk olarak maven projesi oluşturdum 
mvn archetype:generate -DgroupId=com.example -DartifactId=kafka-postgres-example -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
Bu komut projenin dosya dizinini oluşturdu ve gerekli bağımlılıklarını pom.xml dosyasının içine yazdım 

postgresql i ubuntu üzerinde kurmak için sırasıyla 
sudo apt update
sudo apt install postgresql postgresql-contrib
kodlarını yazdım 

Kafkadan alınan verilerin saklanabilmesi için bir veritabanı ve kullanıcı oluşturdum 
sudo -i -u postgres
psql ile terminal ekranına eriştim 

Veritabanı ve kullanıcı oluşturmak için 
CREATE USER youruser WITH PASSWORD 'password';
CREATE DATABASE deneme_database;
GRANT ALL PRIVILEGES ON DATABASE kafka_db TO youruser;
sırasıyla bu komutları kendime göre doldurdum 	

Kafka yı kurmak için direk indirme linki vererek indirmesini sağladım 

wget https://downloads.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
(sürümlerde adres değişiklik gösterebilir)
indirdiğim dosyayı arşivden çıkarmak için aşağıdaki komutu çalıştırdım
tar -xzf kafka_2.13-3.1.0.tgz
mv kafka_2.13-3.1.0 kafka

Daha sonrasında kafka ya mesaj gönderen producer ve mesajalrı alıp postgresql e kaydetmesini sağlayan consumer adlı java dosyalarını ayarladım. Sırasıyla producer ve consumer dosyalarını çalıştırdım 
mvn exec:java -Dexec.mainClass="com.example.Producer"

mvn exec:java -Dexec.mainClass="com.example.Consumer"

SELECT * FROM kafka_data;
en son postgresql terminalinde kaydedildiğini kontrol ettim 

Dockerfile ve compose dosyalarımı kullanarak projeyi image haline getirdim ve container da ayağa kaldırdım 

