# Contributing to this game

🙇‍♀️ Thank you for contributing!

We love issues and pull requests from everyone.
If you're not comfortable with Github, you can email use your feedback at <info@publiccode.net>.

## Problems, suggestions and questions in issues

Please help development by reporting problems, suggesting changes and asking questions.
To do this, you can [create a GitHub issue](https://help.github.com/articles/creating-an-issue/) for this project in the [GitHub Issues for the Governance Game](https://github.com/publiccodenet/governance-game/issues).
Ideas for new calamities and scenarios are especially welcome.

You don't need to change any of our code or documentation to be a contributor!

## Documentation and code in pull requests

To add to the documentation or code of one of our projects, make a pull request.

If you've never used GitHub, get up to speed with [Understanding the GitHub flow](https://guides.github.com/introduction/flow/) or follow one of the great free interactive courses in the [GitHub learning lab](https://lab.github.com/) on working with GitHub and Markdown, the syntax this project's documentation is in.

This project is [licensed CC 0](LICENSE).
By contributing you agree to release all your contributions to it under the same license.

### 1. Make your changes

This project uses the [GitFlow branching model and workflow](https://nvie.com/posts/a-successful-git-branching-model/).
When you've forked this repository, please make sure to create a feature branch following the GitFlow model.

Add your changes in commits [with a message that explains them](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message).
Document choices or decisions you make in the commit message as this will enable everyone to be informed of your choices in the future.

If you are adding code, make sure you've added and updated the relevant documentation and tests before you submit your pull request.
Make sure to write tests that show the behavior of the newly added or changed code.

#### Adding a new card

1. Create a new `.tex` file in the [cards directory](https://github.com/publiccodenet/governance-game/tree/develop/cards). It's easiest to copy an existing card of the same type. Make sure that the file name starts with the card type followed by the card name in [kebab-case](https://en.wikipedia.org/wiki/Letter_case#Kebab_case).
2. Add the card name in the appropriate section in the [Makefile](https://github.com/publiccodenet/governance-game/blob/develop/Makefile).
3. Add the `.svg` image to use on the card (if the card type uses images) in the [assets directory](https://github.com/publiccodenet/governance-game/tree/develop/assets).
4. If an image was used, add appropriate credits for the image on the [credits card](https://github.com/publiccodenet/governance-game/blob/develop/cards/rules-credits.tex) and the [CREDITS file](https://github.com/publiccodenet/governance-game/blob/develop/CREDITS.md).

#### Adding a printing process

After successfully printing a deck through a new service, please document that practice to help more people produce their own deck of cards.

1. Modify the [Makefile](https://github.com/publiccodenet/governance-game/blob/develop/Makefile) to generate cards to the specifications required for the printer.
2. Add a new section on [PRINTING](PRINTING.md) with a heading name of the printing service/company with the country in parentheses. This section should explain what arguments to use when calling `make` and what files are generated, include a link to the product page or similar and roughly explain the process for placing an order. Any extra comments, or known problems, that help someone use that service are welcome.

### 2. Pull request

When submitting the pull request, please include a description of the problem you are trying to solve and the issue numbers that this pull request will fix.

### 3. Improve

All contributions have to be reviewed by someone.

It could be that your contribution can be merged immediately by a maintainer.
However, usually, a new pull request needs some improvements before it can be merged.
Other contributors (or helper robots) might have feedback.
If this is the case the reviewing maintainer will help you improve your documentation and code.

If your documentation and code have passed human review, your pull request will be merged.

### 4. Celebrate

Your ideas, documentation and code have become an integral part of this project. You are the open source hero we need!

---

For more information on how to use and contribute to this project, please read the [`README`](README.md).
