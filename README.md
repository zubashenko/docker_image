# docker_image
This git-repository contains the Dockerfile with tasks for installing following programms:  
[Samtools][1]  v1.12 17.03.2021  
[Biobambam2][2] v2.0.087 01.03.2018  

## Requirments  
Docker - [https://docs.docker.com/engine/install/ubuntu/]  

## Install and use  
Download latest release - [https://github.com/Zubashenko/docker_image/releases]  
Unzip and go to the directory with Dockerfile and use the following command:  
`docker build -t docker_image:v1 [Path/to/dir/with/Docekrfile]`  

### To use docker image in interactive mode use:  
`docker run -it create_docker_image:v1`  

[1]: https://github.com/samtools/samtools  
[2]: https://github.com/gt1/biobambam2  
