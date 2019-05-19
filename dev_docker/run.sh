cur_path=$(cd $(dirname $0) && pwd)
mnt_path=${cur_path}
mnt_target='/root'

#xhost +
xhost local:

time nvidia-docker run \
	--env http_proxy=$http_proxy \
	--env https_proxy=$https_proxy \
	-p 80:80 \
	-p 8888:8888 \
	-v ${mnt_path}/../..:${mnt_target} \
	-w /root \
	-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
	-it --rm test/test-0

#xhost -
xhost -local:

## if you want tu use jupyter notebook
## Run the below command in Container
# jupyter notebook --port 8888 --ip=0.0.0.0 --allow-root
