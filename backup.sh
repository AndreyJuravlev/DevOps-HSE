#!/bin/bash

DIRNAME=$1
COMPRESSION_ALGO=$2
FILENAME=$3

if [ -d "$DIRNAME"]
then
	touch $FILENAME
	cp $FILENAME $DIRNAME
	touch error.log
	cp error.log $DIRNAME

	if [$COMPRESSION_ALGO = "none"]
	then
		openssl enc - base64 -in $DIRNAME/$FILENAME -out $FILENAME.base64
		openssl 2>error.log
	else
		tar caf $DIRNAME/$FILENAME.tar.$COMPRESSION_ALGO
		openssl enc -base64 -in $DIRNAME/$FILENAME.tar.$COPRESSION_ALGO -out $FILENAME.base64
		
		tar 2>error.log
		openssl 2>error.log
	fi

else
	mkdir $DIRNAME
	touch $FILENAME
	cp $FILENAME $DIRNAME
	touch error.log
	cp error.log $DIRNAME

	if [$COMPRESSION_ALGO = "none"]
	then
		openssl enc - base64 -in $DIRNAME/$FILENAME -out $FILENAME.base64
		oenssl 2>errol.log
	else
		tar caf $DIRNAME/$FILENAME.tar.$COMPRESSION_ALGO
		openssl enc -base64 -in $DIRNAME/$FILENAME.tar.$COMPRESSION_ALGO -out $FILENAME.base64

		tar 2>error.log
		openssl 2>error.log
	fi
fi

