# agenix rekey manifest.
#
# Each attribute names an encrypted file under this directory and lists the
# age public keys allowed to decrypt it. `just secrets:rekey` re-encrypts every
# file for the identity in `.secrets/keys.txt`.
{
  "git-email.age".publicKeys = [
    (builtins.readFile ./age.pub)
  ];

  "git-signingkey.age".publicKeys = [
    (builtins.readFile ./age.pub)
  ];
}
