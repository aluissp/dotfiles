# Extra Configuration

This this a simple guide to configure tools that is useful to work.

## Table of contents

- [Extra Configuration](#extra-configuration)
  - [Table of contents](#table-of-contents)
    - [Tensorflow \& Torch](#tensorflow--torch)
    - [Docker](#docker)
    - [Backup \& Restore](#backup--restore)

### Tensorflow & Torch

You must have install miniconda before:

```bash
yay -S miniconda3 # Arch Linux
```

If you have supported GPU, you can install the following packages:

```bash
sudo pacman -S cuda cudnn # Arch Linux
```

Add symbolic links to the conda.sh and source the conda.fish:

```bash
sudo ln -s /opt/miniconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh

!conda info --root # /opt/miniconda3
!source /opt/miniconda3/etc/fish/conf.d/conda.fish
```

Create a new environment and install the packages:

```bash
conda create -n ia python
conda activate ia
pip install tensorflow[and-cuda]
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install matplotlib imageio opencv-python seaborn scikit-learn
```

### Docker

To install docker, use the following command:

```bash
sudo pacman -S docker docker-buildx docker-compose # Arch Linux
```

Use the following command to start the docker service:

```bash
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
```

If you get a error like `permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.44/containers/json?all=1": dial unix /var/run/docker.sock: connect: permission denied`, you can see this [post here](https://newbedev.com/shell-error-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket-at-unix-var-run-docker-sock-get-http-2fvar-2frun-2fdocker-sock-v1-24-info-dial-unix-var-run-docker-sock-connect-permission-denied-code-example).

```bash
# Example 1: Got permission denied while trying to connect to the Docker daemon socket
sudo chmod 666 /var/run/docker.sock

# Example 2: Server: ERROR: Got permission denied while trying to connect to the Docker daemon socket
sudo newgroup docker
sudo chmod 666 /var/run/docker.sock
sudo usermod -aG docker ${USER}
```

### Backup & Restore

Use these commands to backup and restore the linux system:

```bash
# Backup
pacman -Qqen > .pkgs
pacman -Qqem > .aur-pkgs

# Restore
sudo pacman -S --needed - < .pkgs
for x in $(< .aur-pkgs); do yay -S $x; done
```
