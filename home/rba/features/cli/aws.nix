{ pkgs, ... }:
{
  programs.awscli = {
    enable = true;
    #settings = {
    #  "profile hn-test" = {
    #    "sso_session" = "hn-test";
    #    "sso_account_id" = "977099024682";
    #    "sso_role_name" = "SRFullAdmin";
    #    "region" = "eu-central-1";
    #    "output" = "json";
    #  };
    #  "sso-session hn-test" = {
    #    "sso_start_url" = "https://vzlz.awsapps.com/start/#";
    #    "sso_region" = "eu-central-1";
    #    "sso_registration_scopes" = "sso:account:access";
    #  };
    #};
  };
}
