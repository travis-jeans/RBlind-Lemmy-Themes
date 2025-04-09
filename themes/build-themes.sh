echo "Building custom themes with Sass."
sass RBlind-Dark-Loader.scss RBlind-Dark.css && sass RBlind-Light-Loader.scss RBlind-Light.css
echo "Moving custom themes to /.extra_themes/"
cp RBlind-Dark.css RBlind-Light.css ../../../../../lemmy-ui/.extra_themes/
