# Validate that the OCP version selected exists as a tag: (Typically does not contain patch version)
# https://catalog.redhat.com/software/containers/openshift4/ose-cli
ARG OCP_VERSION="v4.10"

FROM registry.redhat.io/openshift4/ose-cli:$OCP_VERSION

# NOTE: The placement of this ARG is important. It must come after the FROM line
# or the value will be reset. https://stackoverflow.com/a/60450789
#
# Validate that the ACS version selected exists under:
# https://mirror.openshift.com/pub/rhacs/assets/
ARG ACS_VERSION="3.70.1"

# Install `roxctl` and `jq`
RUN curl "https://mirror.openshift.com/pub/rhacs/assets/${ACS_VERSION}/bin/linux/roxctl" -o /usr/bin/roxctl \
 && chmod +x /usr/bin/roxctl \
 && dnf install -y jq \
 && dnf clean all \
 && rm -rf /var/cache/yum
