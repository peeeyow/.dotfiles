#!/bin/bash

scrot -z -q 100 - | xclip -selection clipboard -t image/png
