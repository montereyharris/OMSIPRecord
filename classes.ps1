

class OmsIPRecord{

    [String]$IPAddress
    [String]$Hostname
    [string]$Interface
    [String]$InterfaceDescription


        OmsIPRecord () {}


        <#OmsIPRecord ([String]$IPAddress,[String]$Hostname,[string]$Interface,[String]$InterfaceDescription){
        $this.IPAddress = $IPAddress
        $this.Hostname= $Hostname
        $this.Interface = $Interface
        $this.InterfaceDescription= $InterfaceDescription

        }#>
      }

#using class OMSIpRecord