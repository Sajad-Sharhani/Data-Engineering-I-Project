#!/usr/bin/env bash
curl https://releases.rancher.com/install-docker/20.10.sh | sh
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.2.129:6443 K3S_TOKEN=K10912651b0efe2e80e060d0346d0f2ec6a20539b08aff883422aa62daf497829bb::server:a4176ae0b1dd7085becd76ac9c2925a1 sh -s - --docker












