#BSPWM
1. En ~/.config/bspwm está el archivo 'bspwmrc' que tiene cargado lo que se corre
cuando arranca el entorno. Podemos poner un script de bash en el archivo para que 
cada vez que iniciamos sesión desde lightdm se corra, lo usé para los scripts de 
mirroring VGA y HDMI pero los terminé sacando pq el dbus quedaba constantemente
rechazando la conexión y me consumía recursos innecesarios.
#SXHKD
1. En ~/.config/sxhkd está el archivo 'sxhkd' que tiene cargados TODOS los bindeos
para manejar el sistema, lo interesante es escribir scripts en bash y bindearlos
para que al presionar un conjunto de teclas se corran, lo mismo se puede hacer con
otras herramientas que esten en el path, lo hice con scrot para los screenshots y
con amixer para subir y bajar el volumen. Tambien agregue el slimlock y los scripts
de mirroring.
#POLYBAR
1. En ~/.config/polybar hay varios archivos que modifique:
-current.ini: 
	Están definidas todas las barras de nuestra configuración, tamaño, posición
	, etc. Cada una la cual llama a un módulo, que están definidos más abajo.
	Las barras se buscan por [bar/nombre] y los módulos igual pero con 'module'
	En cada módulo tenemos un interval que define (en segundos) cada cuanto se
	va a ejecurar el script definido en 'exec'. Acá configure el ip wlan0 que
	se llama hackthebox, el ip eth0 que se llama ethernet y el módulo redwifi_name
	que llama al script redwifi.sh. Todos estos scripts están en ~/.config/bin
-launch.sh:
	Es el script donde se definen que barras de la polybar se inician con el 
	arranque del bspwm. Podemos tener barras nuevas definidas en current.ini
	pero si no figuran en este script no arrancan.
-color_dark.ini,colors.ini,colors_light.ini: En estos se definen los colores pero
					     no los toqué mucho, no se bien como
				             funcionan.
-workspace.ini:configuración del workspace, la barrita del medio. No entiendo bien
	       por qué figura aparte del current.ini
#ROFI
El launcher de aplicaciones tiene un archivito de configuración 'config.rasi' en
~/.config/rofi donde se setea que tema se aplica, este se modifica automaticamente
cuando usamos el rofi-theme-selector, aunque ahora no se que tiene porque le clone
un config.rasi de git con el tema capuchino.
#PICOM
picom es la estetica del enterno bspwm, donde estan configuradas las transparencias
blureados, focus, etc.
El archivo importante es el 'picom.conf' y esta en ~/.config/picom
El focused de las terminales lo arregle con: detect-client-leader = false;


------------


En los scripts de bash se arranca siempre con esta linea (no se pq):
"#!/bin/sh"
#GREP
1. -m: -m tira solo la cantidad de resultados que vos le digas, ej si pones -m1
       te tira solo la primer coincidencia
#FIND   
	-size: tamaño del archivo, los bytes se indican con c, ej.: grep -size 1033c
   	grepeando con ASCII: para saber cuales archivos son human-readables se tira un ls -l grepeando con ASCII
   	-executable: para saber cuales archivos son ejecutables, para non executables usar ! -executable
	-type f: para filtrar solo por archivos, files
#AWK
Sirve mas que todo para grepear por columnas, lo que mas uso es '{print $1}' 
que devuelve la primer columna, lo mismo si queremos mas columnas $1$2$5 etc.
#CONDICIONAL 
arranca con 'if' y termina con 'fi', se puede usar else y las condiciones van entre
corchetes rectos 2 'if[];then'
#VARIABLES
Para definir una variable con la salida de un comando grepeado awkeado lo mejor es
indicar siempre la ruta absoluta del comando, ej.:STATEX=$(/usr/bin/nmcli d | grep -m1 eth0 |awk '{print $3}')
#ECHO
para que el echo funcione 10 puntos hay que meter todo entre comillas dobles

