# Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh
Setup **windows Terminal** from scratch with **Neovim** and customize with **Oh My Posh**

![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/bec3550e-868a-4915-a227-9806c91bc0b5)
### Terminal Icons
![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/3649cd1b-c65d-4463-b288-d5c1a5621934)
### command History
![image](https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh/assets/118052427/8d2ac6b1-a627-4d5b-ade1-8bd61ff040a4)


## Required Installation
- Install **Windows Terminal** from [here](https://www.microsoft.com/store/productid/9N0DX20HK701?ocid=pdpshare)
- Install **PowerShell** from [here](https://www.microsoft.com/store/productid/9MZ1SNWT0N5D?ocid=pdpshare)
- Install **Neovim** by running this commands in **PowerShell** 
```bash
winget install --id=Neovim.Neovim -e 
```
- After that, run this command in **Powershell**
```bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
Clone this repository by using git clone command
```bash
git clone https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh.git .\AppData\Local\nvim
```
