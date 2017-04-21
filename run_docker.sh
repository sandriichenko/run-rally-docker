apt-get install -y docker.io
docker pull rallyforge/rally:0.9.0
image_id=$(docker images | grep 0.9.0| awk '{print $3}')
docker run --net host -v /home/:/home/rally -tid -u root $image_id
docker_id=$(docker ps | grep $image_id | awk '{print $1}'| head -1)
cd /home
cp ${file} /home/openrc
wget https://raw.githubusercontent.com/sandriichenko/run-rally-docker/master/tempest_confs/mcp_${conf}.conf -o temp,conf
wget https://raw.githubusercontent.com/sandriichenko/run-rally-docker/master/skip_lists/mcp_${conf}_skip.yaml -o skip.yaml
wget https://raw.githubusercontent.com/sandriichenko/run-rally-docker/master/run_tempest.sh
wget https://raw.githubusercontent.com/sandriichenko/run-rally-docker/master/plugins.sh
wget https://raw.githubusercontent.com/sandriichenko/run-rally-docker/master/debug.sh
docker exec -ti $docker_id bash -c "bash run_tempest.sh"
docker exec -ti $docker_id bash -c "bash"
