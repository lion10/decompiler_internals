# run Ghidra headless analysis on the test binaries and log the output


#!/usr/bin/env bash
set -e

build/run/ghidra_12.2_DEV/support/analyzeHeadless \
  /tmp ghidra_proj_gcc \
  -import ./test_switch/gcc_gold_O1_PIE \
  -overwrite \
  -postScript ./scripts/decompile_all.py \
  -analysisTimeoutPerFile 120 2>&1 | tee ./logs/gcc_log.txt


build/run/ghidra_12.2_DEV/support/analyzeHeadless \
  /tmp ghidra_proj_clang \
  -import ./test_switch/clang_gold_O1_PIE \
  -overwrite \
  -postScript ./scripts/decompile_all.py \
  -analysisTimeoutPerFile 120 2>&1 | tee ./logs/clang_log.txt
