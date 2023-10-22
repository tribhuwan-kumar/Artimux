#Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim nvim


#Prompt     										 #Use go-my-posh theme for fast loading in terminal
#oh-my-posh init pwsh | Invoke-Expression
#oh-my-posh init pwsh --config 'C:/Users/<username>/Documents/PowerShell/myprofile.omp.json' | Invoke-Expression #replace <username> to your C drive name


Import-Module go-my-posh
Set-PoshPrompt agnoster

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
