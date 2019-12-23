POWERLEVEL9K_MODE='nerdfont-complete'

##############################
#          BATTERY           #
##############################

# POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"
# POWERLEVEL9K_BATTERY_LEVEL_FOREGROUND=(red1 orangered1 darkorange orange1 gold1 yellow1 yellow2 greenyellow chartreuse1 chartreuse2 green1)

prompt_zsh_battery_level() {
  local state=`pmset -g ps`
  local percentage1=`echo "${state}" | sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local remaining=`echo "${state}" | grep -oE "\d+:\d+"`
  local color='%F{red}'
  local symbol="\uf00d"
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    charging="false";
  else
    charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 100 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage = 100 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage = 100 ]; then symbol='\uf584'; fi
  fi
  if [ -z "$remaining" ];
  then remaining="...";
  fi
  echo -n "%{$color%} $percentage%% ($remaining) $symbol" ;
}

POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"

##############################
#           PROMPT           #
##############################

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon dir dir_writable vcs root_indicator)

if [[ "$OSTYPE" == *"darwin"* ]]; then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status custom_battery_status time)
else
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status battery time)
fi

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

local user_symbol="$"
if [[ "`whoami`" == "root" ]]; then
  user_symbol="#"
fi

POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{014}%K{none}%} %n@%m%{%f%F{white}%}$user_symbol %{%f%k%}"

##############################
#         DIRECTORY          #
##############################

POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

##############################
#            TIME            #
##############################

POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

##############################
#           STATUS           #
##############################

POWERLEVEL9K_STATUS_CROSS=true

##############################
#           COLOR            #
##############################

# 'none' for transparent background
# from this issue: https://github.com/Powerlevel9k/powerlevel9k/issues/240

POWERLEVEL9K_VIRTUALENV_BACKGROUND='none'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='208'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_FOREGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_DIR_ETC_BACKGROUND='none'
POWERLEVEL9K_DIR_ETC_FOREGROUND='red'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='none'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='196'
POWERLEVEL9K_TIME_BACKGROUND='none'
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='none'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='red'
POWERLEVEL9K_STATUS_OK_BACKGROUND='none'
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_OS_ICON_BACKGROUND='none'
POWERLEVEL9K_OS_ICON_FOREGROUND='white'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='196'
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND='none'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='none'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='none'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='none'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='none'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='none'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='yellow'
