Linux S Learning Note
----

# Filesystem

# Process
man proc
```
main process (extra) =====================
 mem                                # access process's memory, through open,read and lseek
 io                                 # I/O statistics, rchar(characters read)
 environ
▸ task/

other process ============================
/proc/PID
▸ attr/                             # API for security modules to support SELinux
▸ cwd/ -> /proc/7778/fdinfo         # current working directory
▸ fd/                               # file directory
▸ fdinfo/                           # subdirecotry description
▸ map_files/                        # entries memory-mapped files(mmap), memory region start and end address pair
▸ net/
▸ ns/                               # setns
▸ root/ -> /proc/7778/fdinfo        # link root directory of this process
▸ task/
  autogroup
  cgroup                            # control groups
  cmdline                           # command line arguments
  comm
  coredump_filter                   # see core
  cpuset                            # see cpuset
  exe* -> /usr/lib/netease-cloud-music/netease-cloud-music
  gid_map                           # user_namespaces
  limits                            # soft/hard limit and units, (getrlimit)
  loginuid
  maps                              # Memory maps to executables and lib files
  mountinfo                         # mount points
  mounts                            # process's mount namespace, (fstab)
  numa_maps                         # see numa
  oom_adj                           # oom(out-of-memory)_adj(adjust) the score
  oom_score                         # current score of process, higher -> killed by oom_killer
  oom_score_adj                     # adjust badness heuristic
  sched                             # scheduler parameters
  schedstat                         # scheduler status
  sessionid                         # sessionid
  setgroups
  smaps                             # show memory consumption (pmap), Rss(resident in RAM),Pss(proportional share)
  stat                              # process status
  statm                             # memory usage information
  status                            # process status in human readable form
  timers
  wchan

  projid_map                        # mapingprojid
  uid_map
```

/proc/
```
▸ acpi/
▸ asound/
▸ bus/                                      # installed buses, /pccard PCMCI device, /pci, PCI devices
▸ fs/
▸ irq/
▸ net/ -> /proc/19762/net/
▸ self/ -> /proc/19762/                     # process accessing /proc filesystem
▸ sys/                                      # kernel variables related
▸ sysvipc/
▸ thread-self/ -> /proc/19762/task/19762/
▸ tty/
  buddyinfo 
  cgroups 
  cmdline                                   # argument passed to linux kernal at boot time, such as lilo or grub
  consoles 
  cpuinfo                                   # CPU and system architecture
  crypto 
  devices                                   # major numbers and device groups, MAKEDEV scripts
  diskstats                                 # disk I/O statistics for each disk device
▸ driver/                                   # empty
  dma                                       # ISA DMA
  execdomains                               # execution domains
  fb                                        # frame buffer information
  filesystems
  interrupts
  iomem
  ioports                                   # currently registered io ports
  kallsyms                                  # kernal exported symbol
  key-users 
  keys 
  loadavg 
  locks 
  mdstat
  meminfo 
  misc
  modules
  mounts -> /proc/19762/mounts 
  mtrr                                      # memory type range register
  pagetypeinfo
  partitions                                # major and minor numbers of each partition
  sched_debug 
  schedstat 
  softirqs
  stat                                      # kernal/system statistics
  swaps                                     # swap area in use
  timer_list                                # currently pending timers
  timer_stats                               # debugging facility, avoid unnecessary wakeups
  uptime
  version                                   # kernel version, proc/sys/kernel/ostype, osrelease
  version_signature 
  vmstat                                    # virtual memory statistics
  zoneinfo                                  # memory zones
```

# Network


