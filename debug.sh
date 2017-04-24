id=$(rally verify list-verifiers |grep tempest |awk {'print$2'})
tempest_dir="/home/rally/.rally/verification/verifier-$id/repo"
cd $tempest_dir
deploy_id=$(rally deployment list |grep tempest |awk {'print$2'})
TEMPEST_CONFIG_DIR="/home/rally/.rally/verification/verifier-$id/for-deployment-$deploy_id"
export TEMPEST_CONFIG_DIR=$TEMPEST_CONFIG_DIR
pip install ipdb