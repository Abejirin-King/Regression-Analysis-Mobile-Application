# Regression-Analysis-Mobile-Application

Cross-Origin Resource Sharing (CORS) allows web applications hosted on different domains to communicate with the API. During development, allow_origins=["*"] permits requests from any origin, simplifying testing from tools such as Swagger UI and the Flutter application. In a production environment, this should be restricted to trusted frontend domains to prevent unauthorized websites from accessing the API.

Allowed: Trusted frontend applications (Flutter app and Swagger UI during development).

Restricted: Unknown or malicious websites to reduce unauthorized cross-origin access.