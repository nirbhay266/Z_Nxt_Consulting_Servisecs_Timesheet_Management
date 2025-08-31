# Z_Nxt Consulting Services – Timesheet & Payroll Management System

A complete **Timesheet and Payroll Management Solution** for **Z_Nxt Consulting Services**.  
This system automates the flow from **employee timesheet data** to **leave management** and finally to **salary slip generation**.

Built using **SSIS (ETL)**, **SQL Server (Database + Stored Procedures)**, and **SSRS (Reporting)**.

---

## 📖 Overview

Managing employee timesheets, leave records, and payroll manually is inefficient and error-prone.  
This project provides an automated pipeline:

- Timesheet data from Excel → SQL Server using **SSIS**
- Leave data automatically recorded in **Leave_Master**
- Payroll data combined with employee & company details
- **SSRS report** generates professional **Pay Slips** in PDF format

---

## 🏗️ System Architecture

```mermaid
flowchart TD
    A[Excel Timesheet File] -->|SSIS Package: HRMS_dataLoad.dtsx| B[Staging Table: Timesheet_Staging]
    B -->|Validation & Merge| C[Timesheet Table]
    C -->|SP: sp_UpsertLeaveMaster| D[Leave_Master Table]
    C -->|SP: sp_GetPayslipData| E[Salary + Employee + Company Data]
    D --> E
    E -->|Dataset| F[SSRS Report: PaySlip_Report.rdl]
    F --> G[Employee Salary Slip (PDF)]
