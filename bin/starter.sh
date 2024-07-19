echo '🖖 READY TO START!'
DB_PASSWORD=tar123nished456_
container_name=tarnishedcore-1

version=$(cat tarnishedcore_deploy/version)

echo $version
echo '📦 Docker building ...'
docker build tarnishedcore_deploy -t tarnishedcore:$version
echo '🚶 Docker run ...'
docker run -d -p 3000:3000 -e DB_PASSWORD=$DB_PASSWORD --name=$container_name tarnishedcore:$version
echo '🔥 Docker exec ...'
docker exec -it $container_name bin/rails db:create db:migrate
echo '🤟🏼 DONE!'