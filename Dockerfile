FROM centos

RUN dnf install python3 python3-requests -y

RUN curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python3 - -b master current-tripleo

RUN dnf install python3-aodhclient \
		python3-barbicanclient \
		python3-cinderclient \
		python3-designateclient \
		python3-glanceclient \
		python3-gnocchiclient \
		python3-heatclient \
		python3-ironicclient \
		python3-keystoneclient \
		python3-manilaclient \
		python3-neutronclient \
		python3-novaclient \
		python3-octaviaclient \
		python3-saharaclient \
		python3-swiftclient \
		nano iputils -y


RUN dnf update -y

RUN useradd -ms /bin/bash openstack
USER openstack

RUN mkdir -p /home/openstack/.config/openstack

COPY --chown=openstack:openstack clouds.yaml /home/openstack/.config/openstack/clouds.yaml

CMD ["sh", "-c", "tail -f /dev/null"]
