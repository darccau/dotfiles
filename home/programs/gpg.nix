{
  pkgs,
  ...
}:
let
  isLinux = pkgs.stdenv.hostPlatform.isLinux;
in
{
  programs.gpg = {
    enable = true;

    settings = {
      keyid-format = "0xlong";
      with-fingerprint = true;
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      keyserver = "hkps://keys.openpgp.org";
      # modern default: trust keys on first use + PGP web of trust
      trust-model = "tofu+pgp";
      no-greeting = true;
      no-permission-warning = true;
    };

    # import our own key declaratively on activation
    publicKeys = [
      {
        trust = "ultimate";
        text = ''
          -----BEGIN PGP PUBLIC KEY BLOCK-----

          mDMEahHdCxYJKwYBBAHaRw8BAQdABVlNDGgZqKPwUUrsqHU+5ITSpaEFeEfx4gh2
          j3psMG60DWR1YXJkb3NwYWl4YW+IlgQTFgoAPhYhBKfqbcX58h2llImNLhG+prvc
          sf8GBQJqEd0LAhsBBQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEBG+
          prvcsf8GJZsA/RYVQrL1qCzye+oqVhrIEyO86VVfaBNqMzF2LyhZjurbAQDDrnvB
          CSUmPY/oCqhQyuMT6H9RodL7w2MsVnFWhnDsArgzBGoR3UMWCSsGAQQB2kcPAQEH
          QAV3GpzbPQSk1twE2EnSdGO4Mocc7gLYbv60QHDCWrvGiPUEGBYKACYWIQSn6m3F
          +fIdpZSJjS4Rvqa73LH/BgUCahHdQwIbAgUJA8JnAACBCRARvqa73LH/BnYgBBkW
          CgAdFiEEsE3LXaaeNr9BFXjY6BwUimCHHzQFAmoR3UMACgkQ6BwUimCHHzQZFAD/
          RIYWyOvh1T3GRcvFwJd/+5G09SeSmk/w5TaAJ8D7CAsA/iK5vz9GlkytZ3aSYAqE
          /SzLBRZKpcWBiw7AWFZUsrQOSTsBAKYHsVh7nG2FRNyI0xFIDpijJtZ/8EechCsF
          ymp8ABe8AP96VuSYqLWWhHQAAEdYvuTmue4Pwo/fb/ZgULu/7gJJALg4BGoR3koS
          CisGAQQBl1UBBQEBB0A7ek6Tzq055aMsIP7puQ1iQ4Pj3AUIwIxZzZvDLRbSPgMB
          CAeIfgQYFgoAJhYhBKfqbcX58h2llImNLhG+prvcsf8GBQJqEd5KAhsMBQkDwmcA
          AAoJEBG+prvcsf8GR0UBAKpAwV1KvRFmQcdOQd3bjdQCRFTTq7jlNNjPaSk8jZ2f
          AP9Nrz3KiRhn22cP2bxBEB6Fzj/UeAKNeqNz94oDPyY6AA==
          =3gaP
          -----END PGP PUBLIC KEY BLOCK-----
        '';
      }
    ];
  };

  # gpg-agent managed as a user systemd service (Linux only).
  services.gpg-agent = {
    enable = isLinux;
    pinentry.package = pkgs.pinentry-curses;

    # Git/GPG: cache the passphrase for 1 day
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;

    # SSH: shorter default ttl, still cached for the day
    defaultCacheTtlSsh = 3600;
    maxCacheTtlSsh = 86400;

    # never delegate the passphrase cache to the desktop environment
    noAllowExternalCache = true;
  };
}
