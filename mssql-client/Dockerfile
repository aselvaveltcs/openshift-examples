# oc new-build --allow-missing-images --strategy=docker --context-dir=mssql-client https://github.com/rbo/openshift-examples.git#mssql
FROM centos:7

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo

RUN yum remove -y mssql-tools unixODBC-utf16-devel
RUN yum install -y mssql-tools unixODBC-devel

CMD [ "/bin/sh", "-c", "while true ; do date; sleep 1; done;" ]
