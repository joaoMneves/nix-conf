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

  services.thermald.enable = true;

  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #     CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  #
  #     CPU_MIN_PERF_ON_AC = 0;
  #     CPU_MAX_PERF_ON_AC = 100;
  #     CPU_MIN_PERF_ON_BAT = 0;
  #     CPU_MAX_PERF_ON_BAT = 20;
  #
  #     #Optional helps save long term battery health
  #     START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
  #     STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
  #
  #   };
  # };

  # Permissões
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="power_supply", KERNEL=="BAT0", RUN+="${pkgs.coreutils}/bin/chmod 0664 /sys/class/power_supply/BAT0/charge_control_end_threshold"
  # '';

}
