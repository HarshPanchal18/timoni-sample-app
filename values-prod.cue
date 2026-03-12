values: {
	deploymentName: "my-app-deployment-prod"
	serviceName:    "my-app-service-prod"

	replicas: 3

	service: {
		port: 80
	}

	env: {
		MY_ENV_VAR:  "prod-value"
		ANOTHER_VAR: "prod-another-value"
	}

	hpa: {
		enabled:     true
		minReplicas: 2
		maxReplicas: 5
		metrics: [
			{
				type: "Resource"
				resource: {
					name: "cpu"
					target: {
						type:               "Utilization"
						averageUtilization: 80
					}
				}
			},
		]
	}

	virtualService: {
		hosts: ["prod-app.example.com"]
		gateways: ["istio-system/prod-gateway"]
	}
}
