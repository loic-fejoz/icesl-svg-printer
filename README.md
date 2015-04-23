IceSL SVG Printer
=================

Description
-----------

A special 3D "printer" configuration for [IceSL](http://www.loria.fr/~slefebvr/icesl/) that generates SVG instead of GCode.

This is an experimental use of IceSL as a 3D viewer and paths generator for laser engraver that cannot handle GCode as input.

NB: This project is not affiliated to IceSL even if the main author know its authors in person.

Usage
-----

1. Select the printer in the left menu.
2. Check for proper configuration of brushes. (See installation of the settings file)
3. Slice your model.
4. `sed -r "/^;\\s*\(.*\)\\s*$/d" <your filename>.gcode > <your filename>.svg`.
5. Inspect the result (with Inkscape for instance).

Installation
------------

1. `cd <your IceSL path>/gcode`
2. `git clone git@github.com:loic-fejoz/icesl-svg-printer.git`
3. copy [settings_icesl-svg-printer.xml](https://raw.githubusercontent.com/loic-fejoz/icesl-svg-printer/master/settings_icesl-svg-printer.xml) in
 - the bin folder if you run MS/Windows,
 - ~/.icesl/ directory if you run on Linux.

Troubleshooting
---------------
You may need to disable shield plugin to avoid segmentation fault.

Contribute
----------

If you would like to hack on icesl-svg-printer, start by forking the repo on GitHub:

https://github.com/loic-fejoz/icesl-svg-printer

The best way to contribute is probably one of the following:

* Clone the repo and follow [GitHub Workflow](https://guides.github.com/introduction/flow/index.html).
* Contact [Me <loic@fejoz.net>](mailto:loic@fejoz.net).
* Visit Me.

Authors
-------

This is a list of people who have contributed code or ideas to icesl-svg-printer --
for copyright purposes or whatever.

* Loïc Fejoz <loic@fejoz.net> <https://github.com/loic-fejoz/>
