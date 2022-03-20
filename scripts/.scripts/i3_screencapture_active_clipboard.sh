#!/bin/bash

scrot -zu -q 100 - | xclip -selection clipboard -t image/png
