# Terraform 3-Tier AWS Architecture

This project demonstrates a fully automated **3-tier architecture** using **Terraform** on **AWS**. It provisions a **VPC**, **EC2 instances**, **RDS** (MySQL) database, and an **Application Load Balancer (ALB)**, allowing you to deploy a scalable, secure, and highly-available web application.

## Architecture Overview

The architecture consists of three layers:

1. **Networking Layer (VPC)**: A Virtual Private Cloud (VPC) with public and private subnets for secure and isolated networking.
2. **Application Layer (EC2)**: EC2 instances running a simple web server (Nginx or app).
3. **Database Layer (RDS)**: A managed MySQL database (RDS) for storing application data.
4. **Load Balancer (ALB)**: An Application Load Balancer (ALB) distributes HTTP traffic across EC2 instances.

## Architecture Diagram

![Architecture Diagram](https://via.placeholder.com/500x300.png)  
*(You can replace this with a real architecture diagram)*

---

## Features

- **Scalable**: EC2 instances can be scaled easily with ALB to handle high traffic.
- **Secure**: Private subnets for RDS, and security groups ensure only allowed traffic can access resources.
- **Modular**: Infrastructure components (VPC, EC2, RDS, ALB) are managed as independent Terraform modules.
- **Infrastructure as Code**: Entire infrastructure is provisioned and managed using Terraform.

---

## Prerequisites

To get started with this project, you will need:

- **AWS Account**: Set up an AWS account at https://aws.amazon.com/.
- **Terraform**: Version 1.0 or later (install via https://learn.hashicorp.com/tutorials/terraform/install-cli).
- **AWS CLI**: Set up your AWS credentials using `aws configure`.

---

## Getting Started

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/kalpit/terraform-3tier.git
cd terraform-3tier
