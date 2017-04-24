if [ ${1} == ironic ]
then
    git clone https://github.com/openstack/ironic.git
    pip install -r ironic/test-requirements.txt
    rally verify add-verifier-ext --source /home/rally/ironic
fi

if [ ${1} == designate ]
then
    pip install ddt==1.0.1
    git clone https://github.com/openstack/designate-tempest-plugin.git
    pip install -r designate-tempest-plugin/test-requirements.txt
    rally verify add-verifier-ext --source /home/rally/designate-tempest-plugin
fi

if [ ${1} == ceilometer ]
then
    git clone https://github.com/openstack/ceilometer.git
    pip install -r ceilometer/test-requirements.txt
    rally verify add-verifier-ext --source /home/rally/ceilometer
fi

rally verify configure-verifier --extend temp.conf --reconfigure --show