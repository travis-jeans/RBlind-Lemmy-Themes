# Read Me

This document is a guide to producing the CSS in the rBlind Lemmy theme.

It might be helpful to those creating themes, or for people who would like to edit the existing rBlind theme.

## Requirements

- Any Operating System (OS)
- A text editor of your choosing
- A browser add on such as Stylus to preview and apply CSS styles

## Getting Started

Always build the Lemmy theme with SASS variables so the theme files are forward-compatible. This ensures the theme will adopt updates to the underlying Bootstrap theme and upstream default Lemmy theme.

The Lemmy rBlind theme is based off the Darkly Compact theme.

### Order of Inheritance

Each sccs variables file will import variables to be added to the output CSS file.

## Theme Variables

### Colour Contrast

The file `_variables.sccs1` has the arguments: 
- `$link-decoration: none;`
- `$min-contrast-ratio: 3;`
- `$font-size-root: 100%;`


### Buttons