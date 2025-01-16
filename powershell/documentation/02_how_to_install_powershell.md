# How to Install PowerShell

This guide provides detailed steps for installing PowerShell on different platforms, ensuring you have all the necessary tools to start working with PowerShell efficiently.

## Table of Contents
1. [Overview](#overview)
2. [System Requirements](#system-requirements)
3. [Installation on Windows](#installation-on-windows)
    - [Using Windows Store](#using-windows-store)
    - [Using MSI Installer](#using-msi-installer)
4. [Installation on macOS](#installation-on-macos)
5. [Installation on Linux](#installation-on-linux)
    - [Debian and Ubuntu](#debian-and-ubuntu)
    - [CentOS, RHEL, and Fedora](#centos-rhel-and-fedora)
6. [Installing PowerShell Preview](#installing-powershell-preview)
7. [Post-Installation Configuration](#post-installation-configuration)
8. [Verifying the Installation](#verifying-the-installation)

---

## Overview
PowerShell is a cross-platform task automation tool consisting of a command-line shell, a scripting language, and a configuration management framework. It is available for Windows, macOS, and Linux. This document provides step-by-step instructions to install PowerShell on these operating systems.

## System Requirements
Before proceeding, ensure your system meets the following requirements:
- **Windows**: Windows 8.1 or later, including Windows 10 and Windows Server 2012 R2 or later.
- **macOS**: macOS 10.13 or higher.
- **Linux**: A supported distribution such as Ubuntu, Debian, CentOS, RHEL, or Fedora.

Ensure you have administrative privileges to install software.

---

## Installation on Windows

### Using Windows Store
1. Open the **Microsoft Store** on your computer.
2. Search for "PowerShell" in the store's search bar.
3. Click on the **PowerShell** app from Microsoft Corporation.
4. Click **Get** or **Install** to download and install the app.
5. Once installed, launch PowerShell from the Start menu.

### Using MSI Installer
1. Go to the official [PowerShell GitHub releases page](https://github.com/PowerShell/PowerShell/releases).
2. Download the MSI package for your Windows architecture (x64 or x86).
3. Run the MSI installer and follow the prompts:
   - Accept the license agreement.
   - Choose the installation directory (default is recommended).
   - Complete the installation.
4. Open PowerShell from the Start menu or by searching for "pwsh".

---

## Installation on macOS
1. Open the **Terminal** app.
2. Install **Homebrew** if not already installed:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Use Homebrew to install PowerShell:
   ```bash
   brew install --cask powershell
   ```
4. Launch PowerShell by typing:
   ```bash
   pwsh
   ```

Alternatively, download the PKG file from the [PowerShell GitHub releases page](https://github.com/PowerShell/PowerShell/releases) and install it manually.

---

## Installation on Linux

### Debian and Ubuntu
1. Open the terminal.
2. Update the package list and install prerequisites:
   ```bash
   sudo apt update
   sudo apt install -y wget apt-transport-https software-properties-common
   ```
3. Import the Microsoft GPG key:
   ```bash
   wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
   ```
4. Add the PowerShell repository:
   ```bash
   sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-focal-prod focal main"
   ```
5. Install PowerShell:
   ```bash
   sudo apt update
   sudo apt install -y powershell
   ```
6. Launch PowerShell:
   ```bash
   pwsh
   ```

### CentOS, RHEL, and Fedora
1. Open the terminal.
2. Install prerequisites:
   ```bash
   sudo dnf install -y wget
   ```
3. Import the Microsoft GPG key:
   ```bash
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   ```
4. Add the PowerShell repository:
   ```bash
   sudo tee /etc/yum.repos.d/microsoft.repo << EOF
   [packages-microsoft-com-prod]
   name=Microsoft Packages for CentOS/RHEL/Fedora
   baseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod
   enabled=1
   gpgcheck=1
   gpgkey=https://packages.microsoft.com/keys/microsoft.asc
   EOF
   ```
5. Install PowerShell:
   ```bash
   sudo dnf install -y powershell
   ```
6. Launch PowerShell:
   ```bash
   pwsh
   ```

---

## Installing PowerShell Preview
PowerShell Preview is a version with experimental features. To install:
1. Visit the [PowerShell GitHub releases page](https://github.com/PowerShell/PowerShell/releases).
2. Download the package labeled "Preview" for your OS.
3. Follow the same installation steps as the stable version.

---

## Post-Installation Configuration
- **Set PowerShell as Default Shell**:
  - Windows: Set PowerShell as the default terminal in Windows Terminal settings.
  - Linux/macOS: Add an alias to your shell configuration file (e.g., `~/.bashrc`):
    ```bash
    alias pwsh="/usr/bin/pwsh"
    ```
- **Install Common Modules**:
  ```powershell
  Install-Module -Name Az -AllowClobber -Scope CurrentUser
  ```

---

## Verifying the Installation
1. Open PowerShell by typing `pwsh` in your terminal or start menu.
2. Check the version:
   ```powershell
   $PSVersionTable
   ```
3. You should see the version details of PowerShell Core.

---

