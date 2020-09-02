# Linux Recovery

## Recovery Boot to Shell

Want to get into "Single User Mode"

1. Normal (hit f5 but not really)
2. Over a network
3. USB

### Single User Mode

- Will give you limited shell
- only `/root` is loaded
  - RHEL typically tries to mount all partitions
- Troubleshooting
  - If you want to remount to write: `#mount -o rw,remount /`
  - If problems, use `#fsck` (like `C:> checkdisk` on Windows)
- Great if you forget hte root password via `#passwd`