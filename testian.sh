#!/bin/bash
#try-catch block to update the system sources lists
{ # your 'try' block
	notify-send 'Aktualisiere Quellen...' --icon=dialog-information
	apt-get update -qq &&
	notify-send 'Quellen aktualisiert.' --icon=dialog-information &&
	apt-get upgrade -y &&
	notify-send 'Aktualisierungen angewandt' --icon=dialog-information &&
	notify-send 'Leere Papierkorb des Systems...' --icon=user-trash &&
	apt-get autoremove -y &&
	notify-send 'Reinige den Arbeitsort des Systems...' --icon=user-desktop &&
	apt-get autoclean -y
} || { # your 'catch' block
	notify-send 'Aktualisierung fehlgeschlagen.' --icon=dialog-error
} # finally: this will always happen
