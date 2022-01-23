#!/bin/bash -e
cd "$(dirname "$0")/.."

OPT_HELP=false
OPT_TEXT=false
OPT_DISPLAY=false
OPT_REVEAL_IN_FINDER=false
OUTFILE=

# parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
  -h*|--h*)
    OPT_HELP=true
    shift
    ;;
  -text|--text)
    OPT_TEXT=true
    shift
    ;;
  -display|--display)
    OPT_DISPLAY=true
    shift
    ;;
  -a*|--a*)
    OPT_TEXT=true
    OPT_DISPLAY=true
    shift
    ;;
  -reveal-in-finder)
    OPT_REVEAL_IN_FINDER=true
    shift
    ;;
  -*)
    echo "$0: Unknown option $1" >&2
    OPT_HELP=true
    shift
    ;;
  *)
    if [[ "$OUTFILE" != "" ]] && ! $OPT_HELP; then
      echo "$0: Extra unexpected argument(s) after <outfile>" >&2
      OPT_HELP=true
    fi
    OUTFILE=$1
    shift
    ;;
  esac
done
if (! $OPT_TEXT && ! $OPT_DISPLAY); then
  OPT_HELP=true
  echo "$0: Need at least one of: -all, -display, -text" >&2
fi
if $OPT_HELP; then
  echo "Usage: $0 [options] <outfile>"
  echo "Options:"
  echo "  -h, -help          Show help."
  echo "  -text              Include Inter Alia Text"
  echo "  -display           Include Inter Alia Display"
  echo "  -a, -all           Include all fonts"
  echo "  -reveal-in-finder  After creating the zip file, show it in Finder"
  exit 1
fi

# tmp dir
ZIPDIR=build/tmp/zip
FONTDIR=build/fonts

# convert relative path to absolute if needed
OUTFILE_ABS=$OUTFILE
if [[ "$OUTFILE_ABS" != /* ]]; then
  OUTFILE_ABS=$PWD/$OUTFILE_ABS
fi

# cleanup any previous build
rm -rf "$ZIPDIR"
rm -f  build/tmp/a.zip

# create directories
mkdir -p \
  "$ZIPDIR/Inter Alia Desktop" \
  "$ZIPDIR/Inter Alia Hinted for Windows/Desktop" \
  "$ZIPDIR/Inter Alia Hinted for Windows/Web" \
  "$ZIPDIR/Inter Alia Variable" \
  "$ZIPDIR/Inter Alia Variable/Single axis" \
  "$ZIPDIR/Inter Alia Web"

# copy font files
# ----------------------------------------------------------------------------
if $OPT_TEXT; then
  # Inter Alia Desktop
  cp $FONTDIR/const/InterAlia-*.otf          "$ZIPDIR/Inter Alia Desktop/" &
  cp $FONTDIR/var/InterAlia-V.var.ttf        "$ZIPDIR/Inter Alia Desktop/InterAlia-V.ttf" &

  # Inter Alia Hinted for Windows
  cp "misc/dist/about hinted fonts.txt"  "$ZIPDIR/Inter Alia Hinted for Windows/" &
  cp $FONTDIR/const-hinted/InterAlia-*.ttf   "$ZIPDIR/Inter Alia Hinted for Windows/Desktop/" &
  cp $FONTDIR/const-hinted/InterAlia-*.woff* "$ZIPDIR/Inter Alia Hinted for Windows/Web/" &
  cp misc/dist/interalia.css                 "$ZIPDIR/Inter Alia Hinted for Windows/Web/" &

  # Inter Alia Variable
  cp $FONTDIR/var/InterAlia.var.ttf          "$ZIPDIR/Inter Alia Variable/InterAlia.ttf" &
  cp $FONTDIR/var/InterAlia-roman.var.ttf    "$ZIPDIR/Inter Alia Variable/Single axis/InterAlia-roman.ttf" &
  cp $FONTDIR/var/InterAlia-italic.var.ttf   "$ZIPDIR/Inter Alia Variable/Single axis/InterAlia-italic.ttf" &

  # Inter Alia Web
  cp $FONTDIR/const/InterAlia-*.woff*        "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAlia.var.woff2        "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAlia-roman.var.woff2  "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAlia-italic.var.woff2 "$ZIPDIR/Inter Alia Web/" &
  cp misc/dist/interalia.css                 "$ZIPDIR/Inter Alia Web/" &
fi
# ----------------------------------------------------------------------------
if $OPT_DISPLAY; then
  # Inter Alia Desktop
  cp $FONTDIR/const/InterAliaDisplay-*.otf          "$ZIPDIR/Inter Alia Desktop/" &
  cp $FONTDIR/var/InterAliaDisplay-V.var.ttf        "$ZIPDIR/Inter Alia Desktop/InterAliaDisplay-V.ttf" &

  # Inter Alia Hinted for Windows
  cp "misc/dist/about hinted fonts.txt"         "$ZIPDIR/Inter Alia Hinted for Windows/" &
  cp $FONTDIR/const-hinted/InterAliaDisplay-*.ttf   "$ZIPDIR/Inter Alia Hinted for Windows/Desktop/" &
  cp $FONTDIR/const-hinted/InterAliaDisplay-*.woff* "$ZIPDIR/Inter Alia Hinted for Windows/Web/" &
  cp misc/dist/interalia-display.css                "$ZIPDIR/Inter Alia Hinted for Windows/Web/" &

  # Inter Alia Variable
  cp $FONTDIR/var/InterAliaDisplay.var.ttf          "$ZIPDIR/Inter Alia Variable/InterAliaDisplay.ttf" &
  cp $FONTDIR/var/InterAliaDisplay-roman.var.ttf    "$ZIPDIR/Inter Alia Variable/Single axis/InterAliaDisplay-roman.ttf" &
  cp $FONTDIR/var/InterAliaDisplay-italic.var.ttf   "$ZIPDIR/Inter Alia Variable/Single axis/InterAliaDisplay-italic.ttf" &

  # Inter Alia Web
  cp $FONTDIR/const/InterAliaDisplay-*.woff*        "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAliaDisplay.var.woff2        "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAliaDisplay-roman.var.woff2  "$ZIPDIR/Inter Alia Web/" &
  cp $FONTDIR/var/InterAliaDisplay-italic.var.woff2 "$ZIPDIR/Inter Alia Web/" &
  cp misc/dist/interalia-display.css                "$ZIPDIR/Inter Alia Web/" &
fi
# ----------------------------------------------------------------------------

# copy misc stuff
cp misc/dist/install*.txt        "$ZIPDIR/"
cp LICENSE.txt                   "$ZIPDIR/"

# wait for processes to finish
wait

# zip
pushd "$ZIPDIR" >/dev/null
zip -q -X -r "$OUTFILE_ABS" *
popd >/dev/null
rm -rf "$ZIPDIR"

echo "Created $OUTFILE"
if $OPT_REVEAL_IN_FINDER && [ -f /usr/bin/open ]; then
  /usr/bin/open --reveal "$OUTFILE"
fi
