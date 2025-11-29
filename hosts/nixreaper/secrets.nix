{ inputs, config, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    validateSopsFiles = false;

    age = {
      # import ssh keys from ssh to age automatically 
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      # this will use the age key present already in filesystem 
      keyFile = "/var/lib/sops-nix/key.txt";
      # generate new key if not present already 
      generateKey = true;
    };
  };
}
