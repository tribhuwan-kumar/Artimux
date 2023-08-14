# Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh
Setup **windows Terminal** from scratch with **Neovim** and customize with **Oh My Posh**
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
