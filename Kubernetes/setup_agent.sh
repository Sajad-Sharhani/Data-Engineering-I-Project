#!/usr/bin/env bash
curl https://releases.rancher.com/install-docker/20.10.sh | sh
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.2.129:6443 K3S_TOKEN=K107ab62d2cfcb691dcc6a84debf8f904a0b66acfddb03c997bd1699c2d0ecc5786::server:8c5fee8a7bec2b9fa03b441fa3aa4ff9 sh -s - --docker












