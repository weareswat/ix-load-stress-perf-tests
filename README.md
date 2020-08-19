# README

Tests

type | Purpose | Benefits | Gotchas
--- | --- | ---      | ---
Performance | Determining (or validating) speed/scalability/stability of the tested application | Real application parameters enable informative decision making(concerning launch schedule, performance tuning). Helps to establish if the end user will be satisfied with the application performance or not.Exposes the gap between the expected performance and the real performance of the application | Not suitable for the detection of functional defects appearing only under load conditions.Does not identify performance parameters of the system properly if designed poorly.
Load | Verifying application performance under normal and peak load conditions. | Determines thethroughput required to support the anticipated peak production load as well as the adequacy of the hardware environment.Evaluates load balancer implementation.Detects race conditions issues and functionality errors which occur under load.Helps to determine application capacity (in terms of concurrent user sessions). | Usually not designed with the focus on testing the application's response times.
Stress | Determining application behaviour under extreme conditions. | Determines if the system data can be corrupted under extreme load conditions.Determines the amount of traffic / load needed to cause failures and errors in addition to slowness.Helps to configure monitoring alerts that can warn of possible incoming failures.Exposes security vulnerabilities caused by stressful conditions (Denial of service attacks).Helps to define thetypes of failures that are most valuable to plan for. | It is difficult to quantify the amount of stress to apply, while designing the type of tests.It is important to isolate the test environment to avoid disruptive network and/or application failures.
 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
