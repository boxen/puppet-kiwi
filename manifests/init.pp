# Public: Install kiwi xcode templates
#
# Examples
#
#   include kiwi
class kiwi {

    $path = '/tmp/kiwi'

    repository { $path:
        source   => 'allending/Kiwi',
        provider => 'git';
    }

    exec { 'install':
        require => Repository[$path],
        cwd     => '/tmp/kiwi/Xcode Templates',
        command => '/bin/bash install-templates.sh',
        before  => File['clean up'],
    }

    file { 'clean up':
        ensure  => absent,
        path    => $path,
        force   => true,
    }
}
