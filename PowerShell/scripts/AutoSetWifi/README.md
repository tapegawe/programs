# Automatic Wi-Fi setting for Windows 10+
## A simple script running on Windows PowerShell

### Lastest Version 1.2 on 2022-01-19

---

Note:
1. This script can be run on both of Windows PowerShell and PowerShell v7 series.
2. Without manually setup Wi-Fi settings through many steps by clicking and typing in Windows, you can do it with one line command.
3. This script must be executed with administrator privileges because it controls the Windows service.
4. This file must be saved in "UTF8-BOM" encoding format for Korean to be displayed properly.
5. This script was tested on Windows 10, 11.

---

Usage:
1. **Execute with parameters**
   * PowerShell
   ```
   .\AutoSetWifi_v1.2.ps1 -ExecutionPolicy Bypass -ssid Smart-Office-5.0Ghz -password 1234567890
   ```
   * cmd
   ```
   powershell -ExecutionPolicy Bypass -File .\AutoSetWifi_v1.2.ps1 -ssid Smart-Office-5.0Ghz -password 1234567890
   ```
2. **Execute without parameters**
   * PowerShell
   ```
   .\AutoSetWifi_v1.2.ps1 -ExecutionPolicy Bypass
   ```
   * cmd
   ```
   powershell -ExecutionPolicy Bypass -File .\AutoSetWifi_v1.2.ps1
   ```
3. When can't connect to SSID
   ```
   PS > .\AutoSetWifi_v1.2.ps1
   Enter a SSID to connect: test_ssid
   Enter the passphrase: 1234567890
   Profile test_ssid is added on interface Wi-Fi.
   Unable to connect to network specified in profile "test_ssid".
   There was a problem with the connection. Would you like to try again? [y/n]: y
   Enter a SSID to connect: test_ssid2
   Enter the passphrase: 1234567890
   Profile test_ssid2 is added on interface Wi-Fi.
   Unable to connect to network specified in profile "test_ssid2".
   There was a problem with the connection. Would you like to try again? [y/n]: n
   ```
4. If not exist the wireless service
   ```
   PS > .\AutoSetWifi_v1.2.ps1
   The 'wlansvc' service used for wireless network does not exist. This program can't continue to setup.
   Press Enter to continue...:
   ```
5. If not entered any SSID
   ```
   PS > .\AutoSetWifi_v1.2.ps1
   Enter a SSID to connect:
   Enter the passphrase:
   There is no SSID entered, the setup is terminated.
   Press Enter to continue...:
   ```

---

Version history:
- 2022-01-19 : [Version 1.2](AutoSetWifi_v1.2.ps1)
   - Multilingual message applied
   <br><br>
- 2022-01-18 : Version 1.1
   - Application of service exception handling: If there is no WLAN service in the running window, an exception is applied\
     → If there is no WLAN device, the service itself does not exist
   <br><br>
- 2022-01-13 : Version 1.0
   - First release
