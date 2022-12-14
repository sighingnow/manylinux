# Build image for multiple platforms and push to registry in the same time

export POLICY=manylinux2014
# export PLATFORM=aarch64
export BASEIMAGE=centos:7
export DEVTOOLSET_ROOTPATH=/opt/rh/devtoolset-10/root
export PREPEND_PATH=/opt/rh/devtoolset-10/root/usr/bin:
export LD_LIBRARY_PATH_ARG=/opt/rh/devtoolset-10/root/usr/lib64:/opt/rh/devtoolset-10/root/usr/lib:/opt/rh/devtoolset-10/root/usr/lib64/dyninst:/opt/rh/devtoolset-10/root/usr/lib/dyninst:/usr/local/lib64

docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg POLICY --build-arg BASEIMAGE --build-arg DEVTOOLSET_ROOTPATH --build-arg PREPEND_PATH --build-arg LD_LIBRARY_PATH_ARG -t registry.cn-hongkong.aliyuncs.com/graphscope/manylinux2014:2022-12-12 -f docker/Dockerfile docker/
