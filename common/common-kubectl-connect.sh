#!/bin/bash
((Sx+=1));export Sx; echo ${Sin:0:Sx} Running common-kubectl-connect.sh

if [ "${KUBE_CONTEXT_NAME}" != "?" ] ; then
  echo "Switching Kubectl to Context (${KUBE_CONTEXT_NAME})"
  $KUBE_EXEC config use-context ${KUBE_CONTEXT_NAME} || { echo 'ERROR: Failed to switch kubectl context' ; exit 1; }
else
  echo "Using kubectl current context.  Bypassing connection logic."
fi

export KUBE_NAMESPACE_CURRENT=$($KUBE_EXEC config view --minify --output 'jsonpath={..namespace}')

echo ${Sout:0:Sx} Exiting common-kubectl-connect.sh ; ((Sx-=1));export Sx;
