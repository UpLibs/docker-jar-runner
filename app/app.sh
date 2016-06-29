#!/bin/bash 

downloadBlob () {
   storage_account=$STORAGE_ACCOUNT
   container_name=$STORAGE_REPOSITORY
   access_key=$STORAGE_PASSWORD
   path="${ARTIFACT_NAME}-${ARTIFACT_VERSION}.${ARTIFACT_EXTENSION}"
   
   blob_store_url="blob.core.windows.net"
   authorization="SharedKey"

   request_method="GET"
   request_date=$(TZ=GMT date "+%a, %d %h %Y %H:%M:%S %Z")
   storage_service_version="2011-08-18"

   # HTTP Request headers
   x_ms_date_h="x-ms-date:$request_date"
   x_ms_version_h="x-ms-version:$storage_service_version"

   # Build the signature string
   canonicalized_headers="${x_ms_date_h}\n${x_ms_version_h}"
   canonicalized_resource="/${storage_account}/${container_name}"
   string_to_sign="${request_method}\n\n\n\n\n\n\n\n\n\n\n\n${canonicalized_headers}\n${canonicalized_resource}/${path}"

   # Decode the Base64 encoded access key, convert to Hex.
   decoded_hex_key="$(echo -n $access_key | base64 -d | xxd -p -c256)"

   # Create the HMAC signature for the Authorization header
   signature=$(printf "$string_to_sign" | openssl dgst -sha256 -mac HMAC -macopt "hexkey:$decoded_hex_key" -binary |  base64 )
   authorization_header="Authorization: $authorization $storage_account:$signature"

   curl \
     -H "$x_ms_date_h" \
     -H "$x_ms_version_h" \
     -H "$authorization_header" \
     "https://${storage_account}.${blob_store_url}/${container_name}/${path}" \
     -o "app.${ARTIFACT_EXTENSION}" 
}

###############################################################

cd /tmp

IS_ZIP=false

if [ "$ARTIFACT_EXTENSION" = "zip" ]; then
    IS_ZIP=true
fi

if [ "$STORAGE_TYPE" = "azure" ]; then
   downloadBlob
else
   if $IS_ZIP ; then
     wget --user=$STORAGE_ACCOUNT --password=$STORAGE_PASSWORD ${URL}/service/local/artifact/maven/content?r=${REPOSITORY}"&g"=${ARTIFACT_GROUP}"&a"=${ARTIFACT_NAME}"&v"=${ARTIFACT_VERSION}"&e"=${ARTIFACT_EXTENSION} -O app.zip
   else
     wget --user=$STORAGE_ACCOUNT --password=$STORAGE_PASSWORD ${URL}/service/local/artifact/maven/content?r=${REPOSITORY}"&g"=${ARTIFACT_GROUP}"&a"=${ARTIFACT_NAME}"&v"=${ARTIFACT_VERSION} -O app.jar
   fi
fi	

if $IS_ZIP ; then
   unzip app.zip
   cd ${ARTIFACT_NAME}-${ARTIFACT_VERSION}
   cd bin
   ./${ARTIFACT_NAME} ${ARGS}
else
   java ${JAVA_OPTS} -jar app.jar ${ARGS}
fi

exit