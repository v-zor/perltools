use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.


my %opts = (
            'NAME'		=> 'objc2perl',
            'VERSION_FROM'	=> 'objc2perl', # finds $VERSION
            'PREREQ_PM'		=> { 
                'Getopt::Long'   => 2.25,  # Tested; earlier ver might be ok
            }, 
            
            # Will be copied to INST_SCRIPT directory
            # 'make realclean' will delete them from there
            'EXE_FILES' => [ qw( objc2perl ) ],

            );

if ($ExtUtils::MakeMaker::VERSION >= 5.43) {
    $opts{AUTHOR}              = 'v-zor';
    $opts{ABSTRACT_FROM}       = 'objc2perl';
}

WriteMakefile( %opts )

