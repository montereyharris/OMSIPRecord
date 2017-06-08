class OmsIPRecord{

    [String]$IPAddress
    [String]$Hostname
    [string]$Interface
    [String]$InterfaceDescription


        OmsIPRecord () {}


        OmsIPRecord ([String]$IPAddress,[String]$Hostname,[string]$Interface,[String]$InterfaceDescription){
        $this.IPAddress = $IPAddress
        $this.Hostname= $Hostname
        $this.Interface = $Interface
        $this.InterfaceDescription= $InterfaceDescription

        }
        }

Function Get-OmSIPRecord {
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER ComputerName
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
[CmdletBinding()]
Param(

    [Parameter(Mandatory=$true,ParameterSetName ='Default')]
    [String[]]
    $HostName,

    [Parameter(Mandatory=$false,ParameterSetName ='Default')]
    [Switch]
    $IncludeIPv6,

    [Parameter(Mandatory=$false,ParameterSetName ='Default')]
    [String]
    [ValidateSet('WMI','CIM')]
    $CommuncationProtocol,

    # Parameter help description
    [Parameter(Mandatory=$false,ParameterSetName ='Manual')]
    [Switch]
    $Manual,

    # Parameter help description
    [Parameter(Mandatory=$false,ParameterSetName ='Manual')]
    [ValidateScript({Test-path -Path $_})]
    [String]
    $ParameterName
)

Begin{
    try {
        if($CommuncationProtocol -eq 'WMI'){$IPdata = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName $HostName|where{$_.IPAddress} }

        If($CommuncationProtocol -eq 'CIM'){$IPdata = Get-NetIPAddress -CimSession $HostName | where{$_.IPAddress -notlike "fe*" -or $_.IPAddress -notlike "169.*"}|where{$_.interfacealias -notlike "*Loopback*"}}
    }
    catch {
        Write-Error -Exception $Error[-1].Exception -Message 'Communcation failed with remote computer' -RecommendedAction "Check Computer to make sure that $CommuncationProtocol is available"

    }
}

Process{

    Foreach($IP in $IPdata){
        If($CommuncationProtocol -eq 'WMI'){
            $InterfaceIps = $IP.IPAddress|where{$_ -notlike "fe*" -or $_ -notlike "169.*"}

            Foreach($IntIP in $InterfaceIps){
                $record = [OmsIPRecord]::new($IntIP,$IP.PSComputername,$IP.index,$IP.description)
                 $record
            }
        }

             If($CommuncationProtocol -eq 'CIM'){
                $InterfaceIps = $IP|where{$_.ipaddress -notlike "fe*" -or $_ -notlike "169.*"}
              if(!$IncludeIPv6){ $interfaceips = $interfaceips|where Addressfamily -NotLike "*6*"}

                Foreach($IntIP in $InterfaceIps){
                    $record = [OmsIPRecord]::new($intIP.IPaddress,$intIP.PScomputername,$intIP.interfaceindex,$intip.interfacealias)

                    #$record.IPAddress = $intIP.IPaddress
                    #$record.Hostname = $intIP.PScomputername
                    #$record.Interface = $intIP.interfaceindex
                    #$record.InterfaceDescription = $intip.interfacealias
                    #$record.UTCtime = (Get-date).ToUniversalTime()
                    #}

                    $record


                    }
            }
        }




    }
End{

    }
}




#Get-OMSIPRecord -HostName Elmwrkday01 -CommuncationProtocol CIM

#Get-OmSIPRecord -HostName ELMspdev01 -CommuncationProtocol WMI