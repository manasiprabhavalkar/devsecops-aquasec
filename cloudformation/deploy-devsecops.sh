
DEVSECOPS_STACK="devsecops-stack"
REGION="us-west-2"
GITHUB_USER="ibuchh"
GITHUB_REPO="devsecops-twistlock"
GITHUB_TOKEN=""
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
