#!/bin/bash

# create and/or show confrooms
# Author: Skammel <git@skammel.de>
ROOMDIR=/etc/asterisk/confrooms
if [ $# -lt 3 ]
then
 echo "usage: $0 <room> <userpin> <adminpin>"
 exit 1
fi

if [ -f "$ROOMDIR/$1.pin" ]
then
  echo "room $1 does already exist"
## read user and admin pin from file
  UPIN=""
  APIn=""
  FIRST=0
  while read LINE
  do
    if [ $FIRST == 0 ]
    then
     UPIN=$LINE
     FIRST=1
     elif [ $FIRST == 1 ]
     then
      APIN=$LINE
      break
    fi


  done < $ROOMDIR/$1.pin
  
  echo "user pin  = $UPIN"
  echo "admin pin = $APIN"
  echo ""
  exit 2
fi


if [ "$2" = "$3" ]
then
 echo "userpin and adminpin MUSt be different"
 exit 3
fi
### create the room
echo "$2" > $ROOMDIR/$1.pin
echo "$3" >> $ROOMDIR/$1.pin
echo "" >> $ROOMDIR/$1.pin
echo "# this file is parsed by an asterisk extension context (telco) " >> $ROOMDIR/$1.pin
echo "# please use mkroom.sh to create additional rooms" >> $ROOMDIR/$1.pin
echo "# first line = userpin" >> $ROOMDIR/$1.pin
echo "# second line = adminpin" >> $ROOMDIR/$1.pin
echo "" >> $ROOMDIR/$1.pin

echo "room $1 created"

