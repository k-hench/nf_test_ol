# nf_test_ol

this is a test pipeline to learn the `nextflow` configuration for use with the Uni Oldenburg cluster.

Execute the pipeline by running:

```sh
nextflow run test_pipeline.nf
```

The test pipline contains three steps:

1. It is initialized by creating a set of three letter-number combinations (A-1, B-2 and C-3)
2. This set is handed over to the first process which writes the letter into a file. I used this process to test the *local processes*. These are the processes that are not sent through the slurm queuing system but dealt with locally (typically very small tasks)
3. This file is then handed over to a second process which copies the content of the file to a new file and appends the number to the new file. This is done within a batch job. The final result is then exported to the `result/` folder.

I manage the *process types* and resources via the process labels and the `nextflow.config` file. 