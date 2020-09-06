#! /bin/sh

# copy config default

# get SVN revision number and provide as file
revision= sh ./getrevision.sh
if [[ ! -z  $revision ]]
then
	echo "foo: $revision" > revision.txt
fi

# patch
