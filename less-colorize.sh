#!/bin/sh
# .lessfilter to use pygmentize

case "$1" in
# add all extensions you want to handle here
*.awk|*.groff|*.java|*.js|*.m4|*.php|*.pl|*.pm|*.pod|*.sh|\
*.ad[asb]|*.asm|*.inc|*.[ch]|*.[ch]pp|*.[ch]xx|*.cc|*.hh|\
*.lsp|*.l|*.pas|*.p|*.xml|*.xps|*.xsl|*.axp|*.ppd|*.pov|\
*.diff|*.patch|*.py|*.rb|*.el|*.sql|*.ebuild|*.eclass)
pygmentize -f terminal256 -O style=trac "$1"; exit 0;;
esac

case `file --mime-type --brief --dereference --uncompress "$1"` in
# add all MIME types you want to handle here
text/troff) lexer=nroff;;
text/html) lexer=html;;
application/xml|image/svg+xml) lexer=xml;;
text/x-c) lexer=c;;
text/x-c++) lexer=cpp;;
text/x-makefile) lexer=make;;
text/x-pascal) lexer=pascal;;
text/x-java) lexer=java;;
text/x-po) lexer=po;;
text/x-lua) lexer=lua;;
text/x-python) lexer=python;;
text/x-perl) lexer=perl;;
text/x-shellscript) lexer=sh;;
text/x-msdos-batch) lexer=bat;;
text/x-diff) lexer=diff;;
text/x-tex) lexer=latex;;
# Types that pygmentize didn't support at time of writing
#text/x-gawk, text/x-nawk, text/x-awk, text/x-asm, text/x-bcpl,
#text/x-m4, text/x-pl1
esac

if [ -n "$lexer" ]; then
pygmentize -f terminal256 -l $lexer -O style=trac "$1"
exit 0
fi

exit 1
