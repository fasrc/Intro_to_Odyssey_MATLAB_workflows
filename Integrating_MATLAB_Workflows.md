## Integrating MATLAB Workflows on Odyssey

This document will go over the usage patterns for executing MATLAB code on Odyssey. Example files can be obtained from [https://github.com/fasrc/Intro_to_Odyssey_MATLAB_workflows/raw/master/matlab_integration.tgz](https://github.com/fasrc/Intro_to_Odyssey_MATLAB_workflows/raw/master/matlab_integration.tgz).

### Run MATLAB using RC's NoMachine
It is possible to use GUI applications on Odyssey by making a remote desktop session with our GUI login server NoMachineX. Please see http://fasrc.us/nxsession for setup and instructions.

### Run MATLAB by getting an X11 ssh login session
The X11 protocol is rather network-intensive, so doing X11 sessions require patience, and we highly recommend using a wired ethernet connection. But, you can do so following the instructions at https://rc.fas.harvard.edu/resources/access-and-login/#Setup_X11_forwarding_for_lightweight_graphical_applications. Once you have your GUI session, get an interactive session on a compute node, load RStudio, and execute it:

```bash
srun --pty --x11=first -p interact --mem 2000 -n 1 -N 1 -t 0-06:00 /bin/bash
source new-modules.sh
module load matlab
matlab &
```


### Run MATLAB at the command line
GUI sessions are great for interactive work, but scaling happens best at the command line. You can run MATLAB at the terminal command line by getting an interactive session on a compute node, loading MATLAB, and executing it:

```bash
srun --pty --x11=first -p interact --mem 2000 -n 1 -N 1 -t 0-06:00 /bin/bash
source new-modules.sh
module load matlab
matlab
```



### Run an MATLAB command script interactively
If you've made an matlab script to perform some work, you can execute the script in an interactive session :

```bash
srun --pty --x11=first -p interact --mem 2000 -n 1 -N 1 -t 0-06:00 /bin/bash
source new-modules.sh
module load matlab
matlab -nojvm -nodisplay -nosplash myscript.m
```

You can also pass information to your MATLAB script via positional parameters. For example:

```bash
matlab -nojvm -nodisplay -nosplash -r "sum_series(2,10)" 
```
You can also put your R commands in a script file and execute the script file directly.

Example SLURM and MATLAB scripts can be found in the `simple` folder within the tar archive at the URL listed above.

More information at https://rc.fas.harvard.edu/resources/documentation/software/matlab/


### Submit an MATLAB command script to SLURM
Running an MATLAB job on the cluster, in the background, is almost no different that running an MATLAB script in an interactive session. The only change would be to include SLURM directives at the start of your script, prefixed by the `#SBATCH` keyword. Since these will appear as comments to `bash`, your interactive script and SLURM script can be one and the same. Again, see the scripts in the `simple` folder of the tar archive.

### Scaling jobs: Submitting a directory of files
As you start to scale your work, one example usage pattern is to have your MATLAB code process a bunch of files in one directory. Instead of doing this serially (one after another), you can *pleasantly parallelize* this approach, submitting one job per file. To do so, you'd need to submit the SLURM script for each file, which you can do with a `bash` for loop:

```bash
for file in *.dat; do
  echo $file
  sbatch means_from_file.slurm $file
  sleep 1
done
```

Please see our document at https://rc.fas.harvard.edu/resources/documentation/submitting-large-numbers-of-jobs-to-odyssey/ for more complete information.

### Scaling jobs: Using job arrays

Simple sbatch submissions are OK for small numbers of jobs. But as you start to approach many tens or even a hundred, submitting these numbers across all users on Odyssey can start to tax the scheduler. In this case, you should consider using job arrays. This will allow the scheduler to treat all the jobs a one large unit, with a number of sub-tasks.

This does require some changes to your SLURM script. Please see the files in the `arrays` folder of the tar archive. And you submit your job to the cluster using one simple command:

```bash
sbatch --array=1-100 process_file_in_array.slurm
```

Of course, your array size will vary according to the approach to your analysis. Please see our document at https://rc.fas.harvard.edu/resources/documentation/submitting-large-numbers-of-jobs-to-odyssey/ for more complete information.

