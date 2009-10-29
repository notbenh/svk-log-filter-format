use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'SVK::Log::Filter::Format',
    license             => 'perl',
    dist_author         => 'ben hengst <notbenh@cpan.org>',
    dist_version_from   => 'lib/SVK/Log/Filter/Format.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'SVK-Log-Filter-Format-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
