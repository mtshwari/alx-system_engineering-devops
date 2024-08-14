Postmortem Report: HarmonyHub Music Recommendation Service Outage
Issue Summary
Duration: August 14, 2024, 10:00 AM - 11:45 AM (UTC)
Impact: The HarmonyHub music recommendation service was down, affecting approximately 70% of users. Users experienced errors when trying to get personalized music recommendations and were unable to access detailed analysis of their favorite tracks.
Root Cause: The outage was caused by a misconfigured environment variable that led to a failure in connecting to the Spotify API.
Timeline
10:00 AM - Issue detected by monitoring alert indicating a failure in API requests.
10:05 AM - An engineer noticed the issue when multiple users reported errors on the service.
10:15 AM - Investigation began, focusing initially on network issues and server logs.
10:30 AM - Misleading paths included checking server resource usage and potential issues with MongoDB.
10:45 AM - Incident escalated to the DevOps team.
11:00 AM - Issue identified as a misconfigured environment variable in the application’s deployment settings, which prevented API calls to Spotify.
11:15 AM - Issue resolved by correcting the environment variable and redeploying the application.
Root Cause and Resolution
Root Cause: The outage occurred because an environment variable containing the Spotify API key was incorrectly set. This misconfiguration blocked the application’s requests to the Spotify API, resulting in the service being unable to fetch recommendations and analysis.
Resolution: The issue was resolved by updating the environment variable with the correct API key and redeploying the application. Connectivity to the Spotify API was verified, and the service was restored.
Corrective and Preventative Measures
Improvements: To prevent similar issues in the future, the following improvements are recommended:

Implement automated checks to validate environment variables during deployment.
Enhance monitoring to include alerts for failed API requests and environment variable issues.
Introduce a more robust deployment verification process to catch configuration errors before going live.
Tasks:

[Task 1]: Develop and integrate automated checks for environment variables (due by August 20, 2024).
[Task 2]: Enhance monitoring configuration to include API failure alerts (due by August 22, 2024).
[Task 3]: Review and update deployment verification procedures (due by August 24, 2024).
Additional Notes: This outage highlighted the need for improved deployment verification and monitoring to catch configuration issues early.

Reviewed by: Tshwarelo Phukubje
