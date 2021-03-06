# Volatilty Cheatsheet

In Vol.py we like 'x' (cross reference) tools like psXview (instead of psview)

[Automated Script (needs work)](automate_vol.sh)



### Get from .dmp to raw with imagecopy

HINT: Volatility LOVES raw

1. `vol.py -f Windows\ 10\ x64-Snapshot2.vmsn -O rawWin.dd imagecopy`
    - vmsn requires a snapshot

2. `vol.py -f memory.dmp --profile=Win10x64_15063 imagecopy -O copy.raw`

*Not necessary though. Can use vmem of snapshot just fine.

### Linux KDBGscan

In Linux, to find the KDBG block/os-info just grep for "BOOT_IMAGE".

Src: [OSDFcon2020 Overcoming Volatility Obstacles](https://www.osdfcon.org/events_2020/memory-forensics/)

### File Recovery:

- filescan
- dumpfile -Q [offset] -D [dump-dir]
- cat fiel.None.[offset].dat

### File Recovery of Currently Open File:

- psscan
- procdump -p [pid] -D [dump-dir]

### Recover Password:

- hivelist
- hashdump # y is the virtual offset of the SAM hive and s is the SYSTEM hive
- john --wordlist=wordlist hashes.txt 

### Recent Docs:

`vol.py -f Windows\ 7\ x64-Snapshot1.vmem --profile=Win7SP1x64 dumpregistry -D output`

Then **RegRipper** -- [see that document for more info](../regripper/regripper.md)

### Baselines:

- `PROCESSBL` - to find new DLLs
- `SERVICESBL` - to find modified service configurations
- `DRIVERBL` - to find new drivers

Thnx [13Cubed](https://www.youtube.com/watch?v=1thWaC6uvI4) referencing [csababarta github](https://github.com/csababarta/volatility_plugins)



## Troubleshooting

### Dependancies 

Crypto slow-down: ~~`$sudo python -m easy_install --upgrade pyOpenSSL`~~ `$ pip install pyopenssl`

Distorm3: `$sudo pip install distorm3-3.4.4`

### Corrupt Memory Sample

If memory sample is corrupts nad can't get another, suggested (from OSDFcon2020) to use [Bulk Extractor](https://www.github.com/simsong/bulk_extractor) and/or Vol.py's *mftparser*.

## Resources

- <https://medium.com/@zemelusa/first-steps-to-volatile-memory-analysis-dcbd4d2d56a1>
- <https://www.andreafortuna.org/2018/03/02/volatility-tips-extract-text-typed-in-a-notepad-window-from-a-windows-memory-dump/>
