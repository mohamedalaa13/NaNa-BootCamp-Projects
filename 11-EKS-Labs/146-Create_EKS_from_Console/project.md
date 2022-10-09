## Steps to create EKS Cluster

## 1- Create EKS IAM Role
      1.1- AWS Service "EKS Cluster"
      1.2- Policy is "AmazonEKSClusterPolicy"
      1.3- Description: "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
      1.4- This is the Role: https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/roles/details/eks-cluster-role?section=permissions
      1.5- Example of this Role usage: If we want to create nodePort SVC on Worker Node the Role will give EKS permission to open port on the Worker Node.


## 2- Create VPC for Worker Nodes
      2.1- K8s has it's own Network so that we need a VPC to configure it.
      2.2- This VPC is created for Worker Nodes.
      2.3- Create Network Access Control Lists for the Worker Nodes to communicate with Master"EKS".
      2.4- VERY IMPORTANT: EKS"Master" is created in different VPC managed by AWS.
      2.5- AWS Elastic LoadBalancer => Public Subnet       ##        K8S LoadBaalancer SVC => Private Subnet
      2.6- Create the VPC with Public+Private Subnet using ready template from CloudFormation AWS Service.
      2.7- This is the CloudFormation Stack: https://eu-central-1.console.aws.amazon.com/cloudformation/home?region=eu-central-1#/stacks/outputs?filteringStatus=active&filteringText=&viewNested=true&hideStacks=false&stackId=arn%3Aaws%3Acloudformation%3Aeu-central-1%3A901733097845%3Astack%2Feks-worker-nodes-vpc-stack%2F5ea73ec0-ea68-11ec-b9b9-0224048eda9a

      

## 3- Create EKS Cluster Master Node
     3.1- Use the right IAM Role: "eks-cluster-role"
     3.2- In Networking: choose the newly created VPC by CloudFormation
     3.3- Select the Security Group created by CloudFormation
     3.4- VERY IMPORTANT: Cluster EndPoint access => 
            3.4.1- Public so that we can access the k8s cluster from outside the VPC EX: from Terminal.
            3.4.2- Private so that the worker nodes within same VPC can contact each others. 
       


## 4- Connect locally Kubectl with EKS cluster
      4.1- Create the KubeConfig file => In My Terminal: 
                                              $aws eks update-kubeconfig --name "eks-cluster-name"



## 5- Create EC2 IAM Role for NodeGroup "Group of EC2s"
      5.1- AWS Service "EC2".
      5.2- Needed Policies: 
              5.2.1- AmazonEKSWorkerNodePolicy
              5.2.2- AmazonEC2ContainerRegistryReadOnly
              5.2.3- AmazonEKS_CNI_Policy 



## 6- Create Node Group of EC2 and attach it to EKS
      6.1- In the EKS Cluster we created => Compute => Add Node Group
      6.2- Attach the Role created in previous step
      6.3- Add the spec of EC2 Instances
      6.4- Add the Node Scalling "Min, Max and Desired" Number of Nodes.
      6.5- Create Worker Nodes
      6.6- For these EC2s to work as Worker nodes we need these installations:
             6.6.1- Container RunTime "Docker"
             6.6.2- Kubelet
             6.6.3- Kube-Proxy
        VERY IMPORTANT: These Installations are already installed in all nodes once we creates using Node Group.
        


## 7- Configure AutoScalling for the Cluster



## 8- Deploy an App in the EKS Cluster