# Contributing to this game

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2019-2023 The Foundation for Public Code <info@publiccode.net> -->

🙇‍♀️ Thank you for contributing!

We love issues and pull requests from everyone.
If you're not comfortable with GitHub, you can email use your feedback at <info@publiccode.net>.

## Problems, suggestions and questions in issues

Please help development by reporting problems, suggesting changes and asking questions.
To do this, you can [create a GitHub issue](https://help.github.com/articles/creating-an-issue/) for this project in the [GitHub Issues for the Governance Game](https://github.com/publiccodenet/governance-game/issues).
Ideas for new calamities and scenarios are especially welcome.
Note: do **not** create public issues for security-related issues, instead, see how to [report security issues](SECURITY.md).

You don't need to change any of our code or documentation to be a contributor!

## Documentation and code in pull requests

To add to the documentation or code of one of our projects, make a pull request.

The Foundation for Public Code has committed to make sure that maintainers are available to review contributions with an aim to provide feedback within two business days.

If you've never used GitHub, get up to speed with [Understanding the GitHub flow](https://guides.github.com/introduction/flow/) or follow one of the great free interactive courses in the [GitHub learning lab](https://lab.github.com/) on working with GitHub and Markdown, the syntax this project's documentation is in.

### 0. Expectations

#### Licensing

This project is [licensed CC 0](LICENSE).
By contributing you agree to release all your contributions to it under the same license.

#### Standards

Contributions should follow the requirements set out in the criteria of the [Standard for Public code](https://standard.publiccode.net/).
Reviewers will also be ensuring that contributions are aligned with the [values of public code](https://standard.publiccode.net/introduction.html#values-of-public-code).

### 1. Make your changes

This project uses the [GitFlow branching model and workflow](https://nvie.com/posts/a-successful-git-branching-model/).
When you've forked this repository, please make sure to create a feature branch following the GitFlow model.

Add your changes in commits [with a message that explains them](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message).
Document choices or decisions you make in the commit message as this will enable everyone to be informed of your choices in the future.

Words which are not normally recognized by the spell-checker can be added to the `jargon.txt`.

If you are adding or changing code, including the `Makefile`, make sure you've added and updated the relevant documentation and tests before you submit your pull request.
Make sure the tests show the behavior of the newly added or changed code.

#### Adding a new card

1. Create a new `.tex` file in the [cards](./cards/) directory. It's easiest to copy an existing card of the same type. Make sure that the file name starts with the card type followed by the card name in [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case).
2. Add the card name in the appropriate section in the [Makefile](Makefile).
3. Add the `.svg` image to use on the card (if the card type uses images) in the [assets](./assets/) directory.
4. If a new image was used, add appropriate credits for the image in [cards/rules-credits.tex](./cards/rules-credits.tex) and in [CREDITS.md](CREDITS.md).

#### Adding a printing process

After successfully printing a deck through a new service, please document that practice to help more people produce their own deck of cards.

1. Modify the [Makefile](Makefile) to generate cards to the specifications required for the printer.
2. Add a new section in [PRINTING.md](PRINTING.md) with a heading name of the printing service/company with the country in parentheses. This section should explain what arguments to use when calling `make` and what files are generated, include a link to the product page or similar and roughly explain the process for placing an order. Any extra comments, or known problems, that help someone use that service are welcome.

#### Style and standards

Card content should be general enough to apply to modeling collaboration in many contexts of public code codebases, rather than specific to any narrow group.

Text should aim for plain English with American English spelling.
Text should aim for a lower secondary education reading level, thus aligning to the [Web Content Accessibility Guidelines 2](https://www.w3.org/WAI/WCAG21/quickref/?showtechniques=315#readable) recommendation.

Where possible, choose text rather than binary file formats, for example the `assets` directory contains human readable Scalable Vector Graphics (`.svg`) files rather than binary images.

### 2. Pull request

When submitting the pull request, please include a description of the problem you are trying to solve and the issue numbers that this pull request will fix.
It is preferred for each pull request to address a single issue where possible.
In some cases a single set of changes may address multiple issues, in which case be sure to list all issue numbers fixed.

### 3. Improve

All contributions have to be reviewed by someone.
Reviewers will help you ensure that the content of the contribution aligns with Style and standards.

It could be that your contribution can be merged immediately by a maintainer.
However, usually, a new pull request needs some improvements before it can be merged.
Other contributors (or helper robots) might have feedback.
If this is the case the reviewing maintainer will help you improve your documentation and code.

If your documentation and code have passed human review, your pull request will be merged.

### 4. Celebrate

Your ideas, documentation and code have become an integral part of this project. You are the open source hero we need!

---

For more information on how to use and contribute to this project, please read the [`README`](README.md).
