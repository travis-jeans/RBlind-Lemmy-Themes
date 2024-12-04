# Read Me

This document is a guide to producing the CSS in the rBlind Lemmy theme.

It might be helpful to those creating themes, or for people who would like to edit the existing rBlind theme.

## Requirements

- Any Operating System (OS)
- A text editor of your choosing
- A browser add on such as Stylus to transiently preview and apply CSS styles

## Getting Started

Always build the Lemmy theme with SASS variables so the theme files are forward-compatible. This ensures the theme will adopt updates to the underlying Bootstrap theme and upstream default Lemmy theme.

The Lemmy rBlind theme is based off the Darkly Compact theme.

### Setting Up Your Working Directory

To work locally in a different directory to the lemmy-ui files, copy the following files and paste them in your chosen directory (e.g. Darkly-Compact):

- `darkly-compact.css`    
- `darkly-compact.cssls.map`  
- `darkly-compact.scss`             
- `_variables.darkly.scss`
- `darkly-compact.cssls`  
- `darkly-compact.css.map`    
- `_variables.darkly-compact.scss`  
- `_variables.scss`

This is a backup of the default Darkly Compact theme.

Make an additional copy and rename it to something else. This duplicate directory will be the one we edit.

### Paths

So the sass command will build, all paths need to be pointing to the correct locations.

In line 59, `darkly-compact.scss` change the relative location of the bootstrap theme to an absolute path to prevent errors:

From `../../../../node_modules/bootstrap/scss/bootstrap` to the location of your lemmy-ui folder `/lemmy-ui/node_modules/bootstrap/scss/bootstrap`

**IMPORTANT** This relative path will need to be reverted back to the original once you have finished your edits and it is uploaded to the lemmy-ui folder.

### Building the output CSS file

Once you have made your desired changes to the scss variables, run the following command from the same directory using your terminal: 
`sass darkly-compact.scss darkly-compact.css`

### Order of Inheritance

Each sccs variables file will import variables to be added to the output CSS file.
If the bootstrap source is loaded too early, custom styles will not be applied. 
Conversley, if the bootstrap source is loaded last, the upstream bootstrap `!important` styles will override your custom CSS classes.
To fix this, an order of uploading files in `darkly-compact.scss` is:
1. `@import "variables.darkly-compact";`
2. Custom code
3. `@import "/lemmy-ui/node_modules/bootstrap/scss/bootstrap";`
4. Repeated custom code

This will insert your custom code at the beginning **and** the end of the output CSS file, meaning your styles will be applied correctly and the upstream bootstrap styles won't break.

## Theme Variables and Classes

All variables defined with the SASS variable indicator `$` are in `_variables.darkly.scss`.
All classes defined are in `darkly-compact.scss`.


### Colour Contrast

The file `_variables.sccs` has the arguments: 
- `$link-decoration: none;`
- `$min-contrast-ratio: 3;`
- `$font-size-root: 100%;`

The `$font-size-root: 100%` has been changed to `120%`.
`$min-contrast-ratio` is not a SCSS variable but is read by a bootstrap function `color-contrast()` in `/lemmy-ui/node_modules/bootstrap/scss/_functions.scss`.

### Buttons

### Fonts

#### Font Family

- `$font-family-sans-serif` values changed to `Verdana, sans-serif`
- Added `$font-family-monospace` and changed to `"Courier New", monospace`

#### Headings

- `$h1-font-size` changed from `3rem` to `5rem`
- `$h2-font-size` changed from `2.5rem` to `4rem`
- `$h3-font-size` changed from `2rem` to `3rem`
- Added `h4-font-size` changed from `1.5rem` to `2.5rem`
- Added `h5-font-size` changed from `1.25rem` to `2rem`
- Added `h6-font-size` changed from `1rem` to `1.5rem`

#### Paragraphs

- Added `.post-listing, p {
  line-height: 1.5em !important;
  margin-bottom: 1.5em !important;
}` to increase the paragraph line spacing and between paragraph spacing

#### Other

- Added `$font-size-root` added from `_variables.scss` and changed from `100%` to `120%`
- Added `small, .small {
  font-size: 1.25rem !important;
}` which increases the post author line

### Links

#### Skip Link

- Added `.skip-link {
    display: block;
    position: relative !important;
    top: 0;
    left: 0 !important;
    text-align: left;
}` to force the <q>Jump to content</q> anchor link to always be visible 
- Added `.z-3 {
    z-index: auto !important;
}` to force the skip link to be on the same z-plane as other content
- Addded `.skip-link:focus, .skip-link:focus-visible {
text-decoration: underline;
}` to give an underline to the Skip Link when focused

### Images

- Added `.offset-sm-3 {
  margin-left: 0% !important;
  margin-right: 25% !important;
}` which makes the images embedded in Image Post previews left-aligned instead of right-aligned

### Layout

- Added `.container-lg {
    margin-right: 0 !important;
    margin-left: 0 !important;
}` which removes the margins on certain screen breakpoints


