**Evaluation of the Transferability of Google Thesios Synthesized I/O Traces Across Different Systems**
=====================================

Description
-----------

This project aims to evaluate the accuracy and transferability of Google Thesios synthesized I/O traces by comparing them with Darshan traces collected from similar I/O workloads run using the IOR benchmarking tool. Google Thesios traces have previously reported 80-99% accuracy in simulating I/O behavior on tested storage clusters. To verify these claims, we will replicate similar I/O workloads using IOR, collect actual traces with Darshan, and then analyze and compare the Google Thesios traces using parameters similar to those observed in the Darshan traces. The comparison will be conducted across different environments, including the IIT cluster or a file system deployed on Chameleon, under various storage systems. The objective is to determine whether the Google synthesized traces maintain their reported accuracy when applied to different hardware and storage configurations, thereby assessing their reliability and generalizability in diverse computing environments.

[thesios-data-analysis](https://github.com/vpapudesibabu/CS546-Google-IO-trace/blob/main/code/thesios-data-analysis.ipynb) has detailed analysis of the thesios traces as well as the experimental analysis.

Read project report [here](https://github.com/vpapudesibabu/CS546-Google-IO-trace/blob/main/docs/ProjectReport.pdf) 

