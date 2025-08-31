# 🕒 Timesheet Management System - Z_Nxt_Consulting_Servisecs  

## 📌 Overview  
This project is developed for **Z_Nxt_Consulting_Servisecs** to automate and streamline the **Timesheet & Payroll Management** process.  
The system integrates **SSIS, SQL Server (SSMS), and SSRS** to provide a complete solution for:  
- Employee Timesheet Tracking  
- Leave Management (EL/CL)  
- Salary Slip Generation  

---

## 🚀 Key Features  
- **Automated Data Load**: Excel-based timesheet data is automatically loaded into SQL Server using **SSIS**.  
- **Leave Management**: Stored Procedures process and update employee leave data (Casual Leave, Earned Leave, etc.).  
- **Payroll & Employee Details**: Consolidates employee salary, company, and client details for payroll processing.  
- **SSRS Reporting**: Generates professional salary slips for all employees.  

---

## 📊 Data Flow Structure  

The following diagram explains the end-to-end data flow:  

![Timesheet Data Flow](timesheet_data_flow.png)  

### 🔄 Flow Explanation
1. **Excel Timesheet File** → Source of employee work & attendance data.  
2. **SSIS Package** → Extracts, Transforms, and Loads (ETL) data into SQL Server staging.  
3. **Timesheet Table** → Stores validated timesheet data.  
4. **Stored Procedure (sp_UpsertLeaveMaster)** → Updates leave details into **Leave_Master Table**.  
5. **Stored Procedure (sp_GetPayslipData)** → Prepares salary, leave, and employee details.  
6. **SSRS Report (PaySlip_Report.rdl)** → Generates formatted Salary Slip.  
7. **Employee Salary Slip (PDF/Excel)** → Final output distributed to employees.  

---

## 🛠️ Tech Stack  
- **ETL Tool**: SQL Server Integration Services (**SSIS**)  
- **Database**: SQL Server Management Studio (**SSMS**)  
- **Reporting Tool**: SQL Server Reporting Services (**SSRS**)  
- **Languages**: T-SQL (Stored Procedures, Queries)  
- **Data Source**: Excel Timesheet Files  

---

## 📂 Project Structure  
├── SSIS_Packages/
│ └── HRMS_dataLoad.dtsx
├── SQL_Scripts/
│ ├── Create_Tables.sql
│ ├── sp_UpsertLeaveMaster.sql
│ └── sp_GetPayslipData.sql
├── SSRS_Reports/
│ └── PaySlip_Report.rdl
├── Sample_Data/
│ └── Timesheet_Sample.xlsx
├── timesheet_data_flow.png
└── README.md    


---

## 📜 How It Works  
1. HR uploads **Excel Timesheet File**.  
2. **SSIS Package** runs to insert data into **Timesheet Table**.  
3. Stored Procedure updates **Leave_Master Table**.  
4. Payroll procedure generates employee salary and leave details.  
5. **SSRS Report** produces **Salary Slip** for each employee.  

---

## 📈 Output (Example: Salary Slip)  
- Employee Personal Details  
- Company & Client Information  
- Leave Balance (EL/CL)  
- Salary Breakdown (Basic, Allowances, Deductions, Net Pay)  

---

## 👨‍💻 Author  
**Nirbhay Kumar**  
📧 [LinkedIn](https://www.linkedin.com/in/nirbhay-kumar-32b947262/) | 🌐 GitHub: [nirbhay266](https://github.com/nirbhay266)  

---
