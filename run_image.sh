image_hash=$1
name=$2
mount_point=$3
port=$4

if test -z "$image_hash" || \
	test -z "$name"  || \
	test -z "$mount_point" || \
	test -z "$port"   ; then
	echo "
Usage: $0 <image hash> <container name> <mount_point> <port>
"
	exit 1
fi


mkdir -p $mount_point

docker run \
	-v $mount_point:/var/www/html \
	--name $name \
	-p $port:80/tcp \
	-d $1
