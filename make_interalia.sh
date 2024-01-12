#!/bin/bash

fontmake "$PWD/src/InterAlia.glyphspackage" -o ttf otf -i -f

fontmake "$PWD/src/InterAlia.glyphspackage" -o variable -f

font_files=(
    "InterAlia-Black.ttf"
    "InterAlia-BlackItalic.ttf"
    "InterAlia-Bold.ttf"
    "InterAlia-BoldItalic.ttf"
    "InterAlia-ExtraBold.ttf"
    "InterAlia-ExtraBoldItalic.ttf"
    "InterAlia-ExtraLight.ttf"
    "InterAlia-ExtraLightItalic.ttf"
    "InterAlia-Italic.ttf"
    "InterAlia-Light.ttf"
    "InterAlia-LightItalic.ttf"
    "InterAlia-Medium.ttf"
    "InterAlia-MediumItalic.ttf"
    "InterAlia-Regular.ttf"
    "InterAlia-SemiBold.ttf"
    "InterAlia-SemiBoldItalic.ttf"
    "InterAlia-Thin.ttf"
    "InterAlia-ThinItalic.ttf"
)

for font_file in "${font_files[@]}"; do
    woff2_compress "$PWD/instance_ttf/$font_file"
    mv "$PWD/instance_ttf/${font_file%.ttf}.woff2" "$PWD/instance_woff2/"
done

woff2_compress "$PWD/variable_ttf/InterAlia-VF.ttf"
mv "$PWD/variable_ttf/InterAlia-VF.woff2" "$PWD/variable_woff2/"