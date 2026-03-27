# Ghidra Decompiler Internals

This repository is an experimental fork of Ghidra focused on studying and modifying decompiler internals, with an emphasis on control-flow graph (CFG) reconstruction.



## Build Instructions (for modified version)

```bash
cd decompiler-internals

# fetch dependencies (first time only)
./gradlew -I gradle/support/fetchDependencies.gradle

# Run 
unzip build/dist/*.zip -d build/run
build/run/*/ghidraRun
```





