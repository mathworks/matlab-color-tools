# MATLAB Color Toolbox

The MATLAB Color Toolbox is an experimental collection of MATLAB functions related
to color science computation, color scales, visualization, and ICC color profiles.
It is meant to supplement the capabilities of [MATLAB](https://www.mathworks.com/products/matlab.html)
and the [Image Processing Toolbox](https://www.mathworks.com/products/image.html).

The Color Toolbox is in early development, and it is not in a stable state. The functions
and their interfaces are regularly changing.

## Prerequisites

You need a recent version of [MATLAB](https://www.mathworks.com/products/matlab.html)
and the [Image Processing Toolbox](https://www.mathworks.com/products/image.html).

## Getting Started

To use the Color Toolbox, get the latest experimental release from the [releases
page](https://github.com/mathworks/matlab-color-toolbox/releases). Unzip the file
and double-click on the .mltbx file to launch the MATLAB add-on installer.

Convert an XYZ color to CIECAM02 to verify your installation.

```matlab
XYZ = [0.1901 0.2000 0.2178];
XYZ_w = [0.9505 1.0000 1.0888];
L_A = 318.31;
Y_b = 0.20;
surround = 'average';
out = xyz2ciecam02(XYZ,XYZ_w,L_A,Y_b,surround);
```

## Developer Workflow

Clone the repository. In MATLAB, cd into the top-level folder of your clone.
The following commands are available in the top-level folder.

```matlab
addsandbox      % Add the Color Toolbox functions to the MATLAB search path
rmsandbox       % Remove the Color Toolbox functions from the MATLAB search path
release         % Make an .mltbx file and put it in the releases folder
```

To run the tests, cd into the `tests` folder and type `runtests`.

## Built With

* [MATLAB](https://www.mathworks.com/products/matlab.html)
* [Image Processing Toolbox](https://www.mathworks.com/products/image.html)

## Contributing

No procedures have been established yet for contributions. Contact
[Steve Eddins](https://www.mathworks.com/matlabcentral/profile/contact/476476-steve-eddins)
for questions.

## Authors

* Steve Eddins - [seddins](https://github.com/seddins)

See also the list of [contributors](https://github.com/mathworks/matlab-color-toolbox/graphs/contributors)
who participated in this project.

## License

See the [license.txt](https://github.com/mathworks/matlab-color-toolbox/blob/master/license.txt)
file for details
