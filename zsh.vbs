Set WshShell = CreateObject("WScript.Shell")
Set Fso = CreateObject("Scripting.FileSystemObject")
parentDir = Fso.GetParentFolderName(WScript.ScriptFullName)
batPath = parentDir & "\_hidden\zsh.bat"
WshShell.Run """" & batPath & """", 0, False
