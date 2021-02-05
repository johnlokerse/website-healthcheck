website_url=$1
scan_text=$2
status_code=$(curl --silent --head $website_url | head -1 | awk '{print $2}')

echo $status_code

if [ "$status_code" != "200" ]
then
    echo "Website is unreachable"
    exit 1
fi

if curl --silent $website_url | grep -i "$2"
then
    echo "hello"
fi