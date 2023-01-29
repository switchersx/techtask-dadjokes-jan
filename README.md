See task.txt for goals.

Run `deploy.sh` to deploy setup locally. May want to edit so it doesn't delete your minikube but I put a warning in the script too. I just could not get it working with the dadjokes container. I could get to a point where I could curl it or visit in browser and get an nginx 502 but I feel there's something fundamental I'm misunderstanding. I could get it working as expected in docker but not kube. I know this is meant to be running as a service that I have a kubernetes service in front of to proxy requests through. Unless I'm meant to be handling that in the ingres controller.

Due to me timegating this I then moved on to using the nginx hello demo image as I could at least then get something working. Got basic deployment up, added autoscaling. 

Next steps - helm, use helm to template in a configurable namespace. Loadbalancer would be good too.
