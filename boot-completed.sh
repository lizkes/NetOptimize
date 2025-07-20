apply_sysctl() {
  sysctl -w net.core.default_qdisc=fq_codel
  sysctl -w net.ipv4.tcp_congestion_control=bbr
  sysctl -w net.core.optmem_max=131072
  sysctl -w net.core.rmem_max=31457280
  sysctl -w net.core.wmem_max=31457280
  sysctl -w net.core.rmem_default=131072
  sysctl -w net.core.wmem_default=131072
  sysctl -w net.ipv4.tcp_rmem="8192 131072 31457280"
  sysctl -w net.ipv4.tcp_wmem="8192 131072 31457280"
  sysctl -w net.ipv4.tcp_mem="130974 174635 261948"
  sysctl -w net.ipv4.udp_mem="130974 174635 261948"
  sysctl -w net.ipv4.tcp_window_scaling=1
  sysctl -w net.ipv4.tcp_moderate_rcvbuf=1
  sysctl -w net.ipv4.tcp_no_metrics_save=1
  sysctl -w net.core.netdev_budget=600
  sysctl -w net.core.netdev_budget_usecs=10000
  sysctl -w net.ipv4.tcp_timestamps=1
  sysctl -w net.ipv4.tcp_tw_reuse=1
  sysctl -w net.ipv4.tcp_slow_start_after_idle=0
  sysctl -w net.ipv4.tcp_sack=1
  sysctl -w net.ipv4.tcp_fack=1
  sysctl -w net.ipv4.tcp_fin_timeout=15
  sysctl -w net.core.netdev_max_backlog=10240
  sysctl -w net.core.somaxconn=10240
  sysctl -w net.ipv4.tcp_max_orphans=10240
  sysctl -w net.ipv4.tcp_max_tw_buckets=10240
  sysctl -w net.ipv4.tcp_keepalive_time=900
  sysctl -w net.ipv4.tcp_syn_retries=3
  sysctl -w net.ipv4.tcp_synack_retries=3
  sysctl -w net.ipv4.tcp_max_syn_backlog=10240
  sysctl -w net.ipv4.tcp_fastopen=3
  sysctl -w net.netfilter.nf_conntrack_max=262144
  sysctl -w net.netfilter.nf_conntrack_tcp_timeout_established=28800
  sysctl -w net.ipv4.route.gc_timeout=300
  sysctl -w net.ipv4.neigh.default.gc_stale_time=120
  sysctl -w net.ipv4.neigh.default.gc_thresh1=256
  sysctl -w net.ipv4.neigh.default.gc_thresh2=1024
  sysctl -w net.ipv4.neigh.default.gc_thresh3=2048
  sysctl -w net.ipv4.conf.all.accept_redirects=0
  sysctl -w net.ipv6.conf.all.accept_redirects=0
}

apply_sysctl

for i in $(seq 1 4); do
  sleep 60
  apply_sysctl
done &