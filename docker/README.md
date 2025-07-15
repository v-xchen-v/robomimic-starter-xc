# 🐳 RoboMimic GPU Docker (Recommended)

## 📦 About This Image

**✅ Recommended:** GPU-Enabled Dockerfile manually fixed and extended from RoboMimic’s [official version](https://github.com/ARISE-Initiative/robomimic).

This image is built for **training and evaluating** RoboMimic policies with **CUDA 11.8 GPU acceleration**, improved compatibility, and a ready-to-use conda environment.

---

## ✅ Key Features

- ✅ Based on `nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04`
- ✅ Miniconda + Python 3.9
- ✅ PyTorch 2.0.0 + torchvision 0.15.0 with GPU support (`cudatoolkit=11.8`)
- ✅ NumPy downgraded to `<2.0` to avoid binary incompatibility
- ✅ RoboMimic + Robosuite installed from source
- ✅ Starts in interactive conda shell
- ✅ Allocates shared memory with `--shm-size=16g` (important for PyTorch and MuJoCo)
- ✅ Includes `start.sh` and `into.sh` for easier container usage

---

## 🧱 Build the Image

```bash
docker build -f Dockerfile.robomimic.gpu -t robomimic .
```

## 🚀 Run the Container (Background)
```bash
./docker/start.sh
```

This script will:
- Start the container in background (-d)
- Use GPU (--gpus all)
- Allocate 16GB shared memory (--shm-size=16g)
- Mount the current directory to /workspace in the container

## 🔁 Attach to the Running Container
```bash
./docker/into.sh
```
This will open an interactive shell inside the running container with the conda environment activated.

## 🧪 Test GPU Availability (Optional)
Once inside the container:
```bash
python -c "import torch; print(torch.cuda.is_available()); print(torch.cuda.get_device_name(0))"
```

## 📂 Folder Structure
```text
.
├── Dockerfile.robomimic.gpu     # GPU-ready Dockerfile
├── docker(scripts)
	├── start.sh                     # Starts the container in background
	├── into.sh                      # Attaches to the running container
├── README.md                    # This file
```

## 💡 Requirements
- NVIDIA GPU with drivers installed
- nvidia-container-toolkit installed:
	```bash
	sudo apt install -y nvidia-container-toolkit
	sudo systemctl restart docker
	```

## 📌 Notes
- You can modify start.sh to mount additional dataset or log directories.
