use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => "App::BuildBunny",
    VERSION_FROM => "build-bunny",
    EXE_FILES    => ['build-bunny'],
    PREREQ_PM    => {
        'Mojolicious'             => 0,
        'Minion::Backend::SQLite' => 0,
        'IPC::Cmd'                => 0,
        'Cwd'                     => 0,
        'Minion'                  => 0,
        'Email::MIME'             => 0,
        'Email::Sender::Simple'   => 0,
    },
);
