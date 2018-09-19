#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

for dotfile in $DIR/.*[a-z]; do
  [ -f "$dotfile" ] || continue
  ln -s $dotfile ~
done

