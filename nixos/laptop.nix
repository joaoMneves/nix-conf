{ config, pkgs, ... }:
{
  systemd.services.battery-charge-threshold =
    let
      CHARGE_THRESHOLD = "80";
    in
    {
      enable = true;
      description = "Set the battery charge threshold";
      startLimitBurst = 0;
      after = [ "multi-user.target" ];
      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
        ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.coreutils}/bin/echo ${CHARGE_THRESHOLD} > /sys/class/power_supply/BATT/charge_control_end_threshold'";
        User = "root";
        # ...
      };
      wantedBy = [ "multi-user.target" ];
      # ...
    };

  # Permissões
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", KERNEL=="BAT0", RUN+="${pkgs.coreutils}/bin/chmod 0664 /sys/class/power_supply/BAT0/charge_control_end_threshold"
  '';

}
