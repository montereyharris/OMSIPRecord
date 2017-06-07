Function New-OmSIPRecord {
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
    [Parameter(Mandatory=$false,ParameterSetName ='Default')]
    [ParameterType]
    $ParameterName






)
}
