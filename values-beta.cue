values: {
	deploymentName: "my-app-deployment-beta"
	serviceName:    "my-app-service-beta"
	namespace:      "ns-prod"

	replicas: 1

	service: {
		port: 80
	}

	env: {
		MY_ENV_VAR: "test-env-variable"
	}

	hpa: {
		name: "test-hpa"
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
		name:    "my-app-vs"
		hosts: ["beta-app.example.com"]
		gateways: ["istio-system/beta-gateway"]
	}
}
