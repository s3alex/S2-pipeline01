#! /bin/bash 
TAG=`git rev-parse --short=5 HEAD`
rm -rf S2-pipeline-charts || true 
git clone git@github.com:devopseasylearning/S2-pipeline-charts.git
cd S2-pipeline-charts/canary
ls -l 
rm -rf  values-dev.yaml || true 
cat <<EOF > values-dev.yaml
image:
  repository: devopseasylearning2021/canary-dev
  tag: "$TAG"
service:
  type: LoadBalancer
EOF

cat  values-dev.yaml

echo  '[url "git@github.com:"]' >> ~/.gitconfig 
 echo 'insteadOf = https://github.com/' >> ~/.gitconfig 
 git config --global user.email "info@devopseasylearning.com"
  git config --global user.name "devopseasylearning"
  git add -A
git commit -m "Tag generated from jenkins"
git push 
