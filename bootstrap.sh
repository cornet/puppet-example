# bootstrap.sh
#
# * Install puppet
# * Install rsync
# * Add SSH key to root user
#
# This should be run as the root user on the host
#
ssh_key='ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA4lkBZSffWOkC1CG69WlhyMjKGTdKyria/ttjjEe1ONd5AgB9x24UhMQ698x19TK4BA/Swmr0UZ0PvjSMBKJv+mZAvulCHtsUn+aZbKkSDFcMYJZn5ZovZHgQHDvv0Flx5ZW8/zj9FDujktCrxcwwZfcMhfJGcORjVpRtUA7+06U= nathan@cat.sheepynet'

yum makecache
yum -y install puppet rsync

# For CentOS 5.x
wget http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm && rpm -ivh epel-release-5-4.noarch.rpm
# For CentOS 6.x
# wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && rpm -ivh epel-release-6-8.noarch.rpm

mkdir -p /root/.ssh/
chmod 700 /root/.ssh/
echo $ssh_key > /root/.ssh/authorized_keys
