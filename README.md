---
description: This template allows you to automatically run VM-to-VM latency test with PsPing utility.
page_type: sample
products:
- azure
- azure-resource-manager
urlFragment: vm-to-vm-latency-meter
languages:
- json
---
# Azure VM-to-VM latency meter

This template allows you to automatically run a VM-to-VM latency test using PsPing utility.
Please note that by deploying this template you are automatically accepting [Sysinternals Software License Terms](https://technet.microsoft.com/sysinternals/bb469936).

The VM sizes selected should be available in chosen regions. Please check availability [here](https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/table).
See VM series/sizes [description](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/).

Upon template deployment you will have the latency between the VMs automatically measured. You can see the measurements:

```powershell
OutputsString           :
                          Name                 Type                       Value
                          ===============      =========================  ==========
                          latencytestresult  String                     Latency: Minimum = 0.89ms, Maximum = 3.90ms, Average = 1.25ms
```

![alt text](images/bandwidth.png "Latency measurement output")

To re-measure the latency you can login to the probe VM with credentials you provided during deployment.

In case you don't need to re-measure, it is safe to delete the created resource group.

`Tags: Microsoft.Network/publicIPAddresses, Microsoft.Network/virtualNetworks, Microsoft.Network/networkSecurityGroups, Microsoft.Network/networkInterfaces, Microsoft.Compute/virtualMachines, Microsoft.Compute/virtualMachines/extensions, CustomScriptExtension, CustomScript`
