# Automatic Wi-Fi setting
# A simple script running on Windows PowerShell
#
#
# NOTE:
# 1. This script can be run on both of Windows PowerShell and PowerShell v7 series.
# 2. This script must be executed with administrator privileges because it controls the Windows service.
# 3. This file must be saved in "UTF8-BOM" encoding format for Korean to be displayed properly.
#
#
# Version 1.2
# Last modified on 2022-01-18
# Written by Byungho Park


# Parameters
param 
(
	[string]$ssid = "",
	[string]$password = ""
)

###############################################################################################
# Constants
$servicename = "wlansvc"
$status = "Running"
$profilefile = "wifi_profile.xml"
$result_ok = "ok"
$result_ng = "ng"
$enter_y = "y"
$enter_n = "n"

# Multilingual messages
$msg_enter_ssid = "Enter a SSID to connect"
$msg_enter_pass = "Enter the passphrase"
$msg_tryagain = "There was a problem with the connection. Would you like to try again? [y/n]"
$msg_warning_noservice = "The '" + ($servicename) + "' service used for wireless network does not exist. This program can't continue to setup."
$msg_error_nossid = "There is no SSID entered, the setup is terminated."

$culture = Get-Culture
$language = $culture.Name

switch ($language)
{
	"ko-KR"
	{
		$msg_enter_ssid = "연결할 SSID를 입력하세요"
		$msg_enter_pass = "SSID 암호를 입력하세요"
		$msg_tryagain = "연결에 문제가 발생하였습니다. 다시 시도하시겠습니까? [y/n]"
		$msg_warning_noservice = "무선랜 관련 설정을 위한 '" + ($servicename) + "' 서비스가 존재하지 않습니다. 무선랜 관련 설정을 완료할 수 없습니다."
		$msg_error_nossid = "입력된 SSID가 없어서 설정을 종료합니다."
	}
}

# Variables
$result_conn = "ok"
$confirm = "y"
###############################################################################################

## Check service existence and set config to auto for wlansvc
if (Get-Service -Name ($servicename) -ErrorAction SilentlyContinue)
{
	Set-Service -Name ($servicename) -StartupType Automatic
}
else
{
	Write-Host ($msg_warning_noservice)
	pause
	exit
}

# If not running in service
if (Get-Service ($servicename) | Where-Object {$_.Status -ne ($status)} | select status)
{
	#net start ($servicename) || timeout 3
	Start-Service -Name ($servicename)
}

# A function for processing
function ProcessWifiSSID
{
	# If not exist input paramaters
	if ($ssid.length -lt  1)
	{
		# Read user input
		$ssid = Read-Host -Prompt $msg_enter_ssid
		$password = Read-Host -Prompt $msg_enter_pass

		if ($ssid.length -lt  1)
		{
			Write-Host ($msg_error_nossid)
			pause
			exit
		}
	}

	# Set profile contents
	$ssid_hex = ($ssid.ToCharArray() | foreach-object {'{0:X}' -f ([int]$_)}) -join''
	
	# This XML profile format is the standard format used by Windows.
	$profilexml = "<?xml version=""1.0""?>
	<WLANProfile xmlns=""http://www.microsoft.com/networking/WLAN/profile/v1"">
		<name>" + ($ssid) + "</name>
		<SSIDConfig>
			<SSID>
				<hex>" + ($ssid_hex) + "</hex>
				<name>" + ($ssid) + "</name>
			</SSID>
			<nonBroadcast>true</nonBroadcast>
		</SSIDConfig>
		<connectionType>ESS</connectionType>
		<connectionMode>auto</connectionMode>
		<MSM>
			<security>
				<authEncryption>
					<authentication>WPA2PSK</authentication>
					<encryption>AES</encryption>
					<useOneX>false</useOneX>
				</authEncryption>
				<sharedKey>
					<keyType>passPhrase</keyType>
					<protected>false</protected>
					<keyMaterial>" + ($password) + "</keyMaterial>
				</sharedKey>
			</security>
		</MSM>
	</WLANProfile>"

	# Write temporary file from XML contents
	($profilexml) > ($profilefile)

	# Add defined profile to the Windows Network
	Write-Host (netsh wlan add profile filename=($profilefile))

	# Try to connect the added profile
	$resultconnection = netsh wlan connect name=($ssid)
	Write-Host ($resultconnection)
	
	if ($resultconnection.length -ge 17) { return $result_ng } else { return $result_ok }
}

# Call a function at first
$result_conn = ProcessWifiSSID

# Control statements
while ($confirm -eq $enter_y)
{
	if ($result_conn -eq $result_ng)
	{
		$confirm = Read-Host ($msg_tryagain)
		
		if ($confirm -eq $enter_y)
		{
			# Retry the function call
			$ssid = ""
			$result_conn = ProcessWifiSSID
		}
	}
	else
	{
		$confirm = $enter_n
	}
}

# Remove temporary file
if (Test-Path $profilefile)
{
	#Write-Host Remove-Item ($profilefile) -Force | Out-String
	Remove-Item ($profilefile) -Force
}

# End of script
