$jenkins_homedir = '/var/lib/jenkins'
$platforms = [
  'ubuntu-14-x86_64',
]
# indigo, indigo-preview, indigo-testing
$repo='indigo'
# 1, 2
$version='1'

class { '::jenkins_node':
  platforms      => $platforms,
  refresh_enable => false,
}

file{ 'G00keys':
  content => '#! /bin/sh
apt-get install -y gnupg || :
apt-key adv --fetch-keys http://repo.indigo-datacloud.eu/repository/RPM-GPG-KEY-indigodc
',
  path    => "${jenkins_homedir}/scripts/pbuilder/G00keys",
}

file{ 'G00precedence':
  ensure => absent,
  path   => "${jenkins_homedir}/scripts/pbuilder/G00precedence",
}

file{ 'repos.sh':
  content => "case \$PLATFORM in
        debian*|ubuntu*)
                cat <<EOF
#### INDIGO-${version} - Base repository - must be enabled ####
deb [arch=amd64] http://jenkins.indigo-datacloud.eu/repository/${repo}/${version}/ubuntu/ trusty main third-party
deb-src http://jenkins.indigo-datacloud.eu/repository/${repo}/${version}/ubuntu/ trusty main third-party

#### INDIGO-${version} - Updates to Base repository - should be enabled ####
deb [arch=amd64] http://jenkins.indigo-datacloud.eu/repository/${repo}/${version}/ubuntu/ trusty-updates main
deb-src http://jenkins.indigo-datacloud.eu/repository/${repo}/${version}/ubuntu/ trusty-updates main
EOF
                ;;
esac
",
  path => "${jenkins_homedir}/scripts/repos.sh",
}

Exec['download-jenkins-scripts']
->
File[
  'G00keys',
  'G00precedence',
  'repos.sh'
]

# refresh pbuilder images is not possible in unprivileged mode
#->
#Exec['refresh-chroot']
