
DEVSECOPS_STACK="devsecops-stack"
REGION="us-west-2"
GITHUB_USER="ibuchh"
GITHUB_REPO="devsecops-aquasec"
GITHUB_TOKEN="472b1be54cb42e0365a7a1ae438ce14192ae3ab8"
# create the base VPC, Subnets, ECS (Fragate) cluster, CodePipeline and ECR
aws --region $REGION cloudformation create-stack \
--stack-name ${DEVSECOPS_STACK} \
--template-body file://./devsecops.yml \
--parameters \
ParameterKey=GitHubUser,ParameterValue=${GITHUB_USER} \
ParameterKey=GitHubRepo,ParameterValue=${GITHUB_REPO} \
ParameterKey=GitHubToken,ParameterValue=${GITHUB_TOKEN} \
--capabilities "CAPABILITY_NAMED_IAM" \
&& aws --region $REGION cloudformation wait stack-create-complete --stack-name ${DEVSECOPS_STACK}
