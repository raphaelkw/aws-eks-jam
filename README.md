# aws-eks-jam

## Challenges
https://jam.awsevents.com/149cc6c3-82f0-4eb9-a9e0-b762d976d32e/challenges 
<img width="1727" alt="image" src="https://github.com/raphaelkw/aws-eks-jam/assets/47944476/26bedcd4-71e9-4a76-add5-61e833a5414a">
### Challenge: AMAZON EKS CLUSTER CREATION USING TERRAFORM
https://jam.awsevents.com/149cc6c3-82f0-4eb9-a9e0-b762d976d32e/challenges/eks-jam-clusterdeploy-001 
#### Addiitional Resources
Outputs:
cluster_endpoint = "https://C09A4ED2D22EC7A24B63BD0CCD0FCE06.gr7.us-west-2.eks.amazonaws.com"
cluster_name = "eks-jam-challenge-1"
cluster_security_group_id = "sg-0e602357f19c0d2bf"

Update kubeconfig to access the cluster
```
aws eks update-kubeconfig --name eks-jam-challenge-1 --region us-west-2
```

Get the iam mapping for the Kubernetes cluster
```
eksctl get iamidentitymapping --cluster eks-jam-challenge-1 --region=us-west-2
```

Add iam identity mapping to the Kubernetes cluster 
```
eksctl create iamidentitymapping --cluster eks-jam-challenge-1  --region=us-west-2 \
    --arn arn:aws:iam::387519492768:role/AWSLabsUser-eHCwcXSLjUyJxRPMVsUVHi --username admin --group system:masters \
    --no-duplicate-arns
```
