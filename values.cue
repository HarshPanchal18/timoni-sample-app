values: {
	deploymentName: "my-app-deployment-beta"
	serviceName:    "my-app-service-beta"

	replicas: 1

	service: {
		port: 80
	}

	env: {
		MY_ENV_VAR: "test-env-variable"
	}

	hpa: {
		enabled:     true
		minReplicas: 1
		maxReplicas: 3
		metrics: [
			{
				type: "Resource"
				resource: {
					name: "cpu"
					target: {
						type:               "Utilization"
						averageUtilization: 60
					}
				}
			},
		]
	}

	virtualService: {
		enabled: true
		hosts: ["beta-app.example.com"]
		gateways: ["istio-system/beta-gateway"]
	}
}
