docker rm -f $(docker ps -a |grep $(docker images |grep 0.9.0 | awk {'print$3'}) |awk {'print$1'})
rm -rf debug.sh install_plugin.sh ironic .rally .rally.sqlite run_tempest.sh skip.yaml temp.conf tempest cleanup.sh designate-tempest-plugin ceilometer
