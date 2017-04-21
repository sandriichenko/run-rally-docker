cd /var/lib/
git clone https://git.openstack.org/openstack/tempest -b 14.0.0 &&     pip install tempest==14.0.0
source /home/rally/openrc 
rally-manage db recreate
rally deployment create --fromenv --name=tempest
rally verify create-verifier --type tempest --name tempest-verifier --source /var/lib/tempest --version 14.0.0 --system-wide
rally verify configure-verifier --extend temp.conf
rally verify configure-verifier --show
wget https://raw.githubusercontent.com/openstack/ironic/master/test-requirements.txt
pip install -r test-requirements.txt
rally verify add-verifier-ext --source https://github.com/openstack/ironic.git
rally verify list-verifier-tests
