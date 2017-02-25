# ```frugalresume```

![BSD3 license](https://img.shields.io/badge/licence-BSD%202--clause-blue.svg)

A curriculum vitae class for LuaLaTeX and XeLaTeX with classic typography and layout.

## Requirements

* [LuaTeX](http://luatex.org/) and LuaLaTeX, or [XeTeX](http://xetex.sourceforge.net/) and XeLaTeX
* [typographydefaults](https://github.com/kerscher/typographydefaults)
* [CTAN](http://www.ctan.org/) packages:
    * parskip
    * titlesec
    * xcolor
    * hyperref
    * enumitem
    * pdftexcmds
    * kvoptions

## Installation instructions

If you have a recent distribution of [TeX Live](https://www.tug.org/texlive/), you most likely have all the needed CTAN packages, as well as LuaTeX, LuaLaTeX, XeTeX and XeLaTeX. If you don't, check you operating system package manager, or [install manually those first](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages).

To install both ```frugalresume``` and ```typographydefaults``` once the requirements are in place and assuming you're using TeX Live on Linux:

```shell
pushd ~/texmf/tex/latex
git clone git://github.com/kerscher/typographydefaults
popd; pushd ~/texmf/tex/latex/base
git clone git://github.com/kerscher/frugalresume
popd
texhash
```

If you're using other TeX distribution, check on its documentation how to install a package or [read more about it here](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages).

## Licence

This package uses a 2-clause BSD-like licence. You can check it [here](LICENCE.md).
