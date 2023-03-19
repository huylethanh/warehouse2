echoInfo(){
  c_echo "GREEN"  "=====>  $1"
}

echoCommandInfo(){
  c_echo "YELLOW"  "==========>  $1"
}

c_echo(){
    bold=$(tput bold)
    RED="\033[0;31m"
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color
    printf "${!1}${bold}${2} ${NC}\n"
}

echoCommandInfo 'Build running';
flutter pub run build_runner build --delete-conflicting-outputs
