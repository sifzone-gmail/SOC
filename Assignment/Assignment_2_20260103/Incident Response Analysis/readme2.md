## 🛡️ The 6 Steps of Incident Response

<img src="675a218c9c4b100f5a0751c1_32040_76bcb10c6afe431f8a183c4f310e838f_1683843430.avif">

*src: https://www.securitymetrics.com/blog/6-phases-incident-response-plan*

**Preparation**: Building the team, defining policies, and setting up tools before a breach happens. This includes tabletop exercises like the one we just did.

**Identification (Detection)**: Determining if you've been breached. In your scenario, this was triggered by the vendor's call regarding missing payments.

**Containment**: Stopping the "bleeding." This involves short-term fixes (locking compromised email accounts) and long-term fixes (isolating affected systems).

**Eradication**: Removing the root cause. This means deleting malicious mail rules, wiping infected machines, and resetting all credentials.

**Recovery**: Bringing systems back to normal. This involves restoring from backups and, crucially in your case, working with the bank to attempt a funds recall.

**Lessons Learned**: The "Post-Mortem." Analyzing what went wrong and updating the Preparation phase to ensure it doesn't happen again.

<hr>

#### 📝 Incident Report: Project "Ghost Invoice"

**Report ID**: IR-2026-02-18-BEC
**Severity**: 🔴 CRITICAL Status: Under Investigation
**Affected Departments**: Finance, Sales, IT

<hr>

#### 1. Executive Summary

On February 18, 2026, Company A identified a Business Email Compromise (BEC) incident resulting in the redirection of two high-value payments to fraudulent bank accounts. The breach was discovered 6 days post-incident. Initial findings suggest an attacker gained unauthorized access to a Sales department mailbox to manipulate invoice data.

<hr>

#### 2. Incident Description & Timeline

* **Incident Type**: Financial Redirection / Business Email Compromise (BEC).
* **Initial Compromise (Estimated)**: 6 days ago.
* **Detection Date**: February 18, 2026.
* **Discovery Method**: External vendor notification regarding unpaid invoices.

|Time | Event |
|-----|-------|
|Day -6 | Attacker gains access to sales-rep@company-a.com (likely via session hijacking). |
|Day -5 |Attacker creates a mail rule to hide emails from vendor-b.com. |
|Day -5 |"Attacker intercepts a legitimate invoice, modifies the IBAN, and forwards it to Finance." |
|Day -3 | Finance processes two payments totaling [Value] to the fraudulent account. |
|Today | "Vendor calls to inquire about payment; Finance confirms payment was ""sent.""" |
|Today +1hr | IT confirms unauthorized login and malicious mail rules in the Sales mailbox.|

<hr>

#### 3. Impact Assessment

* **Financial Impact**: Loss of two major vendor payments. Funds have likely been moved from the recipient account, making recovery difficult.

* **Data Impact**: Unknown volume of Sales and Finance emails synchronized to an external attacker-controlled device.

* **Reputational Impact**: Damage to vendor relationship and potential disclosure requirements if PII (Personally Identifiable Information) was contained in the emails.

<hr>

#### 4. Containment & Eradication Steps

* **Account Isolation**: Immediately disabled sales-rep@company-a.com and finance-admin@company-a.com accounts.

* **Session Revocation**: Terminated all active Microsoft 365 / Google Workspace sessions globally for affected users.

* **Rule Deletion**: Identified and removed "MoveToFolder" and "MarkAsRead" rules created by the attacker.

* **Credential Reset**: Enforced a mandatory password reset and re-enrollment of MFA for all users in the Finance and Sales departments.

<hr>

#### 5. Remediation & Recovery Plan

* **Bank Liaison**: Immediate formal request for "Fraudulent Transfer Recall" to the originating bank.

* **External Notification**: Contact local law enforcement (IC3/Cyber Task Force) and the company’s cyber insurance provider.

* **Forensic Analysis**: Conduct a full audit of all Finance/Sales mailboxes for the past 30 days to ensure no other "ghost" invoices are in circulation.

* **Out-of-Band Verification**: Implement a new policy requiring a verbal phone confirmation for any change to vendor banking details moving forward.

<hr>

#### 6. Sign-off

Incident Lead: [Your Name/Lead IR]

Date: February 18, 2026