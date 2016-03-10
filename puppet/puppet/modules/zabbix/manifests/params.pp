class zabbix::params {
    $zabbix_version         = '2.4'
    $agent_pidfile          = '/var/run/zabbix/zabbix_agentd.pid'
    $agent_logfile          = '/var/log/zabbix/zabbix_agentd.log'
    $agent_logfilesize      = '100'
    $zabbix_server          = '10.101.12.174'
    $zabbix_server_active   = '10.101.12.174'
    $agent_listenip         = $::ipaddress
    $agent_listenport       = '10050'
    $hostname               = $::fqdn
    $agent_debuglevel       = '3'
}
