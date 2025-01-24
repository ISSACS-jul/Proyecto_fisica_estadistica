#!/bin/bash

#------------------------Notas-------------------------
# Opciones principales
# 1.Integrar 2.calibrar 3.Inspeccionar codigo 4.salir
#
# Menu Integrar (Mostrar valores almacenados)
# 1.Introducir valores 2.Usar valores almacenados 3.Atras 4.Menu principal 5.salir
#
# Menu calibrar (Mostrar valores almacenados)
# 1.Regresion 2.N necesarias 3.Atras 4.Menu principal 5.salir 
#
# Menu inspeccionar (Mostrar valores almacenados)
# 1.Metodo en C 2.Regresion en python 3.N necesarias 4.Atras 5.Menu principal 6.Salir 
#------------------------------------------------------

# Colores
RED='\033[31m'
GREEN='\033[32m'
GREEN_BLOND='\033[1;32m'
LYME='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
BLUE_BLOND='\033[1;34m'
MAGENTA='\033[35m'
MAGENTA_BLOND='\033[1;35m'
CYAN='\033[36m'
WHITE='\033[37m'
WHITE_SUB='\033[4;37m'
RESET='\033[0m'

#variables

continuar="Presione Enter para continuar"

actualizar_valores() {
  n_necesaria=$(cat n_necesaria.txt)
  constante=$(cat pendiente.txt)
  a=$(cat limite_inferior.txt)
  b=$(cat limite_superior.txt)
  ecuacion=$(cat ecuacion.txt)
}

reconstruir_C() {
  cp ./back_C/mean_method.c ./
}

#-----------------------------------------------------Menus--------------------------------------------------------------------

menu_principal() {
  echo "";
  echo "";
  echo -e "${YELLOW} ⠀⠀⠀ ⠀⠀⠀⢠⣿⣶⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀${GREEN}⠀⠀⠀ ░█▄█░█▀█░█▀█░▀█▀░█▀▀░█▀▀░█▀█░█▀▄░█░░░█▀█  ${YELLOW}  ⠀⠀ ⠀⠀⠀⠀⠀⢠⣿⣶⣄⣀⡀⠀⠀⠀⠀⠀⠀ ⠀⠀";
  echo -e "  ⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⡀⣠⣾⡇⠀⠀${GREEN}⠀⠀  ░█░█░█░█░█░█░░█░░█▀▀░█░░░█▀█░█▀▄░█░░░█░█  ${YELLOW}  ⠀⠀ ⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⡀⣠⣾⡇⠀⠀⠀⠀";
  echo -e " ⠀ ⠀ ⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀ ${GREEN}⠀⠀  ░▀░▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀  ${YELLOW}  ⠀ ⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀";
  echo -e "⠀⠀ ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⡇⠀⠀⠀${CYAN}⠀░█▄█░█▀▀░█▀█░█▀█░░░░░█▄█░█▀▀░▀█▀░█░█░█▀█░█▀▄ ${YELLOW} ⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⡇⠀⠀⠀⠀";
  echo -e "⠀⣶⣿⣦⣜⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⡿⢿⡏⣴⣺⣦⣙⣿⣷⣄⠀⠀${CYAN}⠀░█░█░█▀▀░█▀█░█░█░▄▄▄░█░█░█▀▀░░█░░█▀█░█░█░█░█ ${YELLOW} ⠀⣶⣿⣦⣜⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⡿⢿⡏⣴⣺⣦⣙⣿⣷⣄⠀⠀⠀";
  echo -e "⠀⣯⡇⣻⣿⣿⣿⣿⣷⣾⣿⣬⣥⣭⣽⣿⣿⣧⣼⡇⣯⣇⣹⣿⣿⣿⣿⣧⠀${CYAN}⠀░▀░▀░▀▀▀░▀░▀░▀░▀░░░░░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀░ ${YELLOW} ⠀⣯⡇⣻⣿⣿⣿⣿⣷⣾⣿⣬⣥⣭⣽⣿⣿⣧⣼⡇⣯⣇⣹⣿⣿⣿⣿⣧⠀⠀${RESET}";
  echo " ";
  echo -e "${BLUE_BLOND}                               Escriba el valor de la opcion que desea${RESET}";
  echo -e "${GREEN}                     1.Integrar     2.calibrar     3.Inspeccionar codigo${RED}     4.Salir${RESET}"
}

menu_integrar() {
  echo -e "    ${YELLOW}   ⠀⠀⠀⠀⣀⡀                                       ⠀⠀⠀⠀⣀⡀     ";
  echo -e "       ⢠⣤⡀⣾⣿⣿⠀⣤⣤⡄                                   ⢠⣤⡀⣾⣿⣿⠀⣤⣤⡄ ";
  echo -e "       ⢿⣿⡇⠘⠛⠁⢸⣿⣿⠃  ${CYAN}░▀█▀░█▀█░▀█▀░█▀▀░█▀▀░█▀▄░█▀█░█▀▄${YELLOW} ⢿⣿⡇⠘⠛⠁⢸⣿⣿⠃ ";
  echo -e "       ⠈⣉⣤⣾⣿⣿⡆⠉⣴⣶⣶ ${CYAN}░░█░░█░█░░█░░█▀▀░█░█░█▀▄░█▀█░█▀▄${YELLOW} ⠈⣉⣤⣾⣿⣿⡆⠉⣴⣶⣶";
  echo -e "       ⣾⣿⣿⣿⣿⣿⣿⡀⠻⠟⠃ ${CYAN}░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀░▀${YELLOW} ⣾⣿⣿⣿⣿⣿⣿⡀⠻⠟⠃";
  echo -e "       ⠙⠛⠻⢿⣿⣿⣿⡇                                     ⠙⠛⠻⢿⣿⣿⣿⡇   ";
  echo -e "       ⠀⠀⠀⠀⠈⠙⠋⠁                                     ⠀⠀⠀⠀⠈⠙⠋⠁   ${RESET}";
  echo -e "";
  echo -e "    ${BLUE_BLOND}            Escriba el valor de la opcion que desea${RESET}";
  echo -e "    ${GREEN}       1.Introducir valores   3.Atras          ${RED} 5.Salir";
  echo -e "    ${GREEN}       2.valores almacenados  4.Menu principal${RESET}";
  echo -e " ${MAGENTA_BLOND}
            --------------------------------------------
                    Ecuacion almacenda:$ecuacion 
                    limites almacenados:[$a,$b] 
                    N almacenada:$n_necesaria
            -------------------------------------------- ${RESET}"
}

menu_calibrar_alt() {
  echo -e "  
${YELLOW}⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿                                  ⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿
⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿                                  ⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿
⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿${CYAN} ░█▀▀░█▀█░█░░░▀█▀░█▀▄░█▀▄░█▀█░█▀▄ ${YELLOW}⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿
⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋${CYAN} ░█░░░█▀█░█░░░░█░░█▀▄░█▀▄░█▀█░█▀▄ ${YELLOW}⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋
⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀${CYAN} ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀░▀░▀░▀ ${YELLOW}⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀
⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿                                  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿
⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟    ${GREEN}1.Regresion  2.N necesarias ${YELLOW}  ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟
⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃    ${GREEN}3.Atras     ${RED} 4.Salir  $YELLOW        ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃
⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃                                  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃
⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄                                  ⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄
⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄                                  ⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄${RESET}";
}

menu_calibrar() {
  echo -e "
${BLUE}⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝                                     ⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝
⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇                                    ⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇
⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀                                    ⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀
⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁    ${YELLOW} ░█▀▀░█▀█░█░░░▀█▀░█▀▄░█▀▄░█▀█░█▀▄ ${BLUE} ⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁
⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉     ${YELLOW} ░█░░░█▀█░█░░░░█░░█▀▄░█▀▄░█▀█░█▀▄ ${BLUE} ⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉
⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂     ${YELLOW} ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀░░▀░▀░▀░▀░▀░▀ ${BLUE} ⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂
⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂                                          ⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂
⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁                                            ⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁
⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏             ${GREEN} 1.Regresion    2.N necesarias ${BLUE}  ⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏
⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀             ${GREEN} 3.Mod n        4.Mod ecuacion ${BLUE} ⠀ ⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀
⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟               ${GREEN} 5.Mod limites  6.Atras        ${BLUE} ⠀ ⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟
⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟                          ${RED}7.Salir             ${BLUE}   ⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟
⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋                                                  ⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋${RESET}";
  echo -e " ${MAGENTA_BLOND}
                           --------------------------------------------
                                  Ecuacion almacenda:$ecuacion 
                                  limites almacenados:[$a,$b] 
                                  N almacenada:$n_necesaria
                           -------------------------------------------- ${RESET}"
}

menu_inspeccionar() {
  echo -e "
${LYME}⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀ ⣀⣀⣤⣤⣤⣀⡀                                                                 ⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀ ⣀⣀⣤⣤⣤⣀⡀
⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀                                                              ⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀
⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆                                                             ⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆
⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆          ${BLUE}░▀█▀░█▀█░█▀▀░█▀█░█▀▀░█▀▀░█▀▀░▀█▀░█▀█░█▀█░█▀█░█▀▄${LYME}  ⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆
⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆   ${BLUE}░░█░░█░█░▀▀█░█▀▀░█▀▀░█░░░█░░░░█░░█░█░█░█░█▀█░█▀▄${LYME}  ⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆
⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠸⣼⡿    ${BLUE}░▀▀▀░▀░▀░▀▀▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀░▀${LYME}  ⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠸⣼⡿
⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉                                                          ⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉
⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                                           ⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇               ${GREEN}1.Metodo en C    2.Regresion en pyhton${LYME}      ⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇
⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇               ${GREEN}3.N necesarias   4.Atras${LYME}                    ⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇
⠀⠀ ⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠇                                                           ⠀⠀ ⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠇
⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇                            ${RED}5.Salir${LYME}                         ⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃                                                             ⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃${RESET}";
  echo -e " ${MAGENTA_BLOND}
                                --------------------------------------------
                                       Ecuacion almacenda:$ecuacion 
                                       limites almacenados:[$a,$b] 
                                       N almacenada:$n_necesaria
                                -------------------------------------------- ${RESET}"
}

error() {
  echo -e "Opcion no valida, usted tecleo: $opcion"
  echo -e "$continuar"
}

modificar_n() {
  echo "$valor" > ./n_necesaria.txt
}

modificar_ecuacion() {
  echo "$valor" > ./ecuacion.txt
}

modificar_limites() {
  echo "$valor" > ./limite_inferior.txt
  echo "$valor1" > ./limite_superior.txt
}
#------------------------------------------------------------------------------------------------------------------------------

while true; do
  actualizar_valores
  reconstruir_C
  clear
  menu_principal
  read -p "Seleccione una opcion: " opcion

  case "$opcion" in
    1) 
      while true; do
        actualizar_valores
        clear
        menu_integrar
        read -p "seleccione una opcion: " opcion

        case "$opcion" in
          1) 
            python ./mean_method.py
            echo -e "$continuar"
            read 
          ;;
          2) 
            python ./mean_method_almacen.py
            echo -e "$continuar"
            read 
          ;;
          3 | 4)
            break 
          ;;
          5)
            exit
          ;;
          *) 
            error
            read
          ;;
        esac
      done
    ;;
    2)
      while true; do 
        actualizar_valores
        clear
        menu_calibrar
        read -p "Seleccione una opcion: " opcion
        case "$opcion" in
          1) 
            echo -e "${RED}-------------------------------------------------------------!!! WARNING !!!-----------------------------------------------------------------${RESET}"
            echo -e "La cantidad y velocidad con la que se efectue la regresion depende de su computadora, procure escoger una cantidad de datos que pueda manejar"
            echo -e "${RED}-------------------------------------------------------------!!! WARNING !!!-----------------------------------------------------------------${RESET}"
            echo -e "${continuar}"
            read
            python ./coeficiente_error.py
            echo -e "$continuar"
            read
          ;;
          2)
            python ./n_necesaria.py
            echo -e "$continuar"
            read 
          ;;
          3)
            read -p "Escriba el valor por el cual quiere modificar n: " valor
            modificar_n
            echo -e "El valor de n se nodifico con exito"
            echo -e "$continuar"
            read 
          ;;
          4)
            read -p "Escriba la nueva ecuacion, tenga en cuenta el formato (-5*x*x+8*x): " valor
            modificar_ecuacion
            echo -e "La ecuacion fue modificada"
            echo -e "$continuar"
            read
          ;;
          5)
            read -p "Escriba el valor por el cual quiere modificar el limite inferior: " valor
            read -p "Escriba el valor por el cual quiere modificar el limite superior: " valor1
            modificar_limites
            echo -e "Los limites han sido modificados"
            echo -e "$continuar"
            read 
          ;;
          6)
            break 
          ;;
          7)
            exit
          ;;
          *)
            error
            read 
          ;;
        esac
      done
    ;;
    3)
      while true; do
        actualizar_valores
        clear
        menu_inspeccionar
        read -p "Seleccione una opcion: " opcion
        case "$opcion" in
          1) 
            nvim ./mean_method.c
          ;;
          2)
            nvim ./coeficiente_error.py
          ;;
          3)
            nvim ./n_necesaria.py
          ;;
          4)
            break 
          ;;
          5)
            exit
          ;;
          *) 
            error
            read
          ;;
        esac
      done
    ;;
    4)
      exit
    ;;
    *)
      clear
      error
      read
    ;;
  esac
done
clear

