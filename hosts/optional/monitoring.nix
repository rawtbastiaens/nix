{ config, pkgs, ... }:
{
  services = {
    prometheus = {
      exporters = {
        node = {
          enable = true;
          port = 9100;
          enabledCollectors = [
            "logind"
            "systemd"
          ];
        };
      };

      enable = true;
      scrapeConfigs = [
          {
            job_name = "node";
            static_configs = [{
              targets = [ "localhost:${toString config.services.prometheus.exporters.node.port}" ];
            }];
          }
        ];
    };
    grafana = {
      #declarativePlugins = with pkgs.grafanaPlugins; [ ... ];
      enable = true;
      settings = {
        server = {
          http_addr = "127.0.0.1";
          http_port = 3000;
          enable_gzip = true;
          domain = "grafana.local";
        };

        provision = {
          enable = true;
        };
      };
    };
  };
}
