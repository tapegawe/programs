# Turn Off Power Saving Function of All Network Adapters
## A simple script running on PowerShell in Windows 10+

Note:
1. In Windows, this script works to batch **SAFE** change the settings that the all connected network adapters do not enter sleep mode.
2. This script must be run with administrator privileges because it changes system settings.
5. This script was tested on Windows 10, 11.

---

Usage:
* **How to execute**
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
   - First public release
