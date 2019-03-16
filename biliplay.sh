#!/bin/bash

SIZE="1366x768"

echo "Play $@..."

TMP_1=`mktemp -d`
TMP_2=`mktemp -d`

you-get --only -o $TMP_1 $@

CAPTION=`ls $TMP_1`

echo "Caption $CAPTION found..."

danmaku2ass -s $SIZE -o $TMP_2/tmp.ass "$TMP_1/$CAPTION"

rm -rf $TMP_1

mpv --sub-file="$TMP_2/tmp.ass" $@

sleep 5

rm -rf $TMP_2

