Param(
[CmdletBinding()]
    # Parameter help description
    [Parameter(Mandatory=$true,ParameterSetName ='Default')]
    [String[]]
    $ComputerName
)

Begin{
    $count = ($ComputerName|Measure-Object).Count
    $output = @()

}
Process{
    foreach($computer in $ComputerName){

        $OSversion = (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer).version

        if($OSversion -lt 6.2){

            $IPs = Get-WMIIpAddress -ComputerName $computer
        }

        If($OSversion -ge 6.2){

            $RawIPData = Get-NetIPAddress -CimSession $computer -AddressFamily IPv4 | where{$_.InterfaceAlias -notlike "*loopback*"}
            Foreach($IP in $RawIPData){

            }
        }

        $Output += $IPs

    }

}
End{
    $Output

}