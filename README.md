# Open-Source-IC-Design-Tools
This is a compilation of my notes on open-source IC design using SKY130 PDK, XSCHEM, NGSPICE, and MAGIC. The goal is to document schematic capture, circuit simulation, and full-custom layout design using open-source tools.

## 📌 Table of Contents
- [Installation of Virtualization Software](#installation-of-virtualization-software)
- [Installation of Ubuntu](#installation-of-ubuntu)
- [Pre-Requisites](#pre-requisites)
- [Installation of NGSPICE](#installation-of-ngspice)
- [Installation of MAGIC](#installation-of-magic)
- [Installation of SKY130](#installation-of-sky130)
- [Installation of XSCHEM](#installation-of-xschem)
- [Inquiries](#inquiries)

## 🚀 Installation of Virtualization Software
![image](https://github.com/user-attachments/assets/a453764e-c835-4ed0-bc5f-ab2756647b6e)

For Windows users, [**VirtualBox**](https://www.virtualbox.org) is a popular open-source virtualization software that allows you to create and manage virtual machines. On Linux, **[QEMU](https://www.qemu.org)/[KVM](https://linux-kvm.org/page/Main_Page)** is the preferred open-source solution, providing efficient virtualization with hardware acceleration. 

To get started, download and install the appropriate software for your operating system. 

Once installed, you can create virtual machines, allocate system resources, and install your desired operating system within the virtual environment.

## 💻 Installation of Ubuntu 
To set up your "virtual machine (VM)", allocate atleast "2 CPU cores", "8GB of RAM", and "70GB of disk storage". Ensure that networking is enabled so you can download and install software from the web.

On your host computer, download the latest Ubuntu ISO image from the official [Ubuntu website](https://ubuntu.com/download). For this tutorial, we are using Ubuntu 24.04.1.

Next, boot up your newly created VM using the Ubuntu ISO installer and select Normal Installation. Follow the on-screen instructions to complete the installation. During the process, you will be prompted to create a user account—this account will be used to run the EDA tools required for this tutorial.

Once Ubuntu is successfully installed, log in to your VM and update the system by running the following command:

`sudo apt update && sudo apt upgrade -y`

If you are using VirtualBox, install Guest Additions to enable features like shared clipboard, drag-and-drop, and better display resolution.

**Steps to Install Guest Additions:**
1. Open the VirtualBox menu and go to Devices → Insert Guest Additions CD Image.
2. Inside the VM, open a terminal and run:
```bash
sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)
cd /media/$USER/VBox_GAs_*  
sudo ./VBoxLinuxAdditions.run
```
3. Reboot the VM:
```bash
sudo reboot
```
Now, your Ubuntu VM is fully set up with networking, updates, and enhanced performance! 🚀

## 📋 Pre-Requisites

**Setting Up Essential Software**

To get started, we need to install a **C compiler** along with fundamental development tools:
```bash
sudo apt install build-essential
```
After that, we must install several **libraries** required for compiling software tools:
```bash
sudo apt install bison flex libx11-dev libreadline-dev libxaw7-dev libxmu-dev x11proto-xext-dev libxft-dev fontconfig libxrender-dev libfftw3-dev autoconf automake libtool libedit-dev adms tcl-dev tk-dev git csh libcairo-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev xterm xclip
```
For **Python 3**, we will use **Anaconda**. Head over to the [**official Anaconda website**](https://www.anaconda.com/download) and download the latest version of the installer. 
![image](https://github.com/user-attachments/assets/5d249e12-6b40-422f-9f31-94de2ec96bca)

Once downloaded, modify its permissions to allow execution and then proceed with the installation:
```bash
chmod a+x Anaconda3-2024.10-1-Linux-x86_64.sh
./Anaconda3-2024.10-1-Linux-x86_64.sh
```
📌 Note: In this case, **Anaconda3-2024.10-1** was used. If a newer version is available, update the filename accordingly.

To install pip3 (Python package manager), run:
```bash
sudo apt update
sudo apt install -y python3-pip
```

Verify the installation:
```bash
pip3 --version
```

## 🔧 Installation of NGSPICE  
![image](https://github.com/user-attachments/assets/84bc4339-1fa7-40d7-a6c5-5c47f4e899d7)

**NGSPICE** is an open-source **[SPICE](https://en.wikipedia.org/wiki/SPICE)**. simulator used for analyzing electronic circuits. To get started, download the latest version from the [**NGSPICE website**](https://ngspice.sourceforge.io/download.html), then extract the compressed file:
```bash
tar xvf ngspice-44.2.tar.gz
```
This will create a directory named ngspice-44.2. Navigate into this directory and follow these steps to compile and install it:
```bash
cd ngspice-44.2
mkdir release
cd release
../configure --with-x --with-readline=yes --disable-debug
make
sudo make install
```
By default, NGSPICE executables will be installed in /usr/local/bin/.
📌 Note: In this case, **ngspice-44.2** was used. If a newer version is available, update the filename accordingly.

## 🎨 Installation of MAGIC  
![image](https://github.com/user-attachments/assets/46468d2d-82b3-48bb-a97a-890f56af6ad0)

**MAGIC** is a **free and open-source VLSI layout tool used for IC design**. 

Before downloading MAGIC, ensure Git is installed on your system:
```bash
git clone https://github.com/RTimothyEdwards/magic
```
Before downloading MAGIC, ensure Git is installed on your system:
```bash
sudo apt update
sudo apt install -y git
```
Once Git is installed, clone the MAGIC repository:
```bash
git clone https://github.com/RTimothyEdwards/magic
```
Once the repository is cloned, navigate to the MAGIC directory and proceed with the compilation and installation:
```bash
cd magic
./configure
make
sudo make install
```

## 🏗️ Installation of SKY130 
![image](https://github.com/user-attachments/assets/5b189708-eb4d-4c28-b72a-59e7d7a28e25)

The [**SkyWater 130nm PDK (SKY130)**]() is an open-source semiconductor process node designed for integration with open-source EDA tools. This PDK provides libraries, models, and design flows required for IC development. While **OpenPDK** also supports **GF180MCU**, this guide will focus specifically on **SkyWater’s SKY130 process**.

To begin, clone the **OpenPDK** repository, which contains installation scripts for setting up the design kit:
```bash
git clone git://opencircuitdesign.com/open_pdks
```
Once the repository is downloaded, proceed with the installation. Keep in mind that this process may take some time:
```bash
cd open_pdks/
./configure --enable-sky130-pdk
make
sudo make install
```
## 📜 Installation of XSCHEM
![image](https://github.com/user-attachments/assets/08d2e00c-cf83-43be-b639-d008a479ef1b)

**XSCHEM** is a powerful open-source schematic editor designed for **VLSI**, **ASIC**, and **analog circuit design**. It supports netlist generation for **VHDL**, **SPICE**, and **Verilog**. To install XSCHEM, start by cloning its source code from GitHub:
```bash
git clone https://github.com/StefanSchippers/xschem
```
Once the repository is downloaded, navigate into the **XSCHEM directory**, configure the build, compile, and install it using the following commands:
```bash
cd xschem
./configure
make
sudo make install
```
After installation, you must copy the **XSCHEM configuration file** for the **SkyWater 130nm PDK** to your working directory. This step ensures access to the **design kit features**:
```bash
cp /usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc .
```

## 📩 Inquiries  
For any questions or clarifications, feel free to reach out via:  
💼 LinkedIn: https://www.linkedin.com/in/john-christian-leocario/
📌 GitHub Issues: [Open an Issue](https://github.com/Xtiantzyyy/Open-Source-IC-Design-Tools) 
