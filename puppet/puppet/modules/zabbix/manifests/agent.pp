class zabbix::agent inherits zabbix::params {
    package { 'zabbix-release':
        ensure      =>  'latest',
    }
    package { 'zabbix-agent':
        ensure      =>  'latest',
        require     =>  Package['zabbix-release'],
    }
    file { 'zabbix_agentd.conf':
        ensure      =>  'present',
        owner       =>  'root',
        group       =>  'root',
        mode        =>  '0644',
        path        =>  '/etc/zabbix/zabbix_agentd.conf',
        content     =>  template('zabbix/zabbix_agentd.conf.erb'),
        require     =>  Package['zabbix-agent'],
        notify      =>  Service['zabbix-agent'],
    }
    service { 'zabbix-agent':
        ensure      =>  running,
        hasrestart  =>  true,
        hasstatus   =>  true,
        require     =>  File['zabbix_agentd.conf'],
    }
}
