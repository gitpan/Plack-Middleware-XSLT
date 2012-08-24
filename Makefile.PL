
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "XSLT transformations with Plack",
  "AUTHOR" => "Nick Wellnhofer <wellnhofer\@aevum.de>",
  "BUILD_REQUIRES" => {
    "File::Touch" => 0,
    "HTTP::Request::Common" => 0,
    "Test::Deep" => 0,
    "XML::LibXML::Cache" => "0.12"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-Middleware-XSLT",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::Middleware::XSLT",
  "PREREQ_PM" => {
    "HTTP::Exception" => 0,
    "Plack" => 0,
    "Plack::Response" => 0,
    "Try::Tiny" => 0,
    "XML::LibXML" => "1.62",
    "XML::LibXSLT" => "1.62"
  },
  "VERSION" => "0.20000",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



