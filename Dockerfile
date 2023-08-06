FROM vagrantlibvirt/vagrant-libvirt:latest

RUN apt update && apt install pip python3 -y
RUN pip install urllib3 pipenv

COPY Pipfile .
RUN pipenv lock && pipenv --clear && pipenv --rm
RUN pipenv install --system --deploy
