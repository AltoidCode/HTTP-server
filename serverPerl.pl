use Plack::Builder;

builder {
    enable "Plack::Middleware::Static", path => qr{^/static/}, root => './static';
    sub {
        my $env = shift;
        return [ 200, [ "Content-Type" => "text/plain" ], ["Simple server in perl"] ];
    };
};
