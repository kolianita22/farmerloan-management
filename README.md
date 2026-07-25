# 🏛️ Kisan Rin Yojana (PM-KRY) — Farmer Crop Loan Management System

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/kolianita22/farmerloan-management)
[![Java 17](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2+-green.svg)](https://spring.io/projects/spring-boot)
[![Docker Support](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-Government--Open-informational.svg)]()

> A modern **National e-Governance Portal** designed for transparent, fast, and secure crop loan application processing, revenue land record authentication by local Talathi officers, and credit assessment by Public Sector Banks.

---

## 🌟 Key Features

### 🚜 1. Farmer Portal
- **OTP Mobile Authentication**: Secure 6-digit OTP verification via SMS gateway (Fast2SMS REST API integration).
- **Subsidized Crop Loan Application**: Simplified multi-step form for crop details (Wheat, Rice, Cotton, Sugarcane, Soybean), agricultural season (Kharif, Rabi, Zaid), land size, and income.
- **Digital Document Uploads**: Upload 7/12 land records, Aadhaar cards, and bank passbooks with path-traversal security protection.
- **Real-Time Status Tracker**: 4-stage visual progress pipeline (`Submitted` → `Talathi Verified` → `Bank Sanctioned`).
- **Interactive Notification Bell**: Real-time alerts for verification updates, approvals, or rejection remarks.

### 📜 2. Revenue Officer (Talathi) Portal
- **Land Verification Queue**: Circle-wise listing of pending crop loan applications.
- **Document Inspection**: One-click download and preview of submitted 7/12 extracts and Aadhaar documents.
- **Action Controls**: Approve verified land ownership or reject invalid applications with obligatory remark reasons.
- **Official Print Form**: Generate standardized, printable Government Inspection Forms (`@media print` supported).

### 🏦 3. Bank Officer Credit Gateway
- **Credit Assessment Dashboard**: View revenue-verified loan applications awaiting credit sanction.
- **Automated Credit Scoring**: Evaluates creditworthiness score and calculates eligible loan amounts based on land size and household income.
- **Sanctioning Workflow**: Approve credit disbursement or decline applications with audit trails.

---

## 🛠️ Technology Stack

| Component | Technology |
|---|---|
| **Backend Framework** | Java 17, Spring Boot 4.0.5 |
| **Persistence & Database** | Spring Data JPA, Hibernate, MySQL 8.0 |
| **Frontend Templates** | Thymeleaf, HTML5, Vanilla JavaScript |
| **Design System** | Custom Government e-Governance CSS (`gov-portal.css`), Bootstrap 5.3, Bootstrap Icons |
| **Containerization** | Docker, Docker Compose (Multi-stage build) |
| **SMS Gateway** | Fast2SMS REST API |

---

## 🎨 Design System & Aesthetics

The application adheres to the official **Indian Government e-Governance Portal Guidelines**:
- **Palette**:
  - 🟦 **Government Blue**: `#0B5ED7`, `#084298`
  - 🟧 **India Saffron**: `#FF9933`
  - 🟩 **India Green**: `#138808`
  - ⬜ **Background & Cards**: `#F5F7FA`, `#FFFFFF`
- **Tricolour Accent Header**: Rendered across all portal pages.
- **National Emblem & Title**: Ministry branding (*Ministry of Agriculture & Farmers Welfare*).

---

## 📁 Repository Structure

```text
farmerloan-management/
├── Dockerfile                   # Multi-stage Docker build config
├── docker-compose.yml           # Orchestration for App & MySQL containers
├── pom.xml                      # Maven dependencies configuration
├── README.md                    # Project documentation
└── src/
    └── main/
        ├── java/com/farmer/Farmerloan/
        │   ├── controller/      # AuthController, LoanController, TalathiController, BankController
        │   ├── model/           # Farmer, Loan, Notification entities
        │   ├── repository/      # JPA Repositories
        │   └── services/        # Business logic services & SMS gateway
        └── resources/
            ├── application.properties
            ├── static/css/      # Custom gov-portal.css design system
            └── templates/       # 13 Thymeleaf HTML portal views
```

---

## 🚀 Quick Start Guide

### Prerequisites
- **JDK 17** or higher
- **Maven 3.8+**
- **MySQL 8.0** (or Docker)

### Option A: Run via Docker Compose (Recommended)

1. Clone the repository:
   ```bash
   git clone https://github.com/kolianita22/farmerloan-management.git
   cd farmerloan-management
   ```

2. Launch application and MySQL database containers:
   ```bash
   docker compose up --build -d
   ```

3. Open your browser and navigate to:
   ```text
   http://localhost:8081
   ```

---

### Option B: Run Locally with Maven

1. Configure database connection in `src/main/resources/application.properties` or environment variables:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/farmerloan?createDatabaseIfNotExist=true
   spring.datasource.username=root
   spring.datasource.password=your_mysql_password
   ```

2. Compile and run:
   ```bash
   ./mvnw clean spring-boot:run
   ```

---

## 🔐 Credentials & Roles for Testing

| Portal | Route | Default Credentials |
|---|---|---|
| **Farmer Login** | `/login` | Mobile OTP Login (e.g. Mobile: `9876543210`) |
| **Talathi Portal** | `/talathi-login` | Username: `talathi` \| Password: `1234` |
| **Bank Portal** | `/bank-login` | Username: `bank` \| Password: `1234` |

---

## ⚙️ Environment Variables

| Variable | Description | Default |
|---|---|---|
| `SPRING_DATASOURCE_URL` | MySQL JDBC connection string | `jdbc:mysql://localhost:3306/farmerloan` |
| `SPRING_DATASOURCE_USERNAME` | MySQL database username | `root` |
| `SPRING_DATASOURCE_PASSWORD` | MySQL database password | `root` |
| `SMS_API_KEY` | Fast2SMS API Key for real SMS | *(Optional demo mode)* |

---

## 📄 License & Attribution

Content owned and maintained by the **Ministry of Agriculture & Farmers Welfare, Government of India**. Developed as an open e-Governance solution for agricultural credit accessibility.
