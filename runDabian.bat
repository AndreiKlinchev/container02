REM Файл запуска debian
qemu-system-x86_64 -hda debian.qcow2 -m 4G -smp 2 -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::1080-:80,hostfwd=tcp::1022-:22
