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
sudo pacman -S docker docker-buildx # Arch Linux
```

Use the following command to start the docker service:

```bash
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
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
