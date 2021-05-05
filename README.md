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
