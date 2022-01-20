# Turn Off Power Saving Function of All Network Adapters
## A simple script for Windows 10+

Note:
1. This script works to batch change the settings so that the connected network adapters in Windows do not enter sleep mode.
2. This script must be run with administrator privileges because it changes system settings.
5. This script was tested on Windows 10, 11.

---

Usage:
* **Execute with parameters**
   * PowerShell
   ```
   .\NetAdapterPowerSaveTurnOff.ps1 -ExecutionPolicy Bypass
   ```
   * cmd
   ```
   powershell -ExecutionPolicy Bypass -File .\NetAdapterPowerSaveTurnOff.ps1
   ```

History:
- 2022-01-20 : [Version 1.0](NetAdapterPowerSaveTurnOff.ps1)
   - First public
