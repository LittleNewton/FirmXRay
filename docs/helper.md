Maybe the following could be helpful.

# 1. Download dependencies

## 1.1 Oracle JDK v11.0.1

Go to the [download page](https://www.oracle.com/uk/java/technologies/javase/jdk11-archive-downloads.html). Other version of JDK may also work but there is no promise.

Select `jdk-11.0.1_linux-x64_bin.tar.gz` to download and then extract it here.

Now you FirmXRay directory should like this:

```
base
dataset
docs            # helpful documents
examples
jdk-11.0.1      # the extracted Oracle JDK folder
lib
logs
out
output
src
Dockerfile
LICENSE
Makefile
README.md
target.txt
```

## 1.2 Ghidra v9.2.2

Click [this](https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_9.2.2_build/ghidra_9.2.2_PUBLIC_20201229.zip) and begin to download from GitHub.

# 2. Build a FirmXRay container image

``` bash
cd ${FIRMXRAY_PATH}
docker build --no-cache -t firmxray:latest .
```

# Run examples

``` bash
# A real-world target
docker run \
    -it \
    --rm \
    --name firmxray \
    -v ./output:/FirmXRay/output \
    firmxray:latest \
    java -cp out:lib/ghidra.jar:lib/json.jar main.Main dataset/nordic/nrf52832_app_s132.bin@053ee91ef5612db4d45c0dc07d75e1ed Nordic

    # java -cp out:lib/ghidra.jar:lib/json.jar main.Main dataset/nordic/nrf52840_xxaa.bin@50c360531fc6d25d6403073a271c0216 Nordic
```

``` bash
# nordic example
docker run \
    -it \
    --rm \
    --name firmxray \
    -v ./output:/FirmXRay/output \
    firmxray:latest \
    java -cp out:lib/ghidra.jar:lib/json.jar main.Main examples/Nordic/example_nordic.bin Nordic
```

``` bash
# oad.bin
docker run \
    -it \
    --rm \
    --name firmxray \
    -v ./output:/FirmXRay/output \
    firmxray:latest \
    java -cp out:lib/ghidra.jar:lib/json.jar main.Main examples/TI/oad.bin TI
```