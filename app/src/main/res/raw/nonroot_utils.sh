mount_partitions() {
  [ "`getprop ro.build.ab_update`" = "true" ] && SLOT=`getprop ro.boot.slot_suffix`
  # Check whether non rootfs root dir exists
  grep ' / ' /proc/mounts | grep -qv 'rootfs' && SYSTEM_ROOT=true || SYSTEM_ROOT=false
}

get_flags() {
  $SYSTEM_ROOT && KEEPVERITY=true || KEEPVERITY=false
  [ "`getprop ro.crypto.state`" = "encrypted" ] && KEEPFORCEENCRYPT=true || KEEPFORCEENCRYPT=false
  RECOVERYMODE=false
}

run_migrations() { return; }
