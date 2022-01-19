# Automatic Wi-Fi setting for Windows 10+
# A simple script running on Windows PowerShell

### Lastest Version 1.2 on 2022-01-19

---

Note:
1. This script can be run on both of Windows PowerShell and PowerShell v7 series.
2. Without manually setup Wi-Fi settings through many steps by clicking and typing in Windows, you can do it with one line command.
3. This script must be executed with administrator privileges because it controls the Windows service.
4. This file must be saved in "UTF8-BOM" encoding format for Korean to be displayed properly.
5. This script tested on Windows 10, 11.

---

Usage:
1. **Execute with parameters**
   * PowerShell
   ```
   PS> .\AutoSetWifi_v1.2.ps1 -ssid Smart-Office-5.0Ghz -password 1234567890
   ```
   * cmd
   ```
   > powershell .\AutoSetWifi_v1.2.ps1 -ssid Smart-Office-5.0Ghz -password 1234567890
   ```
2. **Execute without parameters**
   * PowerShell
   ```
   PS> .\AutoSetWifi_v1.2.ps1
   ```
   * cmd
   ```
   > powershell .\AutoSetWifi_v1.2.ps1
   ```
3. When can't connect to SSID
   ```
   PS> .\AutoSetWifi_v1.2.ps1
   연결할 SSID를 입력하세요: test_ssid
   SSID 암호를 입력하세요: 1234567890
   Wi-Fi 인터페이스에 test_ssid 프로필이 추가되었습니다.
   "test_ssid" 프로필에 지정된 네트워크에 연결할 수 없습니다.
   연결에 문제가 발생하였습니다. 다시 시도하시겠습니까? [y/n]: y
   연결할 SSID를 입력하세요: test_ssid2
   SSID 암호를 입력하세요: 1234567890
   Wi-Fi 인터페이스에 test_ssid2 프로필이 추가되었습니다.
   "test_ssid2" 프로필에 지정된 네트워크에 연결할 수 없습니다.
   연결에 문제가 발생하였습니다. 다시 시도하시겠습니까? [y/n]: n
   ```
4. If not exist the wireless service
   ```
   PS> .\AutoSetWifi_v1.2.ps1
   무선랜 관련 설정을 위한 'wlansvc' 서비스가 존재하지 않습니다. 무선랜 관련 설정을 완료할 수 없습니다.
   계속하려면 <Enter> 키를 누르십시오.:
   ```
5. If not entered any SSID
   ```
   PS> .\AutoSetWifi_v1.2.ps1
   연결할 SSID를 입력하세요:
   SSID 암호를 입력하세요:
   입력된 SSID가 없어서 설정을 종료합니다.
   계속하려면 <Enter> 키를 누르십시오.:
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
