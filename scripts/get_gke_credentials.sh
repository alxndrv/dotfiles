#!/usr/bin/env bash

PROJECT=$(gcloud projects list --format "value(project_id)" | gum choose --header="Choose a project:")

CLUSTER=$(gcloud container clusters list --project $PROJECT --format "value(name, location)" | gum choose --header "Choose a cluster:")

CLUSTER_NAME=$(echo $CLUSTER | awk '{print $1}')
CLUSTER_REGION=$(echo $CLUSTER | awk '{print $2}')

COMMAND="gcloud container clusters get-credentials $CLUSTER_NAME --region $CLUSTER_REGION --project $PROJECT"

gum confirm "$COMMAND" && eval "$COMMAND"

NEW_NAME=$(gum input --header "Rename cluster entry $(kubectx -c):" --placeholder "$(kubectx -c)")

kubectx "$NEW_NAME"=.
