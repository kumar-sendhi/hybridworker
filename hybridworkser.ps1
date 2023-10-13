param(

[Parameter (Mandatory= $true)]

[string]

 $hybridworkergroup,

[Parameter (Mandatory= $true)]

[string]

$AutomationAccountName,

[Parameter (Mandatory= $true)]

[string]

$VmResourceId,

[Parameter (Mandatory= $true)]

[string]

$ResourceGroupName,

[Parameter (Mandatory= $true)]

[string]

$registerationURL,

[Parameter (Mandatory= $true)]

[string]

$Location,

[Parameter (Mandatory= $true)]

[string]

$vm_name,

[Parameter (Mandatory= $true)]

[string]

$extensionname

)

 
Install-Module -Name Az -Repository PSGallery -Force
 

$abc=[guid]::NewGuid()

New-AzAutomationHybridRunbookWorker -AutomationAccountName $AutomationAccountName -Name $abc -HybridRunbookWorkerGroupName $hybridworkergroup -VmResourceId $VmResourceId -ResourceGroupName $ResourceGroupName

 $settings = @{

"AutomationAccountURL"  = $registerationURL;

};

Set-AzVMExtension -ResourceGroupName $ResourceGroupName -Location $Location -VMName $vm_name -Name $extensionname -Publisher "Microsoft.Azure.Automation.HybridWorker" -ExtensionType HybridWorkerForWindows -Settings $settings -EnableAutomaticUpgrade $false -TypeHandlerVersion 1.10
