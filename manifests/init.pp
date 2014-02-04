# Public: Install kiwi xcode templates
#
# Examples
#
#   include kiwi
class kiwi {

    $path = '/tmp/kiwi'
    $install_file = "${path}/Xcode Templates/install-templates.sh"

    repository { $path:
        source   => 'allending/Kiwi',
        provider => 'git';
    }

    exec { $install_file:
        require => File[$install_file],
    }
}
