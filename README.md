🧪 HTTPBin Post API Performance Test Suite  (JMeter + Docker Compose)
------------------------------------------------------------------------------------------------------------------------------------------------------
📌 Overview

This project provides a complete performance testing setup using Apache JMeter and Docker Compose to benchmark the following HTTP methods of httpbin:

HTTP Method	Endpoint
GET	          /get
POST	          /post
PUT	          /put
DELETE	          /delete
PATCH	          /patch

Purpose:
Validate performance KPIs such as response time, throughput, and error rates under different load conditions.

------------------------------------------------------------------------------------------------------------------------------------------------------
Provide automated HTML reports for quick analysis.

⚙️ Project Structure
├── docker-compose.yml           # Docker Compose setup for HTTPBin and JMeter
├── httpbin_api_test.jmx         # JMeter Test Plan
├── results/                     # Raw JTL results
├── report-html/                 # Generated HTML reports
└── README.md                    # Documentation

------------------------------------------------------------------------------------------------------------------------------------------------------
🚀 Setup Instructions
1️⃣ Run via Docker Compose (Recommended)
    docker-compose up


What happens:
Spins up the HTTPBin service at http://localhost:8000
Executes the JMeter test in non-GUI mode
Generates HTML performance reports automatically

Reports Location:
Raw results: results/results.jtl
HTML dashboard: report-html/index.html


2️⃣ Run JMeter GUI (Optional)
For exploratory testing or modifying scenarios:  jmeter

Steps:
Open httpbin_api_test.jmx in JMeter GUI
Adjust Thread Group: user count, ramp-up, and duration
Run the test and analyze results using Listeners

🧰 Tools Used
Apache JMeter – Open-source performance testing tool
Docker Compose – Container orchestration for services
HTTPBin – REST API endpoints for testing

📝 Performance Testing Approach
📍 1. Requirement Analysis
Reviewed Non-Functional Requirements (NFRs): expected user load, peak load, SLAs, system architecture
Identified key business transactions for testing

📊 2. Workload Modeling
Defined concurrent user count, test duration, and ramp-up/down based on real/projected traffic
Distributed user load across endpoints to mimic real usage patterns

🧪 3. Test Scenario Design
Test Type	           Objective	                                  Example Config

Load Test	     Validate performance under expected load	       100 users for 3600 min

Stress Test	     Identify system breaking point	                Gradual ramp-up beyond expected load

Endurance (Soak)      Check stability & memory leaks over time	        100 users for 2 hrs

Spike Test	      Assess resilience to sudden traffic spikes	0 → 840 users instantly, then back down



🧰 Connecting Docker Container
cf ssh perfsimulatorjmx12 -N -T -L 12010:localhost:12010 -L 12011:localhost:12011


🧭 Execution via CLI (Alternative)
nohup ./jmeter -n \ -t httpbin_api_test.jmx \ -l results/Load-test-300-users-aggregatereport.jtl.jtl \ -e -o report-html/loadtest \ > results/Load-test-300-users-aggregatereport.jtl 2>&1 &



Keeps the test running in the background
Logs stored at results/soaktest.log
Dashboard report at report-html/soaktest/index.html


📡 Monitoring & Analysis
JMeter HTML Dashboard – Key metrics: response time, throughput, error %
Monitor resource utilization: CPU, Memory, Network on server/container
Capture failures or errors in JTL logs for RCA (Root Cause Analysis)

🏁 Next Steps
Integrate with CI/CD (e.g., Jenkins) for automated performance runs
Add custom assertions & SLAs in the JMeter test plan
Extend coverage to more endpoints or advanced scenarios
