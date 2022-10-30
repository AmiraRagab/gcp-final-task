# gcp-final-task


## to build infra on gcp using terraform do :
  cd gcp-task/

 terraform init

 terraform apply
 
 ## to build image from docker file use :

  docker tag gcr.io
  
  docker push gcr.io
  
  docker build -t .

 ## to deploy the application on gke cluser
    kubectl apply -f deployment1.yaml
