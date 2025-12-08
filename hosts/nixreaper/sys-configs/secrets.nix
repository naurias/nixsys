{
	config,
	lib,
	pkgs,
	...
}:

{
  security.pki.certificateFiles = [ 
    ./rootCA.pem
  ];
}
