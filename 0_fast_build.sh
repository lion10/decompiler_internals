# After instrumention/modifcation of the decompiler, this script can be used 
# to quickly build and copy the modified decompiler to the Ghidra run directory. 
# This is much faster than doing a full build and install of Ghidra.


#!/usr/bin/env bash
set -e

./gradlew Decompiler:decompileLinux_x86_64Executable --no-daemon

if [ ! -d build/run ]; then
  mkdir -p build/run
  unzip -q build/dist/*.zip -d build/run
fi

SRC="$(find Ghidra/Features/Decompiler/build -type f -name decompile | head -n 1)"
DST="$(find build/run -type f -name decompile | head -n 1)"

echo "[+] SRC: $SRC"
echo "[+] DST: $DST"

cp "$SRC" "$DST"
echo "[+] Copied updated decompiler"
