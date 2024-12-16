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

- `$h1-font-size` changed from `3rem` to `3.5rem`
- `$h2-font-size` changed from `2.5rem` to `3rem`
- `$h3-font-size` changed from `2rem` to `2.5rem`
- Added `h4-font-size` changed from `1.5rem` to `2rem`
- Added `h5-font-size` changed from `1.25rem` to `1.5rem`
- Added `h6-font-size` changed from `1rem` to `1.25rem`
- Overwrite `h6` value in posts since without this it is larger than `h5`. Added `.md-div h6 {
    font-size: 1.1rem;
  }`


#### Size
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
#### Main
For links in the main area, ignoring the navigation bar and the footer.

- Add an underline text decoration to all links in the main area of the document. Where pages are missing a `<main>` element, apply to the broadest relevant named class. Added ` main a, #sidebarContainer a, .communities a, .admin-settings a, .person-profile a, .inbox a, .person-reports a, .registration-applications a {
    text-decoration: underline;
  }`
- Ensure that links inside buttons do not have an underline. Added `main a.btn, #sidebarContainer a.btn, .communities a.btn, .admin-settings a.btn, .person-profile a.btn, .inbox a.btn, .person-reports a.btn, .registration-applications a.btn {
    text-decoration: none;
  }`
- Ensure links share the same link colour as the text. Add `.communities a, .person-listing a small {
    text-decoration-color: rgba(var(--bs-link-color-rgb), var(--bs-link-opacity, 1)) !important; // 
  }`
- Make post title link underline and link post link underline the same as the text when visited. Added ` .post-title a:visited:not(:hover), .post-title + p a:visited:not(:hover) {
    text-decoration-color: var(--bs-gray) !important;
  }`
- Remove the underline on post titles specifically both in the main feed and as metadata under link posts, as it is assumed users are familiar with the convention of clicking the title of a post to visit the post. Added `  .post-title a,
  .post-metadata-card .card-body .card-title a {
    text-decoration: none;
  }`

#### Navigation
- As outlines were added to icons that behaved as user interface elements to make them look more like buttons (see [Buttons (Sizes)](#Sizes)), navigation icon links have these outlines removed to remove clutter as it is assumed users understand that icons in the navigation bar are functional. Added `nav a.nav-link .icon {
  padding: 0.7rem 0.7rem !important;
}`
- Change navigation link spacing `nav ul#navbarLinks a.nav-link {
  margin-right: 0.75rem !important;
}` 
- Increase the padding so the navigation links are above 44x44px but so the links are aligned with the Support Lemmy icon button and the instance banner. Added `nav ul#navbarLinks a.nav-link {
  padding: 0.9rem 0rem 0.1rem 0rem !important;
}`
- The Log In and Sign Up buttons are misaligned. This fixes them. Add `nav ul#navbarIcons a.nav-link[title=Login],
nav ul#navbarIcons a.nav-link[title="Sign Up"] {
  padding: 0.7rem 0rem 0.3rem 0rem !important;
}`
- Remove padding from the Support Lemmy icon link specifically so it does not become misaligned with other navigation links. Added `nav ul#navbarLinks li:last-child a.nav-link {
  padding: 0rem 0rem 0rem 0rem !important;
}`
- As icon buttons and links already have enough padding, make sure the navigation icon links only have enough margins to separate them from each other. Added `nav ul#navbarIcons a.nav-link {
  padding: 0rem 0rem 0rem 0rem !important;
  margin: 0rem 0.5rem 0rem 0rem !important;
}`
- Change the focus colour and add a focus indicator to tabs and buttons that previously had no focus indicator like the Posts/Comments and Show Hidden Posts / Hide Hidden Posts tabs. Added `.btn-check:checked + .btn:focus-visible, :not(.btn-check) + .btn:active:focus-visible, .btn:first-child:active:focus-visible, .btn.active:focus-visible, .btn.show:focus-visible {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25) !important;
}`
- Added a focus indicator to the User Profile toggle dropdown. Added `.dropdown-toggle:focus-visible {
    box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
  }`
- Ensure the navigation bar is correctly spaced. Added `nav ul#navbarLinks {
  margin-right: auto !important; 
}`
- Make the navigation link text smaller than the root font size. Added `nav ul#navbarLinks a.nav-link,
nav ul#navbarIcons a.nav-link[title=Login],
nav ul#navbarIcons a.nav-link[title="Sign Up"] {
  font-size: 0.9rem !important;
}`
- Align the Support Lemmy icon button (heart) with the rest of the navigation links. Added `nav ul#navbarLinks li:last-child a.nav-link {
  margin-top: 0.4rem;
}`
- Make sure the navigation bar wraps properly with the larger font sizes. Added `@media (min-width: 768px) {
  .navbar-expand-md .navbar-collapse {
    flex-wrap: wrap !important;
  }
}`
- Do the same with another part of the navigation. Added `@media (min-width: 768px) {
  .navbar-expand-md .navbar-nav {
    flex-wrap: wrap !important;
  }
}`


#### Skip Link

- Due to increasing button sizes, the Skip Link needs to be moved further up or the button will be partially visible before being brought into focus. Added `.skip-link {
  top: -60px;
}`
- Give the skip link button a focus indicator and underline the link upon focus. Offset the top and left sides by the width of the box shadow. Added `.skip-link:focus, .skip-link:focus-visible {
  top: 0.25rem;
left: 0.25rem !important;
text-decoration: underline;
box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`


### Images

- Images embedded in Image Post previews are left-aligned instead of right-aligned. Added `.offset-sm-3 {
  margin-left: 0% !important;
  margin-right: 25% !important;
}`
- Increase the size of the thumbnail in the home feed. Added `.thumbnail {
  width: 9rem;
  height: 9rem;
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
- Make forms take up more space on the screen so labels aren't flowing onto a new line. Added `@media (min-width: 1200px) {
.col-lg-6 {
  flex: 0 0 auto;
  width: 70% !important;
}
}`
- Make the main content area take up the whole screen at smaller screen sizes as the default behaviour of the compact layout adds white space. Added `@media (min-width: 992px) {
  .container-lg, .container-md, .container-sm, .container {
    max-width: 100% !important;
  }
}`
- Make navbar taller on small screens so border-box in the navbar-toggler does not overlap. Added `@media (max-width: 1200px) {
  #navbar {
    padding-top: 0.25rem !important;
  }
}`
- Ensure text reflow for very long usernames in the Sidebar. Added `.person-listing picture + span + small {
  word-break: break-all;
}`
- Stop flex display from making overflowing usernames from becoming stuck in their containers. Added `.person-listing {
  display: inline !important;`
}
- Prevent the toggle button in the Subscribed sidebar from overflowing from its container. Added `#sidebarSubscribedHeader {
    flex-wrap: wrap;
  }`
- Reduce padding on posts. `.post-listing {
  padding: 0.1rem 0.25rem 0.1rem 0.25rem; // default value is 1.5rem
}`


### Buttons

#### Sizes

- Changed the box size properties of icon links so the added padding (below) does not squish the icons to become invisible. Added `a.sort-select-icon .icon,
a[title=RSS] .icon,
a[title="sorting help"] .icon,
a.nav-link .icon {
  box-sizing: content-box !important;
}`
- Rounded the edges of buttons. Added `.btn {
  border-radius: 0.5rem;
}` 
- Increased the size of the button's icons. Added `.icon {
  height: 1em;
  font-size: 1.2em !important;
}`
- Increased the padding on buttons to increase the target area above 44px and add an outline to make clear buttons with icons are buttons and not images. Icons that behave as links also get an outline and are selected specifically by title (RSS and Sorting Help). this includes a lone button not styled with the .btn class on the inbox page and the navbar toggler icon (menu icon). Added `.btn-sm, .btn-group-sm > .btn, .btn,
a.sort-select-icon .icon,
a[title=RSS] .icon,
a[title="sorting help"] .icon,
.inbox .private-message ul.list-inline.mb-0.text-muted.small li:last-child .icon,
.navbar-toggler .icon,
#navMessages {
  padding: 0.7rem 0.7rem !important;
  outline: 1px solid rgba(222, 226, 230, 0.2) !important;
}`
- Fix box model of the icon in the inbox and round the outline and the navbar-toggler which is also missing a btn style. Added `.inbox .private-message ul.list-inline.mb-0.text-muted.small li:last-child .icon,
.navbar-toggler .icon {
  box-sizing: content-box;
  border-radius: var(--bs-border-radius); // must refer to border-radius as --bs-border-radius
}`
- Remove the outline from the navbar-toggler .icon. Added `.navbar-toggler .icon {
  outline: 0rem !important;
}`
- Fix colour inheritance problem with the icon on the inbox page (show/hide svg which is missing a .btn class). Color is determined by fill: currentColor which points to black on this particular icon for some reason. Added `.inbox .private-message ul.list-inline.mb-0.text-muted.small li:last-child .icon {
  color: rgba(222, 226, 230, 0.75); 
}`
- Increased the size of icons when they behave as links. Added `.btn-sm .icon, .btn-group-sm > .btn .icon, .btn .icon,
a.sort-select-icon .icon,
a[title=RSS] .icon,
a[title="sorting help"] .icon,
nav a.nav-link .icon {
  height: 1em;
  font-size: 1.2em !important;
}` **Note** This is dissociated from the above change to `.icon` as this class is shared by buttons without icons and buttons with icons. If padding was added to all `.icon`s, buttons containing icons would have a duplicate amount of padding.
- Add a border radius only to the top left corner of the post style buttons so it does not overlap with the text box area. Needs important as .rounded-0 sets radius to 0 as important. Added `.markdown-textarea .d-flex button:first-child {
  border-top-left-radius: var(--bs-border-radius) !important;
}`

#### Spacing

The following selectors are to specific some buttons, but not others (e.g. post style buttons).

##### Margins
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
- Add spacing above and below the vote number. Added `.post-score {
  margin-top: 0.25rem;
  margin-bottom: 0.25rem;
}`
- Align the vote up button with the top of the container by reducing the top margin from `-6.5px` to `0px`. Added `.vote-bar {
  margin-top: 0px;
}`
- Add spacing above and below posts. Added `.post-container {
  margin-top: 1rem;
  margin-bottom: 1rem;
}`
- Increase the spacing between wrapping list buttons in the sidebar. Added `.community-sidebar ul li .btn {
    margin-bottom: 0.25rem;
  }`

##### Padding
- Reduce the spacing between the upvote and downvote widget next to post listings in the home feed. Added `article.post-container > .flex-grow-0 {
  padding: 0.25rem;
}`
- Remove padding from the navbar toggler. Must have `!important`. There seem like there are two navbar Messages, one for desktop and one for mobile, so need to overwrite the styling of the mobile one. Navmessages has multiple instances of padding. Added `.navbar-toggler,
#navMessages a,
#navMessages {
  padding: 0rem !important;
  outline: 0rem !important;
}`

##### Functionality

- Gave icon links and the navbar toggler a focus indicator to match the focus indicator of buttons. Added `a.sort-select-icon:focus svg,
a[title=RSS]:focus svg,
a[title="sorting help"]:focus svg,
.navbar-toggler:focus {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`
- Made so the down vote icon changes colour when the button area is hovered, not just the icon. Made this happen when the button is focused as well. Added `.downvote:hover, .btn:hover .downvote, .btn:focus .downvote,
  .downvote:focus, .btn:focus .downvote, .btn:focus .downvote {
    color: var(--bs-danger);
  }`
- Same as above but with the upvote button. Added `.upvote:hover, .btn:hover .upvote, .btn:focus .upvote,
  .upvote:focus, .btn:focus .upvote, .btn:focus .upvote {
    color: var(--bs-info);
  }`
- Give unselected tabs (like Comment) the same focus outline as other buttons. Added `.btn-check:focus-visible + .btn {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`
- Change the focus outline of secondary buttons like Next on the homepage to have the same colour as other buttons. Added `.btn-secondary:focus-visible {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`
- Change the colour of the focus indicator on Languages select cross button on Create Community page. Added `.btn-outline-secondary:focus {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`
- Make the currently selected tab focus indicator the same colour as other buttons. Added `.btn-check:checked:focus-visible + .btn {
  box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
}`
- Add a focus indicator to the eye icon tabs (Show / Hide Posts). Added `label.btn:focus-visible, label.btn:focus, label.btn:focus-within {
    box-shadow: 0 0 0 0.25rem rgba(0, 188, 140, 0.25);
  }`


### Forms
- Change the cursor to a pointer when interacting with a label with a checkbox. This is to try compensate for how some checkboxes are dissociated from their labels (On Create Community page, has a legend `Only moderators can post to this community` with a single checkbox). Added: `.form-check > * {
  cursor: pointer;
}`
- Disable cursor change to pointer when buttons are disabled. Added `.form-check[disabled] > * {
  cursor: default;
}`
- Increased size of the alone checkbox on Create Community page with a missing label. **Note** A temporary measure until the label can be associated with the checkbox, thereby increasing the target size. Added `.form-check > input#community-only-mods-can-post[type=checkbox] {
  padding: 22px; // half of minimum AAA target size 44px
}`

### Breakpoints

Due to the larger font and button sizes, the breakpoints were altered so resolutions suitable for smaller screens occur at larger screen sizes.

- `$grid-breakpoints: (
        xs: 0,
        sm: 768px,
        md: 992px,
        lg: 1200px,
        xl: 1900px,
        xxl: 2200px
);`
- `$container-max-widths: (
        sm: 960px,
        md: 1140px,
        lg: 1610px,
        xl: 2200,
        xxl: 2400
);`

### Cannot be changed
- Add Allowed Instances and Blocked Instances buttons on the Site Configuraiton page has an inline style `width= 2rem; height: 2rem;` and cannot be changed as far as I know. Their target areas are 38x38px due to other style changes but it cannot go higher
- The dropdown box Registration Mode on Site Settings cannot be edited by changing the padding values in `select option`, Javascript is required to change as the styling of the options is determined by the browser
- The Rate Limit change up and down buttons within the input box cannot be changed and requires Javascript. The following code does not work `input#rate-limit::after {
 min-height: 44px;
 min-width: 44px;
}`
- Post nesting left-border width is defined inline and inserted by Javascript. See `/lemmy-ui/src/shared/components/comment/comment-node.tsx` on line 386 `border-left: 2px ${moreRepliesBorderColor} solid !important`. Border colour is defined on line 182-184: `const moreRepliesBorderColor = this.props.node.depth
      ? colorList[this.props.node.depth % colorList.length]
      : colorList[0];` Colour can be changed by altering colorList values

