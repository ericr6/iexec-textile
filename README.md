# iexec-textile
using textile bucket with distributed computing  

#Distribute computation for 3 rendering on GPUs 
The computition is parallelized with iExec
Each workers involves compute a frame
The image generated is sent to a buckets thank to textile on IPFS.
End-user get all the images computed to rebuild the scene.


Textile is a efficient and elegant way for collecting result of distributed computation.   



buckets/ 

access to the buckets
./textile buckets rendering2/

textile_docker/

standalone container to use textile tools
