Invoke-Command -ComputerName "hostnamehere" -ScriptBlock {
    Export-WindowsDriver -Online -Destination "C:\Drivers"   
}

