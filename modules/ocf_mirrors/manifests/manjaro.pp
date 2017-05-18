class ocf_mirrors::manjaro {
  file {
    '/opt/mirrors/project/manjaro':
      ensure  => directory,
      source  => 'puppet:///modules/ocf_mirrors/project/manjaro/',
      owner   => mirrors,
      group   => mirrors,
      mode    => '0755',
      recurse => true;
  }

  # TODO: Change the rsync source to rsync://repo.manjaro.org/repos since we're
  # now an official mirror and should have access if we contact them about it.
  cron {
    'manjaro':
      command => '/opt/mirrors/project/manjaro/sync-archive > /dev/null',
      user    => 'mirrors',
      hour    => '*/2',
      minute  => '35';
  }
}
