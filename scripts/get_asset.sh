#!/bin/bash
TOKEN=`cat $1`
REPO=$2
FILE=$3
VERSION=$4
GITHUB="https://api.github.com"

function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
       -H "Accept: application/vnd.github.v3.raw" \
       $@
}

if [ "$FILE" = "src" ]; then
    echo "Downloading repo source $REPO"
    curl -H "Authorization: token $TOKEN" \
      -L https://api.github.com/repos/$REPO/zipball/$VERSION > $5
    exit
else
    echo "Downloading specific asset $FILE"
    parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi

#asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases`
#echo "$asset_id"

asset_id=`gh_curl -s $GITHUB/repos/$REPO/releases | jq "$parser"`
if [ "$asset_id" = "null" ]; then
  >&2 echo "ERROR: version not found $VERSION"
  exit 1
fi;

wget --auth-no-challenge --header='Accept:application/octet-stream' \
  https://$TOKEN:@api.github.com/repos/$REPO/releases/assets/$asset_id \
  -O $5
