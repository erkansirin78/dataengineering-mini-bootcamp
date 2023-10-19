# What is yum?
yum is package manager for redhat based distributions.  
yum is used to install/update/remove packages  
YUM (Yellowdog Updater Modified) tool developed by RedHat.

# Why use yum?
Because it makes easier to manage packages and its' dependencies.  

# How to use?
- yum install <package_name>
- yum remove <package_name>
- yum update <package_name> `[train@localhost play]$ sudo yum update curl`
- yum list `yum list | less`
- yum list all
- yum list installed
- yum info <package_name>
- yum update will install all latest patches and security updates to your system.

# What is RPM?
RPM is the default package installation tool used in Red Hat Linux. RPM stands for Red Hat Package Manager.  All required files of an application is compiled in a single file format called with a file extension of .rpm.


# Difference between rpm and yum?
RPM and YUM are completely two different things. RPM is the package manager tool which installs the package. YUM is a repository management tool which will fetch the appropriate package for your particular version of Linux(along with all other required packages). Yum is able to perform many of the same tasks that RPM can; additionally, many of the command-line options are similar. Yum enables easy and simple package management on a single machine or on groups of them.

# Coomon package management tasks  

- find a package in repository 

# List repos
```
[train@localhost linux]$ yum repolist
Loaded plugins: fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: kozyatagi.mirror.guzel.net.tr
 * centos-sclo-rh: centos.vargonen.com
 * epel: mirrors.neterra.net
 * extras: mirror.provider.com.tr
 * updates: centos.vargonen.com
repo id                   repo name                                           status
base/7/x86_64             CentOS-7 - Base                                     10,070
centos-sclo-rh/x86_64     CentOS-7 - SCLo rh                                   6,957
docker-ce-stable/x86_64   Docker CE Stable - x86_64                               82
epel/x86_64               Extra Packages for Enterprise Linux 7 - x86_64      13,453
extras/7/x86_64           CentOS-7 - Extras                                      413
gitlab_gitlab-ce/x86_64   gitlab_gitlab-ce                                       646
gitlab_gitlab-ce-source   gitlab_gitlab-ce-source                                  0
jenkins                   Jenkins-stable                                         111
kubernetes                Kubernetes                                             579
pgdg-common/7/x86_64      PostgreSQL common RPMs for RHEL/CentOS 7 - x86_64      347
pgdg10/7/x86_64           PostgreSQL 10 for RHEL/CentOS 7 - x86_64               754
pgdg11/7/x86_64           PostgreSQL 11 for RHEL/CentOS 7 - x86_64               787
pgdg12/7/x86_64           PostgreSQL 12 for RHEL/CentOS 7 - x86_64               370
pgdg95/7/x86_64           PostgreSQL 9.5 for RHEL/CentOS 7 - x86_64              666
pgdg96/7/x86_64           PostgreSQL 9.6 for RHEL/CentOS 7 - x86_64              725
updates/7/x86_64          CentOS-7 - Updates                                   1,134
```

# Diasble a repository
`yum-config-manager --disable repository `   
`[train@localhost linux]$ sudo yum-config-manager --disable gitlab_gitlab-ce`  

