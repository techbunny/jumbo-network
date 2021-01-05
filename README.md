# DEPLOYMENT NOTE

Because of the dependency of the Peering Module on
the results of the VNET module (which isn't known until
deployment), this must be deployed twice, first to just
deploy the VNETs so they are known for the next run.

1) terraform apply -target=module.vnet1
2) terraform apply


# IMPORTANT VARIABLES

You will need to edit as needed, the following variables in the variables.tf file:

1. All desired VM sizes.  There is a specific variable to hold VM sizes that support GEN2 Hyper-V.
2. Regions - specifies deployment regions, number of zones supported in each and the desired CIDR range for the VNET in that zone.  VNET CIDRs must not overlap or peering will fail. 
3. Exclusions - List known VM sizes and regions they are not supported in. 
4. OS SKUs - there are variables for the default (used for GEN1 Hyper-V) and GEN2 OS SKUs, which are named differently. 
