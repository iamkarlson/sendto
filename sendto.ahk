SetTitleMatchMode 2
global Destination := "D:\OneDrive\3dprinter\things"
;global Destination := "D:\trash\testing"

Loop %0%
{
    Item := %A_Index%
    Extract(Item)
    FileDelete, %Item%
}
Extract(FilePath){
    FileCopy, %FilePath%, %Destination%
    SplitPath, FilePath, FileName,,,TargetDir
    SetWorkingDir, %Destination%
    Run, C:\ProgramData\chocolatey\bin\7z.exe x -y %FileName% -o%TargetDir%
}

if WinExist(Destination)
    WinActivate ; use the window found above
else
    Run, explore %Destination%
