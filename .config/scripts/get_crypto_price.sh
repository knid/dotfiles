#!/bin/bash

FILE_PATH=$2

API="api.coincap.io/v2/assets/"
JSON_PATH=".data.priceUsd"

CRYPTO=$1

price=$(/usr/bin/curl -Ls $API/$CRYPTO | jq -r $(echo $JSON_PATH))
price_formatted=$(printf "%.2f" $price)

echo $price_formatted > $FILE_PATH

echo $price_formatted
echo "Saved to $FILE_PATH"


