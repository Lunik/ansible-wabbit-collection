#!/bin/bash

GPIO_PIN={{ base_pi_fan.gpio_pin }}
TEMP_ENABLE_FAN={{ base_pi_fan.enable_temp }}
TEMP_DISABLE_FAN={{ base_pi_fan.disable_temp }}

FAN_STATUS_PATH=/run/fan_status
GPIO_SYSCONFIG_PATH=/sys/class/gpio
_GPIO_PIN_SYSCONFIG_PATH=${GPIO_SYSCONFIG_PATH}/gpio${GPIO_PIN}

function get_gpio_value() {
  cat ${_GPIO_PIN_SYSCONFIG_PATH}/value
}

function set_gpio_value() {
  echo $1 > ${_GPIO_PIN_SYSCONFIG_PATH}/value
}

function gpio_enable() {
  if ! [ -d ${_GPIO_PIN_SYSCONFIG_PATH} ]; then
    echo "Enabling GPIO Pin"
    echo "${GPIO_PIN}" > ${GPIO_SYSCONFIG_PATH}/export
    echo "out" > ${_GPIO_PIN_SYSCONFIG_PATH}/direction
    set_gpio_value 0
  fi
}

function get_temp() {
  vcgencmd measure_temp | sed -e 's/temp=\([0-9]*\).*/\1/g'
}

function enable_fan() {
  if [ $(get_gpio_value) -ne 1 ]; then
    echo "Enable fan"
    set_gpio_value 1
    echo 1 > ${FAN_STATUS_PATH}
  fi
}

function disable_fan() {
  if [ $(get_gpio_value) -ne 0 ]; then
    echo "Disable fan"
    set_gpio_value 0
    echo 0 > ${FAN_STATUS_PATH}
  fi
}

gpio_enable

temp=$(get_temp)
echo "Temperature : ${temp}°C"

if [ ${temp} -ge ${TEMP_ENABLE_FAN} ]; then
  enable_fan
fi

if [ ${temp} -lt ${TEMP_DISABLE_FAN} ]; then
  disable_fan
fi
