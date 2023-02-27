# Governance Game

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2019-2023 The Foundation for Public Code <info@publiccode.net> -->

![version 1.0.1](https://img.shields.io/badge/version-1.0.1-gree.svg)
[![release-on-tag](https://github.com/publiccodenet/governance-game/actions/workflows/release-on-tag.yml/badge.svg)](https://github.com/publiccodenet/governance-game/actions/workflows/release-on-tag.yml)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](http://creativecommons.org/publicdomain/zero/1.0/)

[![Introduction video to the game](images/video-preview.jpg)](https://www.youtube.com/watch?v=Dt0WFla4eeM)

This is a game on governance of [Public Code](https://about.publiccode.net/glossary/public-code-definition.html).
Use this as a way to get a conversation and reflection about governance started.
We aim to use it during [early incubation of a codebase](https://about.publiccode.net/activities/codebase-stewardship/product-assets-for-early-incubation.html), or perhaps even earlier.
You can of course play the game totally without our involvement, it is probably useful for any constellation that have a codebase to govern.

## Playing the game

You need a few people to play with you.
There is no strict number, but you all need to be able to see and reach the cards on the table.
For the actual rules, see the rules cards.

![A picture of the cards in the game on a table](images/cards-640px.jpg)

## Print your own version

See [PRINTING](PRINTING.md) for tested printing methods.

## Contributing

We love when people want to help improve the game.
Please read [CONTRIBUTING](CONTRIBUTING.md) for our process for submitting issues and pull requests to us.
Also take a look at our [Code of Conduct](CODE_OF_CONDUCT.md).
We want this to be an inclusive and welcoming community.

It is the intent of the Governance Game development community to develop the game collaboratively.
Adhering to the criteria set forth in the [Standard for Public Code](https://standard.publiccode.net/) gives us confidence in the process.
Therefore, the [Foundation for Public Code](https://publiccode.net/) is committed to maintaining and developing the Governance Game at a level of quality that meets the Standard for Public Code.

## Roadmap

1. Iterate on the cards and rules.
2. Create custom icons/imagery, [issue #3](https://github.com/publiccodenet/governance-game/issues/3)
3. Script updateable box design

## Versioning

We use [Semantic Versioning](http://semver.org/) for versioning.
For the versions available, see the [tags on this repository](https://github.com/publiccodenet/governance-game/tags) (and [change log](CHANGELOG.md)).

## Authors

See the list of [authors](AUTHORS.md) for who participated in this project.

## Credits

For now we're using icons from the awesome [Noun Project](https://thenounproject.com).
Those icons are all under the license [CC BY](https://creativecommons.org/licenses/by/3.0/us/legalcode).
Find all images used and their creators in our [Credits](CREDITS.md).

We also want to thank everyone who has played the game with us.
Even if you didn't explicitly give us feedback we learned about the game by playing with you.

## Building cards

The Makefile automatically generates a complete card deck for the Governance Game in PDF and PNG.

### Dependencies

```
sudo apt install docbook-utils pandoc inkscape texlive texlive-fonts-extra \
	texlive-extra-utils qpdf aspell aspell-en
# sudo apt install texlive-full
```

The `Inter` font family is used.
The `texlive-fonts-extra` package provides `latex/inter/inter.sty`.
To generate `.png` files, `inkscape` requires these fonts to be installed.
Download the [Inter font family](https://fonts.google.com/specimen/Inter).
Ensure that the fonts are installed in your system, for example
[Debian Installation of True Type Fonts](https://wiki.debian.org/TrueType#Installation_of_True_Type_Fonts).
Or `make ensure-font` to run [`script/ensure-font.sh`](script/ensure-font.sh).

### Usage

Type `make` to generate the PDF files.

Type `make view-all` to view all of the PDF files generated.

## License

This project is licensed under the CC 0 License, see the [LICENSE](LICENSE) file for details.
