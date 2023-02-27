# Printing a deck of the Governance Game

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2022-2023 The Foundation for Public Code <info@publiccode.net> -->

This file documents the different ways people have printed a deck of the Governance Game.
Each section provides details for a different service provider or method of creating the deck.

## Printer's Studio (Germany)

Start by building the files using `make number-pdfs`.
This will generate a bunch of files, and the ones that will be used for printing will be placed in the folders `num-front` and `num-back`.
You can use either the PDF files or the PNG files when ordering, but the PDF adds an extra handling fee. The list below describes the process for PNG files.

The product to order is [Blanko Spielkarten 63 x 88mm Personalisieren](https://www.printerstudio.de/machen/blanko-spielkarten-63x88mm-personalisieren.html).
The three options on the product page are for the quality of the paper, how many cards are in a deck and what kind of box you want.

1. Select the options you want, for the number of cards you need to select the option that is higher than or equal to the highest number on the card files. If you want printed deck boxes, select `Personalisierte Faltschatel` under `Wählen Sie Felder ein:`.s
2. In the next popup, enter the exact number of cards (this is also the same as the highest number on the card files).
3. Choose `ANDERES MOTIV`.
4. Press `BILDER HOCHLADEN` to upload all the images from the `num-front` folder.
5. Drag the images onto the cards on the left and press `WEITER`.
6. Press `WEITER`.
7. Choose `ANDERES MOTIV`.
8. Press `BILDER HOCHLADEN` to upload all the images from the `num-back` folder.
9. Drag the images onto the cards on the left and be sure to match the right backside with the right card number. Press `WEITER`.
10. Press `WEITER`.
11. Review that fronts and backs match, check the copyright box and press `ZUM EINKAUFSWAGEN`.
12. Select shipping and payment to your needs and your done.

### Box

The PDF for the box can be found in the [latest release assets](https://github.com/publiccodenet/governance-game/releases/latest).
