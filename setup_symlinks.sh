#!/bin/bash

for FILE in $(ls | grep ^dot- | grep -v ~$);
do
echo ln -s $PWD/$FILE $HOME/".$(echo $FILE | cut -c5-)";
done;
