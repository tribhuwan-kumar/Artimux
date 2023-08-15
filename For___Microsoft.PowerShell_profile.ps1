#Aliases
Set-Alias tt tree
Set-Alias ll ls
#Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim





#Prompt
#oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:/Users/<username>/Documents/PowerShell/myprofile.omp.json' | Invoke-Expression

#Functions 
function whereis ($command) {
	Get-command -Name $command -ErrorAction SilentlyContinue |
	Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
#Terminal Icons
Import-Module Terminal-Icons

#PSReadline 
Import-Module PSReadline
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle Listview


