#!/bin/bash

eval "sed -i 's/external_sip_ip=stun:stun.freeswitch.org/external_sip_ip=${FREESWITCH_IP}/' /etc/freeswitch/vars.xml"
eval "sed -i 's/external_rtp_ip=stun:stun.freeswitch.org/external_rtp_ip=${FREESWITCH_IP}/' /etc/freeswitch/vars.xml"
