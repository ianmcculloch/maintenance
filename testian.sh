#!/bin/bash
# script to upgrade all packages to the most recent version and empty the trash bin
#try-catch block to update the system sources lists
{ # your 'try' block
	notify-send 'Aktualisiere Quellen...' --icon=dialog-information
	apt-get update -qq &&
	notify-send 'Quellen aktualisiert.' --icon=dialog-information &&
	apt-get upgrade -y &&
	notify-send 'Aktualisierungen angewandt' --icon=dialog-information &&
	notify-send 'Leere alte Dateien des Systems...' --icon=user-trash &&
	apt-get autoremove -y &&
	notify-send 'Reinige den Arbeitsort des Systems...' --icon=user-desktop &&
	apt-get autoclean -y
} || { # your 'catch' block
	notify-send 'Aktualisierung fehlgeschlagen.' --icon=dialog-error
} # finally: this will always happen

{ # try to empty trash
	notify-send 'Leere Papierkorb...' --icon=user-trash &&
	trash-empty
	notify-send 'Papierkorb geleert.' --icon=user-trash
} || { # catch any errors
	notify-send 'Leerung fehlgeschlagen!' --icon=dialog-error
}
