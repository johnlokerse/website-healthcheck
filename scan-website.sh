website_url=$1
scan_text=$2
status_code=$(curl --silent --head $website_url | head -1 | awk '{print $2}')

if [ "$status_code" != "200" ]
then
    echo "Website is unreachable"
    exit 1
fi

if [ -z $(curl --silent $website_url | grep -i "$2") ]
then
    echo "Input text was not found on website."
    exit 1
fi