3-Tier Application

![image alt](https://github.com/saba-codes/ILZ-todo-app/blob/e2a8bb2c9be7c2a71de4d44d6d7ea7e6ba78be4a/3-tier%20Application.jpeg)

# ILZ Todo App

A **3-tier application deployed on Microsoft Azure**, designed with security, scalability, and private network connectivity in mind.

## 🏗️ High-Level Architecture

![High-Level Architecture](docs/high-level-architecture.png)

### Architecture

The application is divided into three tiers:

* **Frontend Tier** – Frontend VM behind **Azure Application Gateway + WAF** for secure incoming traffic.
* **Backend Tier** – Backend VM accessed through an **Internal Load Balancer** for internal traffic distribution.
* **Database Tier** – Managed database accessed privately without public internet exposure.

### 🔐 Security

* **NSGs** control inbound and outbound network traffic.
* **WAF** protects against common web attacks.
* **Azure Key Vault** securely stores application secrets and credentials.
* **Private Endpoints** provide private connectivity to services such as the database and Key Vault.
* Frontend and backend resources are isolated using separate subnets.

### ☁️ Azure Services

* Azure Virtual Network
* Application Gateway + WAF
* Internal Load Balancer
* Virtual Machines
* Managed Database
* Azure Key Vault
* Private Endpoints
* Network Security Groups

### 🛠️ Infrastructure

The Azure infrastructure is provisioned using **Terraform** and deployed through an **Azure DevOps pipeline**.

```text
Internet
   ↓
Application Gateway + WAF
   ↓
Frontend VM
   ↓
Internal Load Balancer
   ↓
Backend VM
   ↓
Database
```

## 🎯 Project Goal

To demonstrate a **secure and scalable 3-tier Azure architecture** using Infrastructure as Code, network segmentation, private connectivity, and centralized secret management.

