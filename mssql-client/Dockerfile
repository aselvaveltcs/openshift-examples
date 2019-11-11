FROM registry.redhat.io/rhel7

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo

RUN yum remove mssql-tools unixODBC-utf16-devel
RUN yum install mssql-tools unixODBC-devel

CMD [ "/bin/sh", "-c", "while true ; do date; sleep 1; done;" ]