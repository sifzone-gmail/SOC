# APT5 Ransomware Summary
*src: https://attack.mitre.org/groups/G1023/*

## Overview
APT5 (also known as MANDIANT'S APT5, Multigrain, or Cycle Panda) is a Chinese state-sponsored advanced persistent threat group that primarily targets the telecommunications, energy, and satellite communications sectors. While traditionally known for espionage activities, APT5 has been observed deploying ransomware as part of their attack campaigns.

## Key Characteristics

### Threat Actor Information
- **Attribution**: Chinese state-sponsored
- **First Observed**: Early 2000s
- **Primary Targets**: Telecommunications, Energy, Satellite, Defense Industrial Base


## Techniques Used

| ID | |  Technique Name | Sub Category |
|----|--|----------------|--------------|
| T1098 | 007   | Account Manipulation              | Additional Local or Domain Groups |
| T1583 | 003   | Acquire Infrastructure            | Virtual Private Server |
|       | 005   |                                   | Botnet |
| T1560 | 001   | Archive Collected Data            | Archive via Utility | 
| T1059 | 001   | Command and Scripting Interpreter | PowerShell | 
|       | 003   |                                   | Windows Command Shell | 
| T1554 |       | Compromise Host Software Binary   | |
| T1136 | 001   | Create Account                    | Local Account | 
| T1074 | 001   |	Data Staged                       | Local Data Staging |
| T1685 |   	  | Disable or Modify Tools | |
| T1190 | 	    | Exploit Public-Facing Application | |
| T1083 |       |	File and Directory Discovery | |
| T1070 |	      | Indicator Removal | |
|       | .003  | |	Clear Command History |
|       | .004  | |	File Deletion |
|       | .006  | |	Timestomp |
| T1056 | .001 	| Input Capture | Keylogging |
| T1654 |       |	Log Enumeration ||
| T1036 |	.005  |	Masquerading | Match Legitimate Resource Name or Location |
| T1588 |	.002  |	Obtain Capabilities | Tool |
| T1003 |	.001 	| OS Credential Dumping | LSASS Memory |
|       | .002 	| OS Credential Dumping | Security Account Manager |
| T1057 |	      | Process Discovery | |
| T1055 |	      | Process Injection ||
| T1090 |	.003 	| Proxy |  Multi-hop Proxy
| T1021 | .001 	| Remote Services | Remote Desktop Protocol  |
|       | .004 	| Remote Services | SSH |
| T1053 |	.003 	| Scheduled Task/Job | Cron |
| T1505 |	.003 	| Server Software Component | Web Shell |
| T1049 |	      | System Network Connections Discovery |
| T1078 |	.002 	| Valid Accounts | Domain Accounts |
|       | .004 	| Valid Accounts | Cloud Accounts |



## MITRE ATT&CK Framework Tactics & Techniques

#### Resource Development (TA0042)
- **T1583**: Acquire Infrastructure
  - Botnet
  - Virtual Private Server
  - Tool

#### Initial Access (TA0001)
- **T1190**: Exploit Public-Facing Application 
- **T1075**: Valid Accounts
  - Cloud Accounts
  - Domain Accounts

#### Execution (TA0002)
- **T1059**: Command and Scripting Interpreter
  - PowerShell
  - Windows Command Shell
- **T1053**: Scheduled Task/Job
  - Cron

#### Persistence (TA0003)
- **T1098**: Account Manipulation
  - Additional Local or Domain Groups
- **T1554**: Compromise Host Software Binary
- **T1136** : Create Account
  - Local Account
- **T1053**: Scheduled Task/Job
  - Cron
- **T1505**: Server Software Component
  - Web Shell
- **T1075**: Valid Accounts
  - Cloud Accounts
  - Domain Accounts


#### Privilege Escalation (TA0004)
- **T1098**: Account Manipulation
  - Additional Local or Domain Groups
- **T1053**: Scheduled Task/Job
  - Cron
- **T1075**: Valid Accounts
  - Cloud Accounts
  - Domain Accounts

#### Stealth (TA0005)
- **T1070**: Indicator Removal
  - Clear Command History
  - File Deletion
  - timestomp
- **T036**: Masquerading 
  - Match Legitimate Resource Name or Location 
- **T1055**: Process Injection
- **T1075**: Valid Accounts
  - Cloud Accounts
  - Domain Accounts

#### Defense Impairment
- **T1685**: Disable or Modify Tools

#### Credential Access (TA0006)
- **T1056**: Input Capture
  - Keylogging
- **T1003**: OS Credential Dumping
  - LSASS Memory
  - Security Account Manager

#### Discovery (TA0007)
- **T1083**: File and Directory Discovery
- **T1654**: Log Enumeration
- **T1057**: Process Discovery
- **T1049**: System Network Connections Discovery

#### Lateral Movement (TA0008)
- **T1021**: Remote Services
  - Remote Desktop Protocol
  - SSH

#### Collection (TA0009)
- **T1560**: Archive Collected Data
  - Archive via Utility
- **T1074**: Local Data Staging
- **T1056**: Keylogging

#### Command and Control (TA0011)
- **T1090**: Proxy
  - Multihop Proxy



## References
- MITRE ATT&CK Framework: https://attack.mitre.org/
- APT5 Profile: https://attack.mitre.org/groups/G0040/
- Mandiant APT5 Research
- CISA APT Advisories
