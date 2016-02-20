#!/bin/bash
#try-catch block to update the system sources lists
{ # your 'try' block
	# update the system sources & send notification
	notify-send 'Aktualisiere Quellen...' --icon=dialog-information
	apt-get update -qq && 
	notify-send 'Quellen aktualisiert.' --icon=dialog-information &&
	# upgrade packages whithout confirmation & send notification
	apt-get upgrade -y &&
	notify-send 'Aktualisierungen angewandt' --icon=dialog-information &&
	# autoremove & send notification
	apt-get autoremove -y &&
	notify-send 'Leere Papierkorb des Systems...' --icon=user-trash &&
	# autoclean & send notification
	apt-get autoclean -y
	notify-send 'Reinige den Arbeitsort des Systems...' --icon=user-desktop &&
} || { # your 'catch' block
	#s send error notification
	notify-send 'Aktualisierung fehlgeschlagen.' --icon=dialog-error
} # finally: this will always happen
