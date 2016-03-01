lang en_US
keyboard us
timezone Asia/Kolkata --isUtc
rootpw $1$LB5P97t/$P74eSvdu8fvStJqBdcCVP/ --iscrypted
# add a vagrant user
user --name=vagrant --password=$6$rounds=656000$hxDxI65Ush3Qvtae$1lhHqv9iyzy1CzL8QmvGSZQBL8NYRR5UeOYt61blD3SlQ.EHQkkKtXjgs6Z1Cam4x0u.5nst8X8nrKHpeNW2Q/ --iscrypted --uid=1001 --gid=1001
#platform x86, AMD64, or Intel EM64T
reboot
network --bootproto=dhcp --ipv6=auto --activate --onboot yes --hostname=centos7
text
cdrom
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
zerombr
clearpart --all --initlabel
autopart
auth --passalgo=sha512 --useshadow
selinux --enforcing
firewall --enabled --ssh
skipx
firstboot --disable

%packages --nobase
@core
lsof
bash-completion
bind-utils
bzip2
deltarpm 
fuse
fuse-libs
gcc
git
kernel-devel 
kernel-headers
make
autoconf
nmap-ncat 
perl
python-devel
python-setuptools
python-setuptools-devel
net-tools
psacct
pykickstart
python-virtualenv
rsync
strace
tcpdump
telnet
traceroute
unzip 
vim-enhanced
yum-utils
wget 
zip
-*-firmware
-wireless-tools
%end

%post --log=/root/ks-post.log
user=vagrant
# Vagrant specific
date > /etc/vagrant_box_build_time
# Installing vagrant keys
mkdir -pm 700 /home/${user}/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/${user}/.ssh/authorized_keys
chmod 0600 /home/${user}/.ssh/authorized_keys
chown -R ${user} /home/${user}/.ssh

# Add ${user} user to sudo
cat > /etc/sudoers.d/${user} <<EOF
${user} ALL=(ALL) NOPASSWD: ALL
Defaults:${user} !requiretty
EOF
cat >>/etc/ssh/sshd_config <<'EOF'
# Added for vagrant boxes to be resolved without dns
UseDNS no
EOF
%end
