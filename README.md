


# DevOps Internship Assignment: Terraform VPC Automation

This repository automates the deployment of a secure, multi-tier AI inference architecture on AWS using **Terraform**. The architecture isolates worker nodes in a private subnet, with inference requests routed through a public-facing API Gateway.

---

## Architecture Diagram

<img width="1536" height="1024" alt="ChatGPT Image May 23, 2026, 04_21_09 PM" src="https://github.com/user-attachments/assets/a92cf609-b79a-4bbd-a0c9-4c05e5eaa42f" />


---

## API Testing

To test the end-to-end inference chain, use the following `curl` command:

**Request:**

```bash
curl -X POST [http://54.224.198.136:3111/math/add-two-numbers](http://54.224.198.136:3111/math/add-two-numbers) \
     -H 'Content-Type: application/json' \
     -d '{"a": 100, "b": 200}'

```

**Response:**

```json
{
  "result": 300
}

```

---

## Reproducibility: Redeploying the Stack

To deploy this infrastructure from scratch in a new AWS account:

1. **Prerequisites:** Install [Terraform](https://www.terraform.io/) and the [AWS CLI](https://aws.amazon.com/cli/).
2. **Authentication:** Configure your AWS credentials via the terminal:
```bash
aws configure

```


3. **Initialize:** Navigate to the project root and run:
```bash
terraform init

```


4. **Deploy:** Execute the deployment:
```bash
terraform apply

```


*(Review the plan and type `yes` to proceed).*

---

## Strategic Write-up

### Production Hardening & Observability

Before moving this architecture into a production environment, I would focus on three pillars: **reliability, security, and observability**. To ensure high availability, I would replace the single API Gateway instance with an **Application Load Balancer (ALB)** distributed across multiple Availability Zones, which prevents single points of failure. From a security perspective, I would shift from using static credentials to **IAM Roles** for EC2 instances to strictly enforce the principle of least privilege. Furthermore, I would adopt a **GitOps** approach using **ArgoCD** to maintain the cluster state, ensuring that the infrastructure configuration in GitHub is always synchronized with the live environment. To achieve full observability, I would integrate **Prometheus** to collect system and application metrics, and connect it to **Grafana** to provide real-time, actionable dashboards that allow the team to monitor health and respond to incidents immediately.

### Scaling for 100x Larger Models

If the workload requirements increased by 100x, the current virtual machine-based approach would become inefficient and difficult to manage. To scale effectively, I would transition the worker infrastructure to a managed Kubernetes service, such as **Amazon EKS**. Kubernetes is essential here because it supports **Horizontal Pod Autoscaling (HPA)**, which automatically spins up additional worker pods when traffic spikes, ensuring the system remains responsive without manual intervention. Beyond scaling the number of workers, I would also leverage **GPU-optimized node types** within the cluster to handle the significant computational demands of larger AI models, ensuring that the infrastructure is performance-tuned for AI-driven inference tasks.

---
## Deployment Evidence

This section documents the end-to-end infrastructure deployment process.

### 1. Terraform Initialization & Setup
| Action | Screenshot |
| :--- | :--- |
| **Installing Terraform** | <img src="https://github.com/user-attachments/assets/9cc5ed55-7c7f-46bd-b571-853c16c45410" width="300" /> |
| **Verification & Version Check** | <img src="https://github.com/user-attachments/assets/e6c9421c-f309-4a31-a3dc-f6cc24f15310" width="300" /> |
| **Terraform Init** | <img src="https://github.com/user-attachments/assets/02e989dc-fb3c-4717-bd57-e6dd9df8e059" width="300" /> |
| **Initialization Success** | <img src="https://github.com/user-attachments/assets/5d73e103-1ba4-4de1-92b9-1a7801a3aaf8" width="300" /> |

<br>

### 2. Infrastructure Deployment & Configuration
| Action | Screenshot |
| :--- | :--- |
| **Terraform Apply (Success)** | <img src="https://github.com/user-attachments/assets/584707e0-dfdb-4657-b3e9-4c34034b47ec" width="300" /> |
| **Security Group Rules** | <img src="https://github.com/user-attachments/assets/7ad893ec-aa7a-43fb-b58f-905af0cfa240" width="300" /> |
| **EC2 Instance Overview** | <img src="https://github.com/user-attachments/assets/055c070d-99fe-4de4-959e-02bd6bd54e7c" width="300" /> |

---
