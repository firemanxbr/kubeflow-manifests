{{- define "kubeflow.centraldashboard.name" -}}
{{- printf "centraldashboard" }}
{{- end }}

{{- define "kubeflow.centraldashboard.labels" -}}
{{ include "kubeflow.common.labels" . }}
{{ include "kubeflow.component.labels" (include "kubeflow.centraldashboard.name" .) }}
{{- end }}

{{- define "kubeflow.centraldashboard.selectorLabels" -}}
{{ include "kubeflow.common.selectorLabels" . }}
{{ include "kubeflow.component.selectorLabels" (include "kubeflow.centraldashboard.name" .) }}
{{- end }}

{{- define "kubeflow.centraldashboard.image" -}}
{{ include "kubeflow.component.image" (list .Values.defaults.image .Values.centraldashboard.image) }}
{{- end }}

{{- define "kubeflow.centraldashboard.imagePullPolicy" -}}
{{ include "kubeflow.component.imagePullPolicy" (list .Values.defaults.image .Values.centraldashboard.image) }}
{{- end }}

{{- define "kubeflow.centraldashboard.autoscaling.enabled" -}}
{{ include "kubeflow.component.autoscaling.enabled" (list .Values.defaults.autoscaling .Values.centraldashboard.autoscaling) }}
{{- end }}

{{- define "kubeflow.centraldashboard.autoscaling.minReplicas" -}}
{{ include "kubeflow.component.autoscaling.minReplicas" (list .Values.defaults.autoscaling .Values.centraldashboard.autoscaling) }}
{{- end }}

{{- define "kubeflow.centraldashboard.autoscaling.maxReplicas" -}}
{{ include "kubeflow.component.autoscaling.maxReplicas" (list .Values.defaults.autoscaling .Values.centraldashboard.autoscaling) }}
{{- end }}


{{- define "kubeflow.centraldashboard.nodeSelector" -}}
{{- if .Values.centraldashboard.nodeSelector -}}
  {{- toYaml .Values.centraldashboard.nodeSelector }}
{{- else if .Values.defaults.nodeSelector -}}
  {{- toYaml .Values.defaults.nodeSelector }}
{{- end }}
{{- end }}

{{- define "kubeflow.centraldashboard.tolerations" -}}
{{- if .Values.centraldashboard.tolerations -}}
  {{- toYaml .Values.centraldashboard.tolerations }}
{{- else if .Values.defaults.tolerations -}}
  {{- toYaml .Values.defaults.tolerations }}
{{- end }}
{{- end }}

{{- define "kubeflow.centraldashboard.affinity" -}}
{{- if .Values.centraldashboard.affinity -}}
  {{- toYaml .Values.centraldashboard.affinity }}
{{- else if .Values.defaults.affinity -}}
  {{- toYaml .Values.defaults.affinity }}
{{- end }}
{{- end }}

{{- define "kubeflow.centraldashboard.topologySpreadConstraints" -}}
{{- if .Values.centraldashboard.topologySpreadConstraints -}}
  {{- toYaml .Values.centraldashboard.topologySpreadConstraints }}
{{- else if .Values.defaults.topologySpreadConstraints -}}
  {{- toYaml .Values.defaults.topologySpreadConstraints }}
{{- end }}
{{- end }}

{{- define "kubeflow.centraldashboard.containerSecurityContext" -}}
{{- if .Values.centraldashboard.containerSecurityContext -}}
  {{- toYaml .Values.centraldashboard.containerSecurityContext }}
{{- else if .Values.defaults.containerSecurityContext -}}
  {{- toYaml .Values.defaults.containerSecurityContext }}
{{- end }}
{{- end }}


{{- define "kubeflow.centraldashboard.serviceAccountName" -}}
{{- include "kubeflow.component.serviceAccountName"  (list (include "kubeflow.centraldashboard.name" .) .Values.centraldashboard.serviceAccount) }}
{{- end }}

{{- define "kubeflow.centraldashboard.roleName" -}}
{{- include "kubeflow.centraldashboard.name" . }}
{{- end }}

{{- define "kubeflow.centraldashboard.roleBindingName" -}}
{{- include "kubeflow.centraldashboard.name" . }}
{{- end }}

{{- define "kubeflow.centraldashboard.clusterRoleName" -}}
{{- include "kubeflow.centraldashboard.name" . }}
{{- end }}

{{- define "kubeflow.centraldashboard.clusterRoleBindingName" -}}
{{- include "kubeflow.centraldashboard.name" . }}
{{- end }}

{{- define "kubeflow.centraldashboard.config.name" -}}
{{ printf "%s-config" (include "kubeflow.centraldashboard.name" .) }}
{{- end }}

{{- define "kubeflow.centraldashboard.svc.name" -}}
{{ print (include "kubeflow.centraldashboard.name" .) }}
{{- end }}

{{- define "kubeflow.centraldashboard.svc.host" -}}
{{ printf "%s.%s.svc.%s"
  (include "kubeflow.centraldashboard.svc.name" .)
  (include "kubeflow.namespace" .)
  .Values.clusterDomain
}}
{{- end }}

{{- define "kubeflow.centraldashboard.authorizationPolicyExtAuthName" -}}
{{- $providerName := .Values.istioIntegration.envoyExtAuthzHttpExtensionProviderName -}}
{{ printf "%s-%s" (include "kubeflow.centraldashboard.name" .) $providerName }}
{{- end }}