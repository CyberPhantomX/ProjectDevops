#!/bin/bash
 sudo apt-get install -y apt-transport-https software-properties-common 
 sudo mkdir -p /etc/apt/keyrings/

 wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

 echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

 sudo apt-get update
 sudo apt-get -y install grafana
 sudo systemctl enable grafana-server
 sudo systemctl start grafana-server
