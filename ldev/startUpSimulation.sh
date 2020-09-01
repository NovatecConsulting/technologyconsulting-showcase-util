docker-compose up -d database
sleep 10

docker-compose up -d manufacturedomain orderdomain supplierdomain
sleep 10

docker-compose up driver
