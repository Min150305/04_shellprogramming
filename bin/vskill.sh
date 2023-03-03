#!/bin/bash

PID1=$(ps -ef | grep -w code  \
              | grep -v 'grep --color' \
			  | awk '{print $2}' \
			  | sort -n \
			  | head -1)

[ -n "$PID1" ] && kill $PID1

# echo $PID1

# if [ -n "$PID1" ] ; then
#     kill $PID1
# fi


#[ "$PID1"]  && kill $PID1




# kill $(ps -ef | grep -w code  \
#               | grep -v 'grep --color' \
# 			  | awk '{print $2}' \
# 			  | sort \
# 			  | head -1)