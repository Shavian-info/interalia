#!/bin/bash

fontmake "$PWD/src/InterAlia.glyphspackage" -o ttf otf -i -f

fontmake "$PWD/src/InterAlia.glyphspackage" -o variable -f

#woff2_compress $PWD/instance_ttf/InterAlia-Black.ttf > $PWD/instance_woff2/InterAlia-Black.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-BlackItalic.ttf > $PWD/instance_woff2/InterAlia-BlackItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Bold.ttf > $PWD/instance_woff2/InterAlia-Bold.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-BoldItalic.ttf > $PWD/instance_woff2/InterAlia-BoldItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-ExtraBold.ttf > $PWD/instance_woff2/InterAlia-ExtraBold.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-ExtraBoldItalic.ttf > $PWD/instance_woff2/InterAlia-ExtraBoldItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-ExtraLight.ttf > $PWD/instance_woff2/InterAlia-ExtraLight.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-ExtraLightItalic.ttf > $PWD/instance_woff2/InterAlia-ExtraLightItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Italic.ttf > $PWD/instance_woff2/InterAlia-Italic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Light.ttf > $PWD/instance_woff2/InterAlia-Light.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-LightItalic.ttf > $PWD/instance_woff2/InterAlia-LightItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Medium.ttf > $PWD/instance_woff2/InterAlia-Medium.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-MediumItalic.ttf > $PWD/instance_woff2/InterAlia-MediumItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Regular.ttf > $PWD/instance_woff2/InterAlia-Regular.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-SemiBold.ttf > $PWD/instance_woff2/InterAlia-SemiBold.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-SemiBoldItalic.ttf > $PWD/instance_woff2/InterAlia-SemiBoldItalic.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-Thin.ttf > $PWD/instance_woff2/InterAlia-Thin.woff2
#woff2_compress $PWD/instance_ttf/InterAlia-ThinItalic.ttf > $PWD/instance_woff2/InterAlia-ThinItalic.woff2

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