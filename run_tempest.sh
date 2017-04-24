cd /home/rally
git clone https://git.openstack.org/openstack/tempest
pip install tempest==15.0.0
source /home/rally/openrc_tempest
rally-manage db recreate
rally deployment create --fromenv --name=tempest
rally verify create-verifier --type tempest --name tempest-verifier --source /home/rally/tempest --version 15.0.0 --system-wide
rally verify configure-verifier --extend /home/rally/temp.conf
rally verify configure-verifier --show