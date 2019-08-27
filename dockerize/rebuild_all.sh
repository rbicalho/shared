docker stop domain && docker rm domain
docker stop schema && docker rm schema

docker build -t domain_schema -f Dockerfile.schema --no-cache .
docker build -t domain_reader -f Dockerfile.reader --no-cache .

docker run --name schema --network=plataforma_network -d -p 9092:80 domain_schema
docker run --name domain --network=plataforma_network -p 9093:80 -d domain_reader

