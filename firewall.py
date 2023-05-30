import requests
import csv
import subprocess

# Fetch the IP blocklist
response = requests.get("https://feodotracker.abuse.ch/downloads/ipblocklist.csv").text

# Delete existing firewall rule
rule = "netsh advfirewall firewall delete rule name='BadIP'"
subprocess.run(["Powershell", "-Command", rule])

# Process the IP blocklist
csv_data = csv.reader(filter(lambda x: not x.startswith("#"), response.splitlines()))
for row in csv_data:
    ip = row[1]
    if ip != "dst_ip":
        print("Added Rule to block:", ip)
        # Add firewall rule to block IP
        rule = "netsh advfirewall firewall add rule name='BadIP' Dir=Out Action=Block RemoteIP=" + ip
        subprocess.run(["Powershell", "-Command", rule])
        rule = "netsh advfirewall firewall add rule name='BadIP' Dir=In Action=Block RemoteIP=" + ip
        subprocess.run(["Powershell", "-Command", rule])