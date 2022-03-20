#!/bin/bash

scrot -zfs -q 100 - | xclip -selection clipboard -t image/png
