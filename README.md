# confrooms
Asterisk - multiple static confrooms via confbridge

Author: Skammel <git@skammel.de>

include the telcomulti.conf at the end of your extensions.conf e. g.
#include "telcomulti.conf"

to use the new context just jump to it from your extension via:
Goto(telco,100,1)

check your confbridge.conf for admin and user section like this:
----
[admin_user]
type=user
admin=yes     ; Sets if the user is an admin or not. Off by default.
announce_user_count=yes  ; Sets if the number of users should be announced to th

[default_user]
type=user
----

don't set a pin for admin nor default/user
this is done by the room files

create the room diredtory:
mkdir -p /etc/asterisk/confrooms

copy mkrooms.sh to the confrooms dir

create a test room
room 8888,  userpin 1234, adminpin 4567

./mkroom.sh 8888 1234 4567


to delete a room just delete the room file:
rm 8888.pin

if you think - everything is well configured

restart asterisk and have fun!

