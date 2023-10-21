# Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh
### Setup windows Terminal from scratch with Neovim and customize with Oh My Posh
# Features:
### Setup of Neovim
![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/bec3550e-868a-4915-a227-9806c91bc0b5)
### Terminal Icons
![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/3649cd1b-c65d-4463-b288-d5c1a5621934)
### Command History
![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/8d2ac6b1-a627-4d5b-ade1-8bd61ff040a4)


## Required Installation
- Install **Windows Terminal** from [here](https://www.microsoft.com/store/productid/9N0DX20HK701?ocid=pdpshare)
- Install **Git Bash** from [here](https://git-scm.com/downloads)
- Install **PowerShell** from [here](https://www.microsoft.com/store/productid/9MZ1SNWT0N5D?ocid=pdpshare)
Install **Choco** by running the following command in **PowerShell**(admin)
```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
Install **Neovim** by running the following command in **PowerShell** 
```bash
winget install --id=Neovim.Neovim -e 
```
After that, Run the following command in **Powershell**, This will install the **vim-plug**
```bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
Clone this repository by using **git clone** command
```bash
git clone https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh.git .\AppData\Local\nvim
```
- Now run `nvim` command in **PowerShell** then run `:PlugInstall` command in **nvim** command shell to install all the plugin of `init.vim` file.

Go to `C:\Users\<username>\AppData\Local\nvim-data\plugged` through **PowerShell Terminal** & Run the following command
```bash
winget install -e --id OpenJS.Node.JS 
```
Install **nvm** with chocolatey by the following command(admin)
```bash
Choco install nvm
```
Now go to `C:\Users\<username>\AppData\Local\nvim-data\plugged\coc.nvim` & run following command respectively 
```bash
npm install --global yarn
```
```bash
yarn install
```
Run `nvim` in **PowerShell** this will install all the added auto completions package. 

## Terminal Setup by Oh-My-Posh
Run this command in **PowerShell** to install **Oh-My-Posh** 
```bash
winget install JanDeDobbeleer.OhMyPosh -s winget
```
Run `echo $PROFILE` this will show your **PowerShell** Profile location

- Go to `C:\Users\<username>\Documents\` & create a directory name   `PowerShell`
- Go to `C:\Users\<username>\Documents\PowerShell` directory & Paste **[code](https://raw.githubusercontent.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/main/For___Microsoft.PowerShell_profile.ps1)** in `Microsoft.PowerShell_profile.ps1` file.
- Create an another file named by `myprofile.omp.json` in this directory `C:\Users\<username>\Documents\PowerShell`. Here you can change the theme of **PowerShell Terminal**, Choose themes from [here](https://ohmyposh.dev/docs/themes) and paste that theme code in `myprofile.omp.json` file.

- Run command to install **Terminal-Icons**
```bash
Install-Module Terminal-Icons -Repository PSGallery -Force
```
- Run command to install **PSReadLine** for command history 
```bash
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```
- Run command to install **Winfetch**
```bash
Install-Script winfetch
```
### Your Terminal is ready :heart: , Drop a Star :star:
#### I will add more plugins and Features :blush:
