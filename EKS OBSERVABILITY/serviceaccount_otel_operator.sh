

eksctl create iamserviceaccount --name adot-collector --namespace default --cluster eks-jam --role-name adot-collector --attach-policy-arn arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess --region eu-west-1 --approve --override-existing-serviceaccounts

eksctl create iamserviceaccount --name adot-collector --namespace default --cluster eks-jam --role-name adot-collector --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy --region eu-west-1 --approve --override-existing-serviceaccounts

# Check
kubectl describe serviceaccount adot-collector -n default

eksctl create iamserviceaccount --name adot-collector --namespace opentelemetry-operator-system --cluster eks-jam --role-name adot-collector --attach-policy-arn arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess --region eu-west-1 --approve --override-existing-serviceaccounts

eksctl create iamserviceaccount --name adot-collector --namespace opentelemetry-operator-system --cluster eks-jam --role-name adot-collector --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy --region eu-west-1 --approve --override-existing-serviceaccounts