# default to allowing no extra hosts in the pg_hba
default['postgresql']['md5hosts'] = []
default['postgresql']['identhosts'] = []
default['postgresql']['idententries'] = []

# postgresql.conf settings
# Things set to nil won't show up, and will take defaults
default['postgresql']['listen_address'] = nil
default['postgresql']['listen_port'] = 5432
default['postgresql']['max_connections'] = 100
default['postgresql']['tcp_keepalives_idle'] = nil
default['postgresql']['tcp_keepalives_interval'] = nil
default['postgresql']['tcp_keepalives_count'] = nil
default['postgresql']['shared_buffers'] = '24MB'
default['postgresql']['temp_buffers'] = nil
default['postgresql']['max_prepared_transactions'] = nil
default['postgresql']['work_mem'] = nil
default['postgresql']['maintenance_work_mem'] = nil
default['postgresql']['max_stack_depth'] = nil
default['postgresql']['effective_io_concurrency'] = nil
default['postgresql']['no_fsync'] = false # disable fsync? Good for development
default['postgresql']['wal_buffers'] = nil
default['postgresql']['checkpoint_segments'] = nil
default['postgresql']['checkpoint_timeout'] = nil
default['postgresql']['checkpoint_completion_target'] = nil
default['postgresql']['checkpoint_warning'] = nil
default['postgresql']['random_page_cost'] = nil
default['postgresql']['effective_cache_size'] = nil
default['postgresql']['log_destination'] = nil
default['postgresql']['syslog_facility'] = nil
default['postgresql']['syslog_ident'] = nil
default['postgresql']['log_min_duration_statement'] = 500
default['postgresql']['log_duration'] = nil
default['postgresql']['log_checkpoints'] = 'on'
default['postgresql']['log_connections'] = 'on'
default['postgresql']['log_disconnections'] = 'on'
default['postgresql']['log_lock_waits'] = 'on'
default['postgresql']['log_temp_files'] = 0
default['postgresql']['log_error_verbosity'] = 'default'
default['postgresql']['log_statement'] = 'none'
default['postgresql']['lc_messages'] = 'C'
default['postgresql']['log_line_prefix'] = '%t [%p]: [%l-1] db=%d,user=%u,app=%a,client=%h '
default['postgresql']['autovacuum'] = nil
default['postgresql']['log_autovacuum_min_duration'] = 0
default['postgresql']['ssl'] = 'on'
default['postgresql']['bytea_output'] = nil
default['postgresql']['timezone'] = 'UTC'

# archive mode stuff
default['postgresql']['archive_mode'] = 'off'
default['postgresql']['archive_command'] = "'/usr/local/sbin/archive_command.sh %p'"
default['postgresql']['archive_timeout'] = nil
default['postgresql']['archive']['sshkey'] = nil
default['postgresql']['archive']['targets'] = []

# replication related
# Note that seph got errors if the username was `replication`
default['postgresql']['replication']['user'] = 'repluser'
default['postgresql']['replication']['md5hosts'] = []
default['postgresql']['replication']['identhosts'] = []
default['postgresql']['wal_level'] = 'hot_standby'
default['postgresql']['max_wal_senders'] = '5'
default['postgresql']['wal_keep_segments'] = '32'
default['postgresql']['hot_standby'] = 'on'
default['postgresql']['hot_standby_feedback'] = 'on'

default['postgresql']['wal']['incomingdir'] = '/pgincoming/wals'
