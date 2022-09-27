<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- written in 2022 by The Foundation for Public Code <info@publiccode.net> -->
# Releasing a new version of the Governance game

1. Review state of the 'develop' branch
    - Ensure all changes intended for release are merged
    - Invite a proofread of the current state of the branch
2. Create a release branch
    - From 'develop', `git checkout -b "release-$MAJOR.$MINOR.$PATCH"`
    - Push the branch, `git push -u origin release-$MAJOR.$MINOR.$PATCH`
3. Update the new release
    - [ ] Update version number in `rules-about-tex`
    - [ ] Update [`AUTHORS.md`](../AUTHORS.md) with new contributors
    - [ ] Update [`CHANGELOG.md`](../CHANGELOG.md)
    - [ ] Perform extra pass on diff to the 'main' branch
        - run `make view-all`
        - Ensure no cards runs over two pages
        - If needed, commit fixes and repeat extra pass
    - [ ] Push branch, open a pull request to the 'main' branch
        - Request review
        - Reviewers will create issues for shortcomings found which would not prevent release
        - If needed for release, reviewers may create PRs to resolve issues
        - Re-request reviews if additional PRs are merged into release branch
    - [ ] Once reviews are complete, merge to 'main'
4. Create GitHub release with the release notes and version number
    - [ ] Switch to the 'main' branch, `git pull` and `git status`
    - [ ] `git tag $MAJOR.$MINOR.$PATCH`
    - [ ] `git push --tags`
    - [ ] From https://github.com/publiccodenet/standard/tags select "create release"
        - Add changelog bullets
5. Card Generation
    - [ ] Generate new PDFs and PNGs
        - Ensure fonts are installed
        - Make cards with `make number-pdfs`
        - Optionally, for a visual pre-check, view all the files
        - Create zip files for the pdfs and pngs with `zip 
governance-game-cards-pdf.$MAJOR.$MINOR.$PATCH.zip
 $(find ./num-front ./num-back/ -name '*.pdf')` and `zip 
governance-game-cards-png.$MAJOR.$MINOR.$PATCH.zip
 $(find ./num-front ./num-back/ -name '*.png')`
    - [ ] Add zip files to release, if the box design is updaed, add it as well
        - In a browser navigate to the release and 'edit'
        - Drag-and-drop the files into the assets
7. Update 'develop' with a merge from 'main'
8. [Send the files for print to the printer](PRINTING.md)
