apt-get install -y docker.io
apt-get install -y cgroup-bin
docker pull rallyforge/rally:0.8.1
cp /root/openrc /home
cp run_tempest_with_ironic.sh /home
image_id=$(docker images | grep 0.8.1| awk '{print $3}')
docker run --net host -v /home/:/home/rally -tid -u root $image_id
docker_id=$(docker ps | grep $image_id | awk '{print $1}'| head -1)
# docker exec -ti $docker_id bash
docker exec -ti $docker_id bash -c "source run_tempest_with_ironic.sh"
