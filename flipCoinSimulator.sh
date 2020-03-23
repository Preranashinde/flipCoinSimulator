#!/bin/bash -x

FlipCoin=$(($(($RANDOM%10))%2))

if [ $FlipCoin -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi
