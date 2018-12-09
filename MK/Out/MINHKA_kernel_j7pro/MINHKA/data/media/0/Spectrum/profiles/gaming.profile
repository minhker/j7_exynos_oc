    chmod 644 /sys/power/cpuhotplug/enable
   echo 0 > /sys/power/cpuhotplug/enable
chmod 644 /sys/power/cpuhotplug/max_online_cpu
   echo 8 > /sys/power/cpuhotplug/max_online_cpu
 #Cpu Tweaks
     
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
   echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
   echo 343000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
   echo 1690000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/go_hispeed_load
   echo 80 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/go_hispeed_load
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/above_hispeed_delay
   echo "39000 1586000:19000" > /sys/devices/system/cpu/cpu1/cpufreq/interactive/above_hispeed_delay
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/timer_rate
   echo 20000 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/timer_rate
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/hispeed_freq
   echo 1482000 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/hispeed_freq
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/target_loads
   echo "65 1586000:75" > /sys/devices/system/cpu/cpu1/cpufreq/interactive/target_loads
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/min_sample_time
   echo 30000 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/min_sample_time
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/boost
   echo 0 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/boost
   chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/interactive/boostpulse_duration
   echo 40000 > /sys/devices/system/cpu/cpu1/cpufreq/interactive/boostpulse_duration
   
 chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
   echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
   echo 343000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
   echo 1794000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
   echo 80 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
   echo "39000 1690000:19000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
   echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
   echo 1586000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
   echo "65 1690000:75" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
   echo 30000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
   echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
   chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
   echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
   

   #Gpu Tweaks
   chmod 644 /sys/devices/11400000.mali/max_clock
   echo 1146 > /sys/devices/11400000.mali/max_clock
   chmod 644 /sys/devices/11400000.mali/min_clock
   echo 343 > /sys/devices/11400000.mali/min_clock
   chmod 644 /sys/devices/11400000.mali/highspeed_clock
   echo 1001 > /sys/devices/11400000.mali/highspeed_clock
   chmod 644 /sys/devices/11400000.mali/highspeed_load
   echo 85 > /sys/devices/11400000.mali/highspeed_load

 
   #Misc
   chmod 644 /sys/module/sync/parameters/fsync_enabled
   chmod 644 /sys/kernel/dyn_fsync/Dyn_fsync_active
   chmod 644 /sys/kernel/sched/gentle_fair_sleepers
   chmod 644 /sys/kernel/sched/arch_power
   echo "N" > /sys/module/sync/parameters/fsync_enabled
   echo "0" > /sys/kernel/dyn_fsync/Dyn_fsync_active
   echo "0" > /sys/kernel/sched/gentle_fair_sleepers
   echo "0" > /sys/kernel/sched/arch_power  
