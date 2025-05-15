ZeroConf Scripts for Pharo
===========================

This project is used to create bash scripts to easily download and install Pharo images and VMs.
You can see it in live action under <https://get.pharo.org>.


## Code loading

```smalltalk
Metacello new
   baseline: 'ZeroConf';
   repository: 'github://pharo-project/pharo-zeroconf/mc';
   load.
```

## How to

To make a new Pharo zeroconf release

1. Update the class side methods of ZeroConfCommandLineHandler:
 - add the new versions to the image and vm version lists
 - change the stable and alpha versions
 See for example commit (f50e6761af355d228ee651b45fbb421e082e57db)
2. Commit
3. Generate the code in `[pwd]/out` from playground: `ZeroConfCommandLineHandler generate`
4. Copy the generated files to /generated
5. Commit (from command line)