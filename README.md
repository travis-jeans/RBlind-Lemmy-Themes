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
2. `@import "rblind-theme.scss";` our custom code
3. `@import "/lemmy-ui/node_modules/bootstrap/scss/bootstrap";`
4. `@import "rblind-theme.scss";` our custom code

This will insert your custom code at the beginning **and** the end of the output CSS file, meaning your styles will be applied correctly and the upstream bootstrap styles won't break.

## Theme Variables and Classes

All variables defined with the SASS variable indicator `$` are in `_variables.darkly.scss`.
All classes defined are in `rblind-theme.scss`.


### Colour Contrast

The file `_variables.sccs` has the arguments: 
- `$link-decoration: none;`
- `$min-contrast-ratio: 3;`
- `$font-size-root: 100%;`

`$min-contrast-ratio` is not a SCSS variable but is read by a bootstrap function `color-contrast()` in `/lemmy-ui/node_modules/bootstrap/scss/_functions.scss`.

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

#### Font Size
- Added `$font-size-root` from `_variables.scss` and changed from `100%` to `120%`

#### Paragraphs

- Added `.post-listing, p {
  line-height: 1.5em !important;
  margin-bottom: 1.5em !important;
}` to increase the paragraph line spacing and between paragraph spacing

#### Other

- Added ``small, .small {
  font-size: 1.25rem !important;
}`` which increases the post author line
- Added ``.post-title {
  margin-bottom: 0.5rem;
}`` to increase the spacing below the post title, as with larger outlined buttons the text and buttons are too close to the following line

### Links

#### Skip Link

- Added `.skip-link {
    display: block;
    position: relative !important;
    top: 0;
    left: 0 !important;
    text-align: left;
    padding: 0.25rem !important;
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
}` which removes the white space margins on certain screen breakpoints

### Buttons

#### Sizes

- Added `.btn {
  border-radius: 0.5rem;
}` to round the edges of buttons
- Added `.icon {
  height: 1em;
  font-size: 1.2em !important;
}` to increase the size of the button's icons
- Added `.btn-sm, .btn, .btn-group-sm > .btn {
  padding: 0.5rem 0.75rem !important;
  outline: 1px solid rgba(222, 226, 230, 0.2) !important;
}` to increase the padding on buttons to increase the target area above 44px and add an outline to make clear buttons with icons are buttons and not images

#### Margins

The following selectors are to specific some buttons, but not others (e.g. post style buttons).

- Added `.comment-bottom-btns .btn,
.post-title + div + div .btn,
.post-title + p + div + div .btn,
.comment .btn {
  margin-right: 0.25rem;
}` to increase the spacing between buttons for the comment and post title buttons
- Added `a.person-listing ~ span + .btn,
a.person-listing + .btn,
.post-title .btn {
  margin-left: 0.25rem;
}` to increase spacing to the left of specific buttons: 
1. Those following badges (e.g. <abbr title="Original Poster">OP</abbr>, <abbr title="Moderator">M</abbr>, or <abbr title="Administrator">A</abbr>) on the post author line
2. Those following the post author when there are no badges
3. The button following the post title
- Added `.post-title,
.post-title + div,
.post-title + p + div {
  margin-bottom: 0.5rem !important;
}` to increase the spacing below the author line (**Note** If you try to apply this to `small, .small` it will apply to `.icon`)


