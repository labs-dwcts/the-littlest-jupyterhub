#!/bin/sh

set -e

doSaveTar() {
  docker save labsdwcts/dwcts-tljh -o dwcts-tljh.tar
  # docker save labsdwcts/dwcts-tljh > dwcts-tljh.tar
}

doConvertImage() {
  # need root
  docker import dwcts-tljh.tar labsdwcts/dwcts-tljh
}
doSave