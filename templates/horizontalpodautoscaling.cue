package templates

import (
	autoscalingv2 "k8s.io/api/autoscaling/v2"
)

#HorizontalPodAutoscaling: autoscalingv2.#HorizontalPodAutoscaler & {
	#config:    #Config
	apiVersion: "autoscaling/v2"
	kind:       "HorizontalPodAutoscaler"
	metadata:   {
		if #config.hpa.name != _|_ {
			name: #config.hpa.name
		}
		if #config.hpa.name == _|_ {
			name: #config.metadata.name
		}
		namespace: #config.metadata.namespace
		labels:    #config.metadata.labels
		if #config.hpa.annotations != _|_ {
			annotations: #config.hpa.annotations
		}
	}
	spec: autoscalingv2.#HorizontalPodAutoscalerSpec & {
		scaleTargetRef: {
			apiVersion: "apps/v1"
			kind:       "Deployment"
			name:       #config.deploymentName
		}
		if #config.hpa != _|_ {
			if #config.hpa.minReplicas != _|_ {
				minReplicas: #config.hpa.minReplicas
			}
			maxReplicas: #config.hpa.maxReplicas
			if #config.hpa.metrics != _|_ {
				metrics: #config.hpa.metrics
			}
			if #config.hpa.behavior != _|_ {
				behavior: #config.hpa.behavior
			}
		}
	}
}
