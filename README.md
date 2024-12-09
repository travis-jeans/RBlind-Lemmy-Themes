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
- Increased the root font size from `100%` to `120%`. Added `$font-size-root` from `_variables.scss`.
- Increases the post author line size. Added `small, .small {
  font-size: 1.25rem !important;
}` 

#### Paragraphs

- Increased the paragraph line spacing and between paragraph spacing. Added `.post-listing, p {
  line-height: 1.5em !important;
  margin-bottom: 1.5em !important;
}`

### Links

#### Skip Link

- Make the <q>Jump to content</q> anchor link to always be visible. Added `.skip-link {
    display: block;
    position: relative !important;
    top: 0;
    left: 0 !important;
    text-align: left;
    padding: 0.25rem !important;
}`
- Make the skip link to be on the same z-plane as other content. Added `.z-3 {
    z-index: auto !important;
}` 
- Give an underline to the Skip Link when focused. Addded `.skip-link:focus, .skip-link:focus-visible {
text-decoration: underline;
}`

### Images

- Images embedded in Image Post previews are left-aligned instead of right-aligned. Added `.offset-sm-3 {
  margin-left: 0% !important;
  margin-right: 25% !important;
}`

### Layout

- Increased the spacing below the post title, as with larger outlined buttons the text and buttons are too close to the following line. Added `.post-title {
  margin-bottom: 0.5rem;
}` 
- Reduced the spacing beneath the extra link after the post title on link posts. Added `.post-title + p.small {
  margin-bottom: 0.75rem !important;
}`
- Removed the white space margins on certain screen breakpoints. Added `.container-lg {
    margin-right: 0 !important;
    margin-left: 0 !important;
}` 
- Reduced the left margin for nested posts. Added `.ms-1 {
  margin-left: 0.2rem !important;
}` 

### Buttons

#### Sizes

- Rounded the edges of buttons. Added `.btn {
  border-radius: 0.5rem;
}` 
- Increased the size of the button's icons. Added `.icon {
  height: 1em;
  font-size: 1.2em !important;
}`
- Increased the padding on buttons to increase the target area above 44px and add an outline to make clear buttons with icons are buttons and not images. Added `.btn-sm, .btn, .btn-group-sm > .btn {
  padding: 0.5rem 0.75rem !important;
  outline: 1px solid rgba(222, 226, 230, 0.2) !important;
}`

#### Margins

The following selectors are to specific some buttons, but not others (e.g. post style buttons).

- Increased the spacing between buttons for the comment and post title buttons. Added `.comment-bottom-btns .btn,
.post-title + div + div .btn,
.post-title + p + div + div .btn,
.comment .btn {
  margin-right: 0.25rem;
}`
- Increase spacing to the left of specific buttons:
1. Those following badges (e.g. <abbr title="Original Poster">OP</abbr>, <abbr title="Moderator">M</abbr>, or <abbr title="Administrator">A</abbr>) on the post author line
2. Those following the post author when there are no badges
3. The button following the post title; by adding: `a.person-listing ~ span + .btn,
a.person-listing + .btn,
.post-title .btn {
  margin-left: 0.25rem;
}`
- Increased the spacing below the author line so buttons below do not touch the text descenders. Added `.post-title,
.post-title + div,
.post-title + p + div {
  margin-bottom: 0.5rem !important;
}`  (**Note** If you try to apply this to `small, .small` it will apply to `.icon`)


