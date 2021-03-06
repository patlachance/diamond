#!/bin/bash
# (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#
# == 0 when running
# != 0 not runnning
#
# Calling the script from maestro using salt:
# salt 'review.*' --out=json cmd.retcode 'sudo -i /usr/lib/forj/toolstatus.sh gitlab'

RETVAL=1

gitlab() {
  sudo -i service gitlab status > /dev/null 2>&1
  RETVAL=$?
  echo $RETVAL
}

openfire() {
  sudo -i service openfire status > /dev/null 2>&1
  RETVAL=$?
  echo $RETVAL
}

hubot() {
  sudo -i service hubot status > /dev/null 2>&1
  RETVAL=$?
  echo $RETVAL
}

jenkins() {
  sudo -i service jenkins status > /dev/null 2>&1
  RETVAL=$?
  echo $RETVAL
}

case "$1" in
  gitlab)
    gitlab
    ;;
  openfire)
    openfire
    ;;
  hubot)
    hubot
    ;;
  jenkins)
    jenkins
    ;;
  *)
    echo "Usage: {gitlab|openfire|hubot|jenkins}"
    ;;
esac

