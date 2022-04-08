#!/bin/sh
#

gerrit_user="$1"

[ -z "$gerrit_user" ] && echo "usage ${0} \$gerrit_user" && exit 1

cat .remotes.xml.template | sed "s/<user>/${gerrit_user}/g" > remotes.xml
