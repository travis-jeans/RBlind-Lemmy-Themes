echo "Building custom themes with Sass."
sassc RBlind-Dark.scss RBlind-Dark.css && sassc RBlind-Light.scss RBlind-Light.css
echo "Moving custom themes to /.extra_themes/"
cp RBlind-Dark.css RBlind-Light.css ../../../../../lemmy-ui/.extra_themes/
