# Getting Started with `tensorflow-metal` PluggableDevice

Accelerate training of machine learning models with TensorFlow right on your Mac.
Install TensorFlow and the `tensorflow-metal` PluggableDevice to accelerate training
with Metal on Mac GPUs.

[Learn more about TensorFlow PluggableDevices][tf-pluggable-devices]

[tf-pluggable-devices]: https://blog.tensorflow.org/2021/06/pluggabledevice-device-plugins-for-TensorFlow.html

## OS Requirements

- MacOS 12.0+ ([latest beta])

[latest beta]: https://beta.apple.com/sp/betaprogram/

## Currently Not Supported

- Multi-GPU support
- Acceleration for Intel GPUs
- V1 TensorFlow Networks

## Installation Instructions

### Step 1: Environment setup

#### x86: AMD

Create virtual environement (recommended):

```sh
python3 -m venv ~/tensorflow-metal
source ~/tensorflow-metal/bin/activate
python -m pip install -U pip
```

NOTE: Python version 3.8 required

#### arm64: Apple Silicon

Download and install [Conda env]:

```sh
chmod +x ~/Downloads/Miniforge3-MacOSX-arm64.sh
sh ~/Downloads/Miniforge3-MacOSX-arm64.sh
source ~/miniforge3/bin/activate
```

[Conda env]: https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh

Install the TensorFlow dependencies:

```sh
conda install -c apple tensorflow-deps
```

- When upgrading to new base TensorFlow version; we recommend:

```sh
# Uninstall existing tensorflow-macos and tensorflow-metal
python -m pip uninstall tensorflow-macos
python -m pip uninstall tensorflow-metal

# Upgrade tensorflow-deps...
conda install -c apple tensorflow-deps --force-reinstall

# ...or point to specific conda enviornment
conda install -c apple tensorflow-deps --force-reinstall -n my_env
```

- `tensorflow-deps` versions are following base TensorFlow versions so:

For v2.5

```sh
conda install -c apple tensorflow-deps==2.5.0
```

For 2.6:

```sh
conda install -c apple tensorflow-deps==2.6.0
```

NOTE: Python versions 3.8 and 3.9 supported

### Step 2: Install base TensorFlow

```sh
python -m pip install tensorflow-macos
```

NOTE: If using conda environment built against pre-macOS 11 SDK use:
``SYSTEM_VERSION_COMPAT=0 python -m pip install tensorflow-macos``
otherwise you will get errors like: "not supported wheel on this platform"

### Step 3: Install `tensorflow-metal` plugin

```sh
python -m pip install tensorflow-metal
```

