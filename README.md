# iexec-textile


## Introduction
The textile bucket feature over IPFS offers a simplified, secure and efficient solution to collect the result of distributed computation. IExec is well suited to distribute computation thanks to the decentralized marketplace for computing resources. With iExec, large simulation is divided in many tasks that optimizes the resources usage and the time to solution. But when simulation is completed, the result collection is fragmented and more complicated to achieve. Textile simplifies and improves the process.

### Application description

Rendering is the process of generating an image from a 3D model. The model may contain moving objects textures, lighting and shading information or camera moving.
The result is a digital image or movie, a suite of image, and may need a lot of computation. 
Rendering requires massive computational resources and distributed computing is an interesting solution to speed up the computation.

### The problem
Distributed computing on cloud provider is an awesome solution but it implies the software or program must be available installed on all the machines planned to be used, be sure all the dependencies and hardware requirement are fulfilled, and take care of the cost.

### Blender 

Blender is the free and open source 3D creation suite. Blender can be used to create 3D visualizations such as still images, 3D animations, VFX shots, and video editing. Blender is well suited to individuals and small studios who benefit from its unified pipeline and responsive development process. Scripting feature of blender is well suited to distribute frame generation

### GPU Computing 

Blender supports GPU computation, and Nvidia cards that provides with CUDA an unequalized programming model to speed up the computing process. 

### Distributed computing 

The frame distribution model is a common solution for parallel rendering to distributed the computation on many machines and helps designers to reduce their conception cycle
The time to solution expected should follow a linear speed-up: using N machines, computation will be ended N times faster.  

iExec supports Bags of Tasks execution to ease the deployment of distributed computing simulation. This is extremely simple to deploy the same application tuning the input parameters


## Improvment proposal
iExec supports secure computation and can save credential in a secure service used in the iExec infrastructure to manage enclaves. This Secret Management should support the bucket credential to improve security. The bucket creation should be embedded in iExec service, secure and transparent for end user    


## Code description

buckets/ 
Set up and access to the bucket with email set up 
the token access is transferred to the application 
```./textile buckets rendering2/```

textile_docker/
standalone container to use textile tools


