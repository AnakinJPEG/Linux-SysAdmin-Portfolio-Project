# Linux-SysAdmin-Portfolio-Project
A single-server Linux deployment, built by hand — hardened, served, monitored, and backed up.  This repository documents the complete provisioning of lab-web-01, a Linode VPS running Ubuntu 22.04 LTS. Every step was performed manually, verified, and recorded. There is no Ansible, no Terraform, no shortcuts — just the terminal and the documentation.

lab-web-01/
├── README.md                    ← you are here
├── docs/
│   ├── hardening-book.txt       ← Phase 1 runbook
│   ├── nginx_setup.txt          ← Phase 2 runbook
│   ├── mysql_setup.txt          ← Phase 3 runbook
│   ├── prometheus-setup.txt     ← Phase 4 runbook
│   └── grafana-setup.txt        ← Phase 4 runbook
├── config/
│   ├── nginx.conf               ← global Nginx config
│   ├── website_config.conf      ← site vhost config
│   └── prometheus.yaml          ← Prometheus scrape config
├── sql/
│   └── example-dump.sql         ← sample database with FK relationship
├── www/
│   ├── index.html
│   └── about.html
└── notes/
    └── PrometheusQL.txt         ← useful PromQL queries


                     ┌─────────────────────────────────────┐
                    │            lab-web-01               │
                    │       Ubuntu 22.04 LTS (Linode)     │
                    │                                     │
   ┌────────┐       │  ┌─────────┐    ┌──────────────┐    │
   │ Client │──80──►│  │  Nginx  │    │    MySQL     │    │
   │Browser │──443─►│  │ :80/:443│    │  :3306       │    │
   └────────┘       │  └────┬────┘    │  (localhost) │    │
                    │       │         └──────┬───────┘    │
                    │       │                │            │
                    │  ┌────▼────────────────▼────┐       │
                    │  │     Prometheus :9090     │       │
                    │  │  + node_exporter :9100   │       │
                    │  │  + mysqld_exporter :9104 │       │
                    │  └────────────┬─────────────┘       │
                    │               │                     │
                    │  ┌────────────▼─────────────┐       │
                    │  │     Grafana :3000        │       │
                    │  └──────────────────────────┘       │
                    │                                     │
                    │  UFW: default-deny inbound          │
                    │  SSH: key-only, IP-allowlisted      │
                    └─────────────────────────────────────┘
