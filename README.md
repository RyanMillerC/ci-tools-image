# CI Tools Image

Code to build image used by CI pipeline (GitLab Runner). The CI tools image is
a modified version to the OCP CLI image provided by Red Hat, with `roxctl`
added for calling ACS.

**All CI pipelines (Runners) should use the latest tag of this image!** This
allows for OCP/ACS CLI to be updated as needed for all pipelines.
