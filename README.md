# 🚀 LightCloud – Lightweight Self‑Hosted Cloud Platform

**LightCloud** is a lightweight, self‑hosted alternative to Vercel / Render that turns your personal laptops into a scalable cloud platform. It supports static sites, serverless functions, and multi‑node distributed deployments with automatic failover – all running on your own hardware.

> Built with **Java 17+**, **Netty**, **SQLite**, and **ngrok/Cloudflare Tunnel**.  
> AI‑assisted development using **OpenCode** and **Claude**.

---

## ✨ Features

### 🟢 Beginner Server
- Deploy static websites (HTML/CSS/JS) from a local folder.
- Automatic public URL via **ngrok** or **Cloudflare Tunnel**.
- CLI and web upload.

### 🟡 Standard Server
- Upload **frontend** (static) + **backend** (Node.js/Python functions) separately.
- Built‑in reverse proxy routes `/api/*` to backend, everything else to frontend.
- Single public URL for full‑stack apps.

### 🔴 Distributed Server
- Connect up to **3 external laptops** as worker nodes.
- Deploy the same app to all workers.
- **Load balancer** distributes traffic among healthy workers.
- **Health checks** and **failover** – if a worker dies, traffic shifts automatically.
- **Kill switch** to simulate failure and demonstrate resilience.
- Works across a local network (WiFi/Ethernet).

### 🧩 General Features
- **Deployment Management**: Stop, restart, or delete deployments from a web dashboard.
- **Active/Inactive Status**: Server cards show real‑time deployment status.
- **Persistence**: Deployment metadata stored in SQLite – survives reboots.
- **Cross‑Platform**: Runs on Windows, macOS, Linux.

---

## 🏗️ Architecture Overview
┌─────────────────────────────────────────────────────────────┐
│ Control Node (Main Laptop) │
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐ │
│ │ UI (HTML) │ │ LoadBalancer│ │ HealthChecker │ │
│ │ /distributed│ │ (port 8090) │ │ (scheduled thread) │ │
│ └──────┬──────┘ └──────┬──────┘ └──────────┬──────────┘ │
│ │ │ │ │
│ └────────────────┼─────────────────────┘ │
│ │ │
│ ┌─────▼─────┐ │
│ │ Worker │ │
│ │ Registry │ │
│ └─────┬─────┘ │
└──────────────────────────┼──────────────────────────────────┘
│ HTTP
┌─────────────────┼─────────────────┐
│ │ │
┌────▼────┐ ┌────▼────┐ ┌────▼────┐
│ Worker1 │ │ Worker2 │ │ Worker3 │
│ Agent │ │ Agent │ │ Agent │
└─────────┘ └─────────┘ └─────────┘
- **Control Node** – Main application (dashboard, API, orchestrator, load balancer).
- **Worker Agent** – Lightweight Java process running on each laptop; receives deployments, runs sites, reports health.
- **Tunnel** – ngrok or Cloudflare Tunnel exposes the load balancer to the internet.

---

## 📦 Getting Started

### Prerequisites
- **Java 17+** (JDK)
- **Maven** (for building)
- **ngrok** or **cloudflared** (for public URLs) – [download ngrok](https://ngrok.com/download) or [cloudflared](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation)

