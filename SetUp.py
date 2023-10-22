import shutil
import ctypes
import subprocess


# # Admin Privilege Commands
# adminCommand = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); pause"
# ctypes.windll.shell32.ShellExecuteW(None, "runas", "powershell.exe", "-NoExit -Command {}".format(adminCommand), None, 1)
# adminCommand_2 = "Choco install nvm; pause"
# ctypes.windll.shell32.ShellExecuteW(None, "runas", "powershell.exe", "-NoExit -Command {}".format(adminCommand_2), None, 1)


def adminCommand(adminCommand_1, adminCommand_2):
    try:
        full_command = f"-NoExit -Command \"{adminCommand_1}; {adminCommand_2}\""
        ctypes.windll.shell32.ShellExecuteW(None, "runas", "powershell.exe", full_command, None, 1)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    adminCommand_1 = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); pause"
    adminCommand_2 = "choco install nvm; pause"

    adminCommand(adminCommand_1, adminCommand_2)



# Normal Commands 
commands = [
    "winget install --id=Neovim.Neovim -e",
    "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force",
    "git clone https://github.com/tribhuwan-kumar/Setup-Powershell-Terminal-with-Neovim-and-Oh-My-Posh.git .\AppData\Local\nvim",
    "winget install -e --id OpenJS.Node.JS"
]

for command in commands:
    subprocess.run(["pwsh", "-Command", commands], check=True)



# Folder Specific commands
folder_path = "C:\\AppData\\Local\\nvim-data\\plugged\\coc.nvim"
folder_commands = [
     "npm install --global yarn",
     "yarn install"
]

for command in folder_commands:
    subprocess.run(["pwsh", "-Command", folder_commands], check=True, cwd=folder_path)



# pwsh Commands
terminal_commands = [
    "Install-Module Terminal-Icons -Repository PSGallery -Force",
    "Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck",
    "Install-Script winfetch",
    "install-Module go-my-posh"
]

for command in terminal_commands:
    subprocess.run(["pwsh", "-Command", terminal_commands], check=True)



# For Terminal Modules
profile_command = "echo $PROFILE"
process = subprocess.Popen(["pwsh", "-Command", profile_command], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
stdout, stderr = process.communicate()

if process.returncode != 0:
    print(f"Error: {stderr}")
else:
    profile_output = stdout.strip()

source_file = r"Microsoft.PowerShell_profile.ps1"
destination_folder = fr"{profile_output}"

shutil.copy(source_file, destination_folder)

print("Done!!")