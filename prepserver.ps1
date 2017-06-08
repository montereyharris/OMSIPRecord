If(!(Get-Module -Name OMSDataInjection -ListAvailable)){

    Install-Module -Name OMSDataInjection
}

If(!(Get-Module -Name InstallModuleFromGitHub -ListAvailable)){

    Install-Module -Name InstallModuleFromGitHub
}


if(!(Get-Module -Name OMS.IPInventory -ListAvailable)){

    Install-ModuleFromGitHub -GitHubRepo montereyharris/OMSIPrecord -Branch master
}