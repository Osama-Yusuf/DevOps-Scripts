# copy aws credentials to current directory
# copy kubeconfig to current directory

cp ~/.aws/credentials .

cp ~/.kube/config .

sleep 1

# build dockerfile
docker build -t myimage3 .

sleep 1

# give permission to delete credentials
chmod 777 credentials && chmod 777 config

# remove credentials and kubeconfig
rm credentials config