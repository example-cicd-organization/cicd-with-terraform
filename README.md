# CICD WITH TERRAFORM

This repo contains a set of terraform scripts that build a cicd pipeline for a
github organization.

The scripts aim to provide a cloud infrastructure that:

- Use multiple Cloud Providers (AWS, GCP, ...) in order to maximise the usage of
  free tiers; therefore, trying to reduce costs
- Two Kubernetes clusters in autopilot mode; one for dev and one for prod
- A machine hosting a Jenkins master instance
- Jenkins configured to spawn workers in an external Kubernetes Cluster
- Jenkins configured to discover repos within an organization that include a
  jenkinfile
- A front-end host service

## Requirements
### Kubernetes
- Active account on GCP to host the Kubernetes clusters
- Create project for prod & dev
- Attach billing to each aforementioned project
- Enable Compute API
- Enable Kubernetes API

### Jenkins
## Infrastructure diagram

![cicd infrastructure for a github
organization](./assets/cicd-organization.drawio.svg)
