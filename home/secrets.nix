{
  config,
  ...
}:
{
  # Age identities that may decrypt the secrets in ./secrets
  age.identityPaths = [ "${config.home.homeDirectory}/.secrets/keys.txt" ];

  # Declare secrets here. Files are encrypted with agenix and decrypted into
  # $XDG_RUNTIME_DIR / $XDG_STATE_HOME during `home-manager switch`.
  #
  # Example:
  #   age.secrets."github-token" = {
  #     file = ../secrets/github-token.age;
  #     owner = config.home.username;
  #     mode = "600";
  #   };
  age.secrets = { };
}
