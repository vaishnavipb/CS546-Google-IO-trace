# Documenting Weekly progress here

### Week 1 [Sept 2nd] :white_check_mark:
**Summary**  
Candice briefly explained the project and the components involved in it. The below checklist contains the action items for the week.

**Goals**  
Initial week to understand the project and expectations from it. 

**Checklist**  
- [x] Create git repo and provide access to Candice. 
- [x] Read and understand [Google I/O thesios](https://github.com/google-research-datasets/thesios), [Darshan](https://www.mcs.anl.gov/research/projects/darshan/) and [IOR](https://ior.readthedocs.io/en/latest/index.html). 
- [ ] List the parameters in common between Google I/O and Darshan, especially if the parameters such as redundancy_type, from_flash_cache, cache_hit, simulated_latency are in common. 
- [ ] Decide on the evaluation plan. 
- [x] Get started with project proposal

**What went well?**  
I got a basic understanding of the project and completed the project proposal.

**What did not go well?**  
I wasn't able to come up with a concrete evaluation plan because the test bed and a few key parameters have not been identified yet.

**Did I learn anything important?**  
Yes, I gained a good understanding of Darshan and Thesios.
 
**What is holding us back?**  
The Thesios test environment specifications are not yet identified. It is not blocking me right now but would have helped identify the testbed for the project. 

**What urgent questions do I have?**  
  Google I/O traces are from the clusters of size 16TB with 2000 disks. What should be the comparison strategy? How can we compare it with a smaller trace like 64KB? 
Response from Candice: The comparison strategy will be on the file size(this can be obtained from the I/O trace data itself). 
Action item #2 of next week will help derive the strategy. 

**Next step?**  
Data analysis and visualization of Thesios data.

### Week 2 [Sept 9nd] :white_check_mark:
**Summary**  
This week, my focus is on exploring Google I/O traces and understanding the parameters and patterns. Additionally, I will look into Darshan and pydarshan to understand their available parameters.

**Goals**  
Explore and analyze Google I/O traces and Darshan, and finalize the environment configurations for simulation.

**Checklist**  
- [x] Analyze Google I/O traces to identify different stats and relations between parameters.
- [x] Understand Google I/O trace environment configurations (to simulate/relate to our experiments) by looking for references in papers, Git repo, or contacting the authors.
- [ ] Explore Darshan source code and pydarshan to understand parameters available.

**What went well?**  
I was able to make good progress analyzing the Thesios traces.
**What did not go well?**  
I had to push the exploration of Darshan due to a time crunch.
**Did I learn anything important?**  
Yes, I learned important workload observations from Thesios.
**What is holding us back?**  
  
**What urgent questions do I have?**  
  
**Next step?**  
Explore IOR and MPI to run the workloads in parallel.



### Week 3 [Sept 16nd] :white_check_mark:
**Summary**  
**Goals**  
The focus should be on identifying gaps with the 0 Bytes IO size traces in thesios data and to explore IOR, MPI to generate workload
**Checklist**  
- [ ] Start with replicating workload similar to cluster 1 (throughput oriented) - determine IO sizes specific to cluster 1
- [ ] In the file sizes, we saw 0 bytes to be highest frequent, but does it mean there’s no file size in the request? Identify what exactly it means. 
- [ ] How do we identify if a trace is throughput oriented or latency oriented in the traces? 
- [ ] Explore IOR and MPI to run the workloads parallelly. In the later weeks, we can progress on utilizing darshan with IOR.  

**What went well?**  
  
**What did not go well?**  
  
**Did I learn anything important?**  
  
**What is holding us back?**  
  
**What urgent questions do I have?**  
  
**Next step?**  
_______________
#### [Weekly MOM](https://docs.google.com/document/d/1HXy6TM12LvqHBX40IuTPkTRA6HWgs8jUvcBl-2Z02po)
