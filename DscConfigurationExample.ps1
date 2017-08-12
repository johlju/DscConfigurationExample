
<#PSScriptInfo

.VERSION 1.0.0.0

.GUID 0839ed77-ca41-4e09-a737-8c054e88a4bc

.AUTHOR Johan Ljunggren

.COMPANYNAME Johan Ljunggren

.COPYRIGHT (c) 2017 Johan Ljunggren. All rights reserved.

.TAGS DSC Config

.LICENSEURI https://github.com/johlju/DscConfigurationExample/blob/master/LICENSE

.PROJECTURI https://github.com/johlju/DscConfigurationExample

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


#>

#Requires -Module PSDscResources
#Requires -Module xComputerManagement

<#
    .DESCRIPTION
        Configuration to configure the first target node
#>
Configuration FirstTargetNode
{
    Import-DscResource -ModuleName 'PSDscResources'

    Node $AllNodes.NodeName
    {
        Group testGroup
        {
            Ensure    = 'Present'
            GroupName = $Node.GroupName
        }
    }
}

<#
    .DESCRIPTION
        Configuration to configure the second target node
#>
Configuration SecondTargetNode
{
    Import-DscResource -ModuleName 'xComputerManagement'

    Node $AllNodes.NodeName
    {
        xPowerPlan ChangePowerPlanToHigh
        {
          IsSingleInstance = 'Yes'
          Name = $Node.PowerPlanName
        }
    }
}
