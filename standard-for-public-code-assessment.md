# The Governance Game and the Standard for Public Code version 0.5.0

<!-- SPDX-License-Identifier: CC0-1.0 -->
<!-- SPDX-FileCopyrightText: 2022-2023 by The Foundation for Public Code <info@publiccode.net>, https://standard.publiccode.net/AUTHORS -->

Link to commitment to meet the Standard for Public Code: [README](./README.md)

## [Code in the open](https://standard.publiccode.net/criteria/code-in-the-open.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All source [code](https://standard.publiccode.net/glossary.html#code) for any [policy](https://standard.publiccode.net/glossary.html#policy) in use (unless used for fraud detection) MUST be published and publicly accessible. | n/a  |
All source code for any software in use (unless used for fraud detection) MUST be published and publicly accessible. | yes |
Contributors MUST NOT upload sensitive information regarding users, their organization or third parties to the [repository](https://standard.publiccode.net/glossary.html#repository). | yes |
Any source code not currently in use (such as new versions, proposals or older versions) SHOULD be published. | yes |
Documenting which source code or policy underpins any specific interaction the [general public](https://standard.publiccode.net/glossary.html#general-public) may have with an organization is OPTIONAL. | n/a |

## [Bundle policy and source code](https://standard.publiccode.net/criteria/bundle-policy-and-code.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST include the [policy](https://standard.publiccode.net/glossary.html#policy) that the source [code](https://standard.publiccode.net/glossary.html#code) is based on. | n/a |
The codebase MUST include all source code that the policy is based on, unless used for fraud detection. | n/a |
Policy SHOULD be provided in machine readable and unambiguous formats. | n/a |
[Continuous integration](https://standard.publiccode.net/glossary.html#continuous-integration) tests SHOULD validate that the source code and the policy are executed coherently. | n/a |

## [Create reusable and portable code](https://standard.publiccode.net/criteria/reusable-and-portable-codebases.html)

- [ ] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST be developed to be reusable in [different contexts](https://standard.publiccode.net/glossary.html#different-contexts). | yes | Context specific cards are intended to be easy to add.
The codebase MUST be independent from any secret, undisclosed, proprietary or non-open licensed [code](https://standard.publiccode.net/glossary.html#code) or services for execution and understanding. | yes |
The codebase SHOULD be in use by multiple parties. | yes |
The roadmap SHOULD be influenced by the needs of multiple parties. | | GitHub issues and the roadmap are open, but little outside input yet.
Configuration SHOULD be used to make code adapt to context specific needs. | n/a | So far, nothing to configure; different printing options are included
The codebase SHOULD be localizable. |  |
Code and its documentation SHOULD NOT contain situation-specific information. | yes |
Codebase modules SHOULD be documented in such a way as to enable reuse in codebases in other contexts. | yes |

## [Welcome contributors](https://standard.publiccode.net/criteria/open-to-contributions.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST allow anyone to submit suggestions for changes to the codebase. | yes |
The codebase MUST include contribution guidelines explaining what kinds of contributions are welcome and how contributors can get involved, for example in a `CONTRIBUTING` file. | yes |
The codebase MUST document the governance of the codebase, contributions and its community, for example in a `GOVERNANCE` file. | yes |
The codebase SHOULD advertise the committed engagement of involved organizations in the development and maintenance. | yes |
The codebase SHOULD have a publicly available roadmap. | yes |
The codebase SHOULD publish codebase activity statistics. | yes | [GitHub pulse](https://github.com/publiccodenet/governance-game/pulse)
Including a code of conduct for contributors in the codebase is OPTIONAL. | yes |

## [Make contributing easy](https://standard.publiccode.net/criteria/make-contributing-easy.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST have a public issue tracker that accepts suggestions from anyone. | yes |
The codebase MUST include instructions for how to privately report security issues for responsible disclosure. | yes |
The documentation MUST link to both the public issue tracker and submitted codebase changes, for example in a `README` file. | yes |
The codebase MUST have communication channels for users and developers, for example email lists. | yes | [GitHub Discussions](https://github.com/publiccodenet/governance-game/discussions)
The documentation SHOULD include instructions for how to report potentially security sensitive issues on a closed channel. | yes |

## [Maintain version control](https://standard.publiccode.net/criteria/version-control-and-history.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The community MUST have a way to maintain [version control](https://standard.publiccode.net/glossary.html#version-control) for the [code](https://standard.publiccode.net/glossary.html#code). | yes |
All files in the [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST be version controlled. | yes |
All decisions MUST be documented in commit messages. | yes | (since 1.0.0)
Every commit message MUST link to discussions and issues wherever possible. | yes | since 1.0.0
The codebase SHOULD be maintained in a distributed version control system. | yes |
Contributors SHOULD group relevant changes in commits. | yes |
Maintainers SHOULD mark released versions of the codebase, for example using revision tags or textual labels. | yes |
Contributors SHOULD prefer file formats where the changes within the files can be easily viewed and understood in the version control system. | yes |
It is OPTIONAL for contributors to sign their commits and provide an email address, so that future contributors are able to contact past contributors with questions about their work. | yes |

## [Require review of contributions](https://standard.publiccode.net/criteria/require-review.html)

- [ ] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All contributions that are accepted or committed to release versions of the [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST be reviewed by another contributor. | yes |
Reviews MUST include source, [policy](https://standard.publiccode.net/glossary.html#policy), tests and documentation. | yes |
Reviewers MUST provide feedback on all decisions to not accept a contribution. | yes |
Contributions SHOULD conform to the standards, architecture and decisions set out in the codebase in order to pass review. | yes |
Reviews SHOULD include running both the [code](https://standard.publiccode.net/glossary.html#code) and the tests of the codebase. | yes |
Contributions SHOULD be reviewed by someone in a different context than the contributor. |  |
Version control systems SHOULD NOT accept non-reviewed contributions in release versions. | yes |
Reviews SHOULD happen within two business days. | yes |
Performing reviews by multiple reviewers is OPTIONAL. |  |

## [Document codebase objectives](https://standard.publiccode.net/criteria/document-objectives.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST contain documentation of its objectives, like a mission and goal statement, that is understandable by developers and designers so that they can use or contribute to the codebase. | yes |
Codebase documentation SHOULD clearly describe the connections between [policy](https://standard.publiccode.net/glossary.html#policy) objectives and codebase objectives. | n/a |
Documenting the objectives of the codebase for the [general public](https://standard.publiccode.net/glossary.html#general-public) is OPTIONAL. | yes |

## [Document the code](https://standard.publiccode.net/criteria/documenting.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All of the functionality of the [codebase](https://standard.publiccode.net/glossary.html#codebase), [policy](https://standard.publiccode.net/glossary.html#policy) as well as source, MUST be described in language clearly understandable for those that understand the purpose of the [code](https://standard.publiccode.net/glossary.html#code). | yes |
The documentation of the codebase MUST contain a description of how to install and run the source code. | yes |
The documentation of the codebase MUST contain examples demonstrating the key functionality. | yes | video linked in README
The documentation of the codebase SHOULD contain a high level description that is clearly understandable for a wide audience of stakeholders, like the [general public](https://standard.publiccode.net/glossary.html#general-public) and journalists. | yes |
The documentation of the codebase SHOULD contain a section describing how to install and run a standalone version of the source code, including, if necessary, a test dataset. | yes |
The documentation of the codebase SHOULD contain examples for all functionality. | yes | video and README
The documentation SHOULD describe the key components or modules of the codebase and their relationships, for example as a high level architectural diagram. | n/a | There are .tex files and a Makefile, no architecture
There SHOULD be [continuous integration](https://standard.publiccode.net/glossary.html#continuous-integration) tests for the quality of the documentation. | yes |
Including examples that make users want to immediately start using the codebase in the documentation of the codebase is OPTIONAL. | yes |

## [Use plain English](https://standard.publiccode.net/criteria/understandable-english-first.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All [codebase](https://standard.publiccode.net/glossary.html#codebase) documentation MUST be in English. | yes |
All [code](https://standard.publiccode.net/glossary.html#code) MUST be in English, except where [policy](https://standard.publiccode.net/glossary.html#policy) is machine interpreted as code. | yes |
All bundled policy not available in English MUST have an accompanying summary in English. | n/a |
Any translation MUST be up to date with the English version and vice versa. | n/a |
There SHOULD be no acronyms, abbreviations, puns or legal/non-English/domain specific terms in the codebase without an explanation preceding it or a link to an explanation. | yes |
Documentation SHOULD aim for a lower secondary education reading level, as recommended by the [Web Content Accessibility Guidelines 2](https://www.w3.org/WAI/WCAG21/quickref/?showtechniques=315#readable). | yes |
Providing a translation of any code, documentation or tests is OPTIONAL. |  |

## [Use open standards](https://standard.publiccode.net/criteria/open-standards.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
For features of the [codebase](https://standard.publiccode.net/glossary.html#codebase) that facilitate the exchange of data the codebase MUST use an [open standard](https://standard.publiccode.net/glossary.html#open-standard) that meets the [Open Source Initiative Open Standard Requirements](https://opensource.org/osr). | n/a |
Any non-open standards used MUST be recorded clearly as such in the documentation. | n/a |
Any standard chosen for use within the codebase MUST be listed in the documentation with a link to where it is available. | yes |
Any non-open standards chosen for use within the codebase MUST NOT hinder collaboration and reuse. | n/a |
If no existing open standard is available, effort SHOULD be put into developing one. | n/a |
Open standards that are machine testable SHOULD be preferred over open standards that are not. | n/a |
Non-open standards that are machine testable SHOULD be preferred over non-open standards that are not. | n/a |

## [Use continuous integration](https://standard.publiccode.net/criteria/continuous-integration.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All functionality in the source [code](https://standard.publiccode.net/glossary.html#code) MUST have automated tests. | yes | Tests cover .pdf creation and page count
Contributions MUST pass all automated tests before they are admitted into the [codebase](https://standard.publiccode.net/glossary.html#codebase). | yes |
The codebase MUST have guidelines explaining how to structure contributions. | yes |
The codebase MUST have active contributors who can review contributions. | yes |
The codebase guidelines SHOULD state that each contribution should focus on a single issue. | yes |
Source code test and documentation coverage SHOULD be monitored. | n/a | The only code in the repository is test code, the workflow, and the Makefile
Testing [policy](https://standard.publiccode.net/glossary.html#policy) and documentation for consistency with the source and vice versa is OPTIONAL. | n/a |
Testing policy and documentation for style and broken links is OPTIONAL. |  |
Testing the code by using examples in the documentation is OPTIONAL. |  |

## [Publish with an open license](https://standard.publiccode.net/criteria/open-licenses.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
All [code](https://standard.publiccode.net/glossary.html#code) and documentation MUST be licensed such that it may be freely reusable, changeable and redistributable. | yes |
Software source code MUST be licensed under an [OSI-approved or FSF Free/Libre license](https://spdx.org/licenses/). | yes | CC0 1.0
All code MUST be published with a license file. | yes |
Contributors MUST NOT be required to transfer copyright of their contributions to the [codebase](https://standard.publiccode.net/glossary.html#codebase). | yes |
All source code files in the codebase SHOULD include a copyright notice and a license header that are machine-readable. | yes |
Having multiple licenses for different types of code and documentation is OPTIONAL. |  |

## [Make the codebase findable](https://standard.publiccode.net/criteria/findability.html)

- [ ] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST be findable using a search engine by describing the problem it solves in natural language. |  |
The codebase MUST be findable using a search engine by codebase name. | yes |
The name of the codebase SHOULD be descriptive and free from acronyms, abbreviations, puns or organizational branding. | yes |
Maintainers SHOULD submit the codebase to relevant software catalogs. |  |
The codebase SHOULD have a website which describes the problem the codebase solves using the preferred jargon of different potential users of the codebase (including technologists, policy experts and managers). | yes |
The codebase SHOULD have a unique and persistent identifier where the entry mentions the major contributors, [repository](https://standard.publiccode.net/glossary.html#repository) location and website. |  |
The codebase SHOULD include a machine-readable metadata description, for example in a [publiccode.yml](https://github.com/publiccodeyml/publiccode.yml) file. | yes |
A dedicated domain name for the codebase is OPTIONAL. |  |
Regular presentations at conferences by the community are OPTIONAL. |  |

## [Use a coherent style](https://standard.publiccode.net/criteria/style.html)

- [ ] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST use a coding or writing style guide, either the codebase community's own or an existing one referred to in the codebase. |  |
Contributions SHOULD pass automated tests on style. |  |
The style guide SHOULD include expectations for inline comments and documentation for non-trivial sections. |  |
Including expectations for [understandable English](https://standard.publiccode.net/criteria/understandable-english-first.html) in the style guide is OPTIONAL. |  |

## [Document codebase maturity](https://standard.publiccode.net/criteria/document-maturity.html)

- [x] criterion met.

Requirement | meets | &nbsp;links&nbsp;and&nbsp;notes&nbsp;
-----|-----|-----
The [codebase](https://standard.publiccode.net/glossary.html#codebase) MUST be versioned. | yes |
The codebase MUST prominently document whether or not there are versions of the codebase that are ready to use. | yes |
Codebase versions that are ready to use MUST only depend on versions of other codebases that are also ready to use. | yes |
The codebase SHOULD contain a log of changes from version to version, for example in the `CHANGELOG`. | yes |
The method for assigning version identifiers SHOULD be documented. | yes |
It is OPTIONAL to use semantic versioning. | yes |
