# Ghidra Decompiler Internals

This repository is an experimental fork of Ghidra focused on studying and modifying decompiler internals, with an emphasis on control-flow graph (CFG) reconstruction.

## Key Areas of Work

- `jumptable.cc` — jump table recovery logic  
- `flow.cc` — control-flow analysis and indirect jumps  
- to continue! 

---

## Build (Initial Setup)

```bash
cd decompiler-internals

# fetch dependencies (first time only)
./gradlew -I gradle/support/fetchDependencies.gradle

# prepare environment
./gradlew prepdev

# full build
./gradlew buildGhidra
```

## Run

```bash
unzip build/dist/*.zip -d build/run
build/run/*/ghidraRun -fg
```

## Fast Development Loop (Decompiler Only)

After modifying decompiler code:

```bash
./fast_build.sh
```

This will:

- rebuild the native decompiler  
- replace the binary inside the runnable Ghidra instance  

## Headless Testing

Example:

```bash
./1_test_binaries.sh
```

This runs headless analysis and forces decompilation on test binaries.

## Code Modification Conventions

Custom modifications are marked with:

```cpp
// Omar: Inserted
// Omar: Modified
// Omar: Removed
// Omar: Updated
```

## Notes

- Debug logs are printed using `std::cerr` for tracing decompiler behavior  
- Generated binaries and logs are excluded via `.gitignore`  
- This repository focuses on experimentation and internal analysis  

## Repository Structure (Relevant Parts)

- `Ghidra/Features/Decompiler/` — core decompiler source  
- `0_fast_build.sh` — rebuild decompiler quickly  
- `1_test_binaries.sh` — headless test runner  

## Disclaimer

This is an experimental research fork intended for understanding decompiler internals.  
It is not an official distribution.
