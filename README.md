# DEPLOYMENT NOTE

Because of the dependency of the Peering Module on
the results of the VNET module (which isn't known until
deployment), this must be deployed twice, first to just
deploy the VNETs so they are known for the next run.

1) terraform apply -target=module.vnet1
2) terraform apply


 

