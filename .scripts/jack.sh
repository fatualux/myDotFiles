#!/bin/bash

pulseaudio -k
pulseaudio --start
echo "Starting PulseAudio..." && sleep 3

jack_control start			# start jackdbus
echo "Starting JACK..." && sleep 3


jack_control eps realtime true		# enable realtime privilidges for it

jack_control ds alsa			# select driver
jack_control dps device hw:0		# select alsa device

jack_control dps rate 48000		# set sample rate
jack_control dps nperiods 3		# set number of periods
jack_control dps period 512		# set period size

jack_control exit			# stop jackdbus after you exit renoise

killall jackd				# in case renoise starts legacy jackd

sleep 10
a2jmidid -e &
sleep 10
cadence &
