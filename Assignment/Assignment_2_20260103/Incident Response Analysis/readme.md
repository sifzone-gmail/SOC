### 🛡️ Tabletop Scenario: Operation "Ghost Invoice"

**Scenario Summary**:

The Trigger: A vendor calls Sales asking why their last two invoices haven't been paid. Finance records show the payments were sent 5 days ago.

The Reality: An attacker compromised a Sales/Finance email account, intercepted the real invoices, modified the banking details (IBAN/Swift), and forwarded the fake versions to Finance.

The Stakes: Two major payments are gone. It is day 6. A third payment is scheduled for tomorrow.


#### 👥 Stakeholder Roles & Responsibilities

|Department,Primary | Responsibility in this Scenario |
|-------------------|---------------------------------|
|Finance | "Payment verification, bank liaison, and stopping pending |transfers." |
|Sales |"Client/Vendor communication and verifying ""source of truth"" for invoices."|
|IT/Security |"Digital forensics, account containment, and log analysis (M365/Google Workspace)."|
|Legal/PR |Regulatory reporting (if PII was lost) and external communications.|


#### 🚩 Phase 1: Immediate Identification & Containment

**Discussion Question**: It’s 4:00 PM on a Friday. Who makes the call to stop the "tomorrow" payment?

* **IT Action**: Immediately lock the accounts of the involved users in Sales and Finance.

* **Forensic Check**: Look for "Mail Forwarding Rules" or "Hidden Folders." (Attackers often create rules to move vendor emails to the "RSS Feeds" or "Deleted" folder so the real user never sees the vendor's "Where is my money?" emails).

* **MFA Audit**: Was Multi-Factor Authentication bypassed? Check for "Session Hijacking" or "Push Fatigue."

#### 🕵️ Phase 2: Investigation (The "Deep Dive")

**Discussion Question**: How do we determine if the compromise was on our side or the vendor's side?

* **Analyze the Headers**: IT must check the DKIM/SPF/DMARC of the "fake" invoice email. Did it come from our server, or a look-alike domain (e.g., company-a.com vs cornpany-a.com)?

* **Lateral Movement**: Did the attacker use the Finance account to send phishing links to other employees?

* **Data Exfiltration**: Did the attacker download the entire "Payments 2025" SharePoint folder?


#### 🕵️ Phase 2: Investigation (The "Deep Dive")

**Discussion Question**: How do we determine if the compromise was on our side or the vendor's side?

* **Analyze the Headers**: IT must check the DKIM/SPF/DMARC of the "fake" invoice email. Did it come from our server, or a look-alike domain (e.g., company-a.com vs cornpany-a.com)?

* **Lateral Movement**: Did the attacker use the Finance account to send phishing links to other employees?

* **Data Exfiltration**: Did the attacker download the entire "Payments 2025" SharePoint folder?


#### 💡 Phase 4: Eradication & Lessons Learned

**Discussion Question**: What process failed? Was it a technical failure or a human process failure?

* **Process Change**: Implement a "Out-of-Band" verification policy. Any change to banking details must be verified via a phone call to a known-good number, not via email.

* **Technical Hardening**: Disable legacy authentication and enforce "Phishing-Resistant MFA" (like FIDO2 keys).

* **User Training**: Conduct a targeted phishing simulation based on this exact incident.