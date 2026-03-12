// values.cue - Default configuration
// This file contains the base configuration that is shared across environments.
// It is merged with environment-specific values.cue files (e.g. values-prod.cue).
values: {
	image: {
		repository: "docker.io/nginx"
		tag:        "1.29.6"
		digest:     ""
		pullPolicy: "IfNotPresent"
	}

	virtualService: {
		enabled: true
	}
}
