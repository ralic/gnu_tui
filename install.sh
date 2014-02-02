#!/bin/sh
# 2014.01.28 by sea
#
#	Variables
#
	app=tui
	[[ ! -f install.sh ]] && cd $(dirname $0)
	[[ -d /usr/bin ]] && \
		DIR_BIN=/usr/bin || \
		DIR_BIN=/bin
	DIR_APP=/usr/share/$app
	DIR_CFG=/etc/$app
	DIR_DOC=/usr/share/doc/$app
	DIR_MAN1=/usr/share/man/man1
#
#	Initall to Environment
#
	read -p "Press enter to install $app OR press 'CTRL+c' to abort"
	mkdir -p $DIR_APP $DIR_CFG $DIR_MAN1 #$DIR_MAN8
	mv README.md $DIR_APP
	mv bin/* $DIR_BIN/
	mv conf/* $DIR_CFG/
	mv docs/[A-Z]* $DIR_DOC
	mv docs/* $DIR_APP
	mv man/*1 $DIR_MAN1
	
	source tui
	MSG="Exiting & removing tempfiles"
	tui-echo "$MSG" "$WAIT"
	cd .. && rm -fr $(dirname $0)
	tui-status $? "$MSG"