use inc::Module::Install;

name 'MooseX-Types-PortNumber';
all_from 'lib/MooseX/Types/PortNumber.pm';

requires 'MooseX::Types';
requires 'namespace::autoclean';

build_requires 'Test::Exception';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
