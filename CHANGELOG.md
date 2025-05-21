# Changelog

## 2025-05-21

The following changes are to make the RBlind theme files suitable to upload to lemmy-ui as noted in [Pull Request 3159](https://github.com/LemmyNet/lemmy-ui/pull/3159).

- Renamed `RBlind-Theme.css` to `RBlind-Theme.scss`
- Moved `RBlind-Theme.css` to the directory above
- Removed the author line and license statement from the code files (note: the license still applies!)
- Changed the import directory for `RBlind-Theme.scss` to be a directory above in `RBlind-Light.scss` and `RBlind-Dark.scss`.
- Finally added a version tag to the release.

## 2025-05-20

### 1.0.4

- Updated the comment thread line colours to use root variables in accordance with [Pull Request 2946](https://github.com/LemmyNet/lemmy-ui/pull/2946)
- Relating to the above, changed the comment thread colours to a value adjusted version dependent on the theme (light/dark) and step (gradually increase or decrease in brightness)
- Additional branches are test variations on the colour theme (keep in mind they have conflicts with the master branch if you plan to tinker with them).
- Renamed the RBlind-Dark-Loader.scss and RBlind-Light-Loader.scss files to RBlind-Dark.scss and RBlind-Light.scss, respectively.

## 2025-04-09

### 1.0.3

- Improved appearance of community list names on very small screens
- Updated the themes to the latest copies at lemmy-ui which include the comment thread left border and widths as variables [Pull Request 2946](https://github.com/LemmyNet/lemmy-ui/pull/2946), [Pull Request 2945](https://github.com/LemmyNet/lemmy-ui/pull/2945)
- Reverted "Only moderators can post to community" checkbox size to normal due to [Pull Request 3046](https://github.com/LemmyNet/lemmy-ui/pull/3046)
- Removed superfluous focus indicator additions to navigation button and Show/Hide Hidden Posts buttons due to [Pull Request 4038](https://github.com/LemmyNet/lemmy-ui/pull/3048) and [Pull Request 3047](https://github.com/LemmyNet/lemmy-ui/pull/3047)
- Removed overly specific class selectors for underlining links due to the addition of the main element on more pages [Pull Request 2944](https://githu.cbom/LemmyNet/lemmy-ui/pull/2944)
- Updated the Cannot Be Changed section to remove some issues due to lemmy-ui CSS fixes: The comment left and width variable changes as mentioned above plus [Closed Issue 2888](https://github.com/LemmyNet/lemmy-ui/issues/2888)
- Stopped loading the RBlind-Theme.scss file twice and added instructions for users to re-add it if noticing style issues with external stylesheets
- Changed author email listed in the README due to changed domain

## 2025-01-27

### 1.0.2

- Improved contrast on post and comment dividers
- Added advice to handle theme variable conflicts under Limitations, External Style Sheets
- Changed the Original Poster (OP) marker to be a lighter colour to distinguish it from the poster name colour
- Updated screenshots of home and comments to show the dividers and OP marker change

## 2025-01-10

- Added Github issues to the README
- Added preview image

## 2025-01-07

### 1.0.1

- Bug fix for poor contrast text on code snippet in "You are logged out" sidebar alert
- Added a new section Installation to the README
- Fixed some typos in the README

## 2025-01-06

### 1.0.0

- The code is made available on GitHub and Codeberg
