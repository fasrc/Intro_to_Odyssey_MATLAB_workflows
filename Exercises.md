# Introduction to Odyssey Hands-on Exercises

## Login and Access
1. Using your terminal program, log into Odyssey
2. (optional) If you have XQuartz (Mac) or Xming (PC), Log into Odyssey w/ X11 forwarding. Start a GUI clock sessions with the command `xclock &`
3. (optional) Log on to one of our NX machines (`rcnx01` or `holynx01`) and start a terminal session


## Filesystems: Transferring files
1. Transferring files with FileZilla
  1. Download the file at https://github.com/fasrc/DataC-HPC-genomics/blob/master/data/genome_data.zip?raw=true to your desktop
  1. Using FileZilla transfer this file to your Odyssey account home/login folder
  2. On your laptop's Desktop, unzip the genome_data.zip archive
  2. Using Filezilla, transfer the genome_data folder over to your home folder on Odyssey

`rsync` can transfer files within hosts or across hosts. The format is:
  
```
rsync (-options) source destination
rsync (-options) username@host:source destination
rsync (-options) source username@host:destination
```

where source and destination are any valid unix path

2. (Mac/Linux) Transferring files with rsync!
  0. In your terminal window from `Login and Access`, make a new directory 'transfer' in your home folder with the command `mkdir transfer`.
  2. Using your terminal program, transfer the zip archive from your Desktop to the `transfer` folder on Odyssey
  3. Using your terminal program, transfer the genome_data folder from your Desktop to the `transfer` folder on Odyssey


## Filesystems: Storage
1. See what directory you are in using `pwd` command. Compare this with your neighbor. Any differences?
2. You can display filesystems with the `df` command. Use this command with the following options:
  1. df /
  2. df .
  3. df -h .
3. What command would you use to see what other fileystems are available on Odyssey? ?


## Loading/installing software
0. Issue the command `bowtie`. What happens?
1. Issue the appropriate command to display what modules do you currently have loaded. What are they?
2. Using the appropriate command, find what versions of `bowtie` are on the cluster.
3. Load the latest version of bowtie. What command did you use?
4. What modules do you have loaded now?
5. Issue the `bowtie` command now. What's different?

6. Load in the legacy modules
6. Look for the versions of `bowtie` on the cluster again. What do you notice?

0. (Bonus!) Use the text editor `nano` to modify your `.bashrc` to opt-in for the new modules


## Login/Interactive sessions
1. Issue the appropriate command to get an interactive session w/ 4 GB RAM for 60 minutes
2. Start a MATLAB command-line session. What commands do you need to issue to do this?


## Submitting jobs
1. Using nano or your favorite text editor, create a SLURM submission script to run your MATLAB code
Include an email notification for END for yourself and your TA to indicate that you completed this task successfully

2. Create a new submission script to trim a FASTQ file located at:
/n/regal/datac/precomputed/lite/untrimmed_fastq/SRR098281.fastq

using Trimmomatic with 4 cores for 15 minutes. You'll need to look at the 
Include an email notification for END for yourself and your TA to indicate that you completed this task successfully

/n/regal/datac/precomputed/lite/untrimmed_fastq/SRR098281.fastq

NOTE: if you simply follow the example release, you will get it wrong!
use SLIDINGWINDOW:4:20 MINLEN:20 as steps

3. Once your job completes successfully, how much RAM did your job use?
3b. Go back and modify your job script to use the appropriate amount of RAM
