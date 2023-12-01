import os
import json
import ctypes
import shutil
import subprocess

# Admin Privilege Commands
def adminCommand(adminCommand_1, adminCommand_2, adminCommand_3, adminCommand_4, adminCommand_5,):
    try:
        full_command = f"-NoExit -Command \"{adminCommand_1}; {adminCommand_2}; {adminCommand_3}; {adminCommand_4}; {adminCommand_5}\""
        ctypes.windll.shell32.ShellExecuteW(None, "runas", "powershell.exe", full_command, None, 1)
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    adminCommand_1 = "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); pause"
    adminCommand_2 = "choco install nvm; pause"
    adminCommand_3 = "choco install neovim; pause"
    adminCommand_4 = "choco install nodejs.install; pause"
    adminCommand_5 = "choco install oh-my-posh"

    adminCommand(adminCommand_1, adminCommand_2, adminCommand_3, adminCommand_4, adminCommand_5)



# CascadiaCode Font Installation
def installFonts(source_folder):
    try:
        fonts_dir = os.path.join(os.environ['SystemRoot'], 'Fonts')

        if os.path.exists(source_folder) and os.path.isdir(source_folder):
            dest_folder = os.path.join(fonts_dir, os.path.basename(source_folder))

            cmd = f'xcopy /E /I /Y "{source_folder}" "{dest_folder}"'
            ctypes.windll.shell32.ShellExecuteW(None, "runas", "cmd.exe", "/c " + cmd, None, 1)

            print(f"{source_folder} font installed!!")
        else:
            print(f"Source folder '{source_folder}' does not exist or is not a directory.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    source_folder = r'CascadiaCode' 
    installFonts(source_folder)

# Setting Font to CaskaydiaCove Nerd Font Mono
settings_path = os.path.join(os.getenv('USERPROFILE'), 'AppData', 'Local', 'Packages', 'Microsoft.WindowsTerminal_8wekyb3d8bbwe', 'LocalState', 'settings.json')

with open(settings_path, 'r') as file:
    settings = json.load(file)

settings['profiles']['defaults']['fontFace'] = "CaskaydiaCove Nerd Font Mono"

with open(settings_path, 'w') as file:
    json.dump(settings, file, indent=4)



# Vim Plug command
commands = [
    "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni \"$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim\" -Force; pause",
]

for command in commands:
    subprocess.run(["pwsh", "-Command", command], check=True)



# Modules Commands
terminal_commands = [
    "Install-Module Terminal-Icons -Repository PSGallery -Force; pause",
    "Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck; pause",
    "Install-Script winfetch; pause",
    "Install-Module go-my-posh"
]

for tm_command in terminal_commands:
    subprocess.run(["pwsh", "-Command", tm_command], check=True)



# For Terminal Profile 
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

print("Installation  Done!!")