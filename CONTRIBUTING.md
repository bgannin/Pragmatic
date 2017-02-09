# Introduction

This is a set of guidelines centered around contributing to Pragmatic. Please keep these in mind when preparing or reviewing a pull request. They aren't meant to be annoying, just a baseline.

# Community

## Code of Conduct

Please help us keep this community open, friendly, and inclusive by reading and following our [code of conduct](CODE_OF_CONDUCT.md).

## Our Thanks

Pragmatic would not have been possible without the [other excellent Xcode extensions](https://github.com/tib/awesome-xcode-extensions) for a jumpstart and continues to improve due to contributors such as yourself. Thank you for donating your time!

# Coding

The long-term health of any project is quite important; these are a few guidelines to follow to keep ours in top shape.

## Language 

All parts have been written in Swift and we'd like to continue that for the foreseeable future. If there's a compelling reason to introduce non-Swift code please bridge it appropriately and test thoroughly.

## Warnings

Note the number of general warnings prior to your change with a clean build. Repeat with your changes. These should be the same or less with your changes. The goal is to maintain zero build warnings. 

If you cannot avoid a warning be sure to note this and the reason for it in your PR as well as with a comment in the code if possible.

## Static Analyzer

Note the number of analyzer results prior to your change with a clean build. Repeat with your changes. These should be the same or less with your changes.

If you cannot avoid triggering a new result be sure to note this and the reason for it in your PR as well as with a comment in the code if possible.

## Tabs vs Spaces

Let `\t` be your guide. Please ensure your favorite editor is configured to respect this; Xcode can be set to use tabs (Preferences -> Editing -> Indentation) and allows you to choose how that character is displayed.
