
# try it with a srs of 1000 for each population....
yes_sam = sample(telco_yes$customerID,size=1000)
no_sam = sample(telco_no$customerID,size=100)


yess = telco_yes[which(telco_yes$customerID%in%yes_sam),]
dim(yess)
nos = telco_no[which(telco_no$customerID%in%no_sam),]

yn_sam = rbind(yess,nos)
View(yn_sam)