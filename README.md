# Inter Alia

![Inter Alia title](https://user-images.githubusercontent.com/59408625/152300539-d3e2344f-7c6d-4f93-8a89-4636677537a2.png)

Inter Alia is an expanded version of Rasmus Andersson's beautiful open source sans serif typeface, [Inter](https://rsms.me/inter). Inter was specially designed for user interfaces with focus on high legibility of small-to-medium sized text on computer screens.

Inter Alia builds on the features of Inter to add:
- support for [the Shavian alphabet](https://www.shavian.info) with a newly designed set of glyphs, including the letters missing from Unicode (through character variants)
- support for old-style figures or numerals, also known as text figures, with both proportional and tabular spacing
- refinements to International Phonetic Alphabet glyphs and other less common glyphs.

<img width="600" alt="InterAliaFeatures" src="https://user-images.githubusercontent.com/59408625/152300702-46f8239f-dfce-4cb2-b74a-bb6f517bb590.png">

Support for additional scripts may be considered in future.

***Note that the 'Display' font has yet to be updated and does not include the additional features.***

## Design

Inter Alia expands the Inter typeface with additional glyphs and features. Inter is similar to Roboto, San Francisco, Akkurat, Asap, Lucida Grande and other "UI" and "Text" typefaces. Some trade-offs were made in order to make this typeface work really well at small sizes. For details of the underlying approach to designing Inter, please see [https://github.com/rsms/inter](https://github.com/rsms/inter).

Current font styles:

| Name                 | Weight class
| -------------------- | ----------------
| Thin                 | 100
| Thin Italic          | 100
| Extra Light          | 200
| Extra Light Italic   | 200
| Light                | 300
| Light Italic         | 300
| Regular              | 400
| Italic               | 400
| Medium               | 500
| Medium Italic        | 500
| Semi Bold            | 600
| Semi Bold Italic     | 600
| Bold                 | 700
| Bold Italic          | 700
| Extra Bold           | 800
| Extra Bold Italic    | 800
| Black                | 900
| Black Italic         | 900

Inter Alia also ships as a variable font.


### Font metrics

Inter was originally designed to work at a specific size: 11px. Thus, the Units per [EM](https://en.wikipedia.org/wiki/Em_(typography)) (UPM) is defined in such a way that a power-of-two multiple of one EM unit ends up at an integer value compared to a pixel. Most fonts are designed with a UPM of either 1000 or 2048. Because of this we picked a value that is as high as possible but also as close as possible to one of those common values (since it's reasonable to assume that some layout engines and rasterizers are optimized for those value magnitudes.) We ended up picking a UPM of 2816 which equates to exactly 256 units per pixel when rasterized for size 11pt at 1x scale. This also means that when rasterized at power-of-two scales (like 2x and 4x) the number of EM units corresponding to a pixel is an integer (128 units for 2x, 64 for 4x, and so on.)

However, as the project progressed and the typeface was put into use, it quickly became clear that for anything longer than a short word, it was actually hard to read the almost monotonically-spaced letters.

A second major revision to Inter relaxed the previously-strict rule of geometry being even multiples of 256 and now the rule is "try to stick with 128x, if you can't, stick with 64x and if you can't do that either, never go below 16x." This means that Inter is now much more variable in pace than it used to be, making it work better at higher resolutions and work much better in longer text, but losing some contrast and sharpness at small sizes.

![Metrics](docs/res/metrics.png)

The glyphs are designed based on this "plan"; most stems and lines will be positioned at EM units that are even multiples of 128, and in a few cases they are at even multiples of 64 or as low as 16.

A UPM of 2816 is great for Inter since that means that its cap height is exactly 2048 units (64× 32-unit squares) and its x-height is 1536 (48× 32-unit squares) which both makes the design easier (can deal with only integers, never any fractions, plus use a perfect grid) and it makes the target "small size" of 11dp a pixel-perfect match — at 11px rasterization 1 pixel is exactly 256 units in the design! At 11dp with a 2x scaling factor 1 pixel is 128 units, 64 units at a 3x scaling factor and so on. This makes it feasible to really tune Inter for detailed rasterization.

![Metrics](docs/res/metrics2.png)

Metrics:

- UPM:        2816
- Ascender:   2728
- Cap height: 2048
- x-height:   1536
- Descender:  -680

Translating between EM units and pixels:

- Rasterized at 11px: 1px = 256 units
- Rasterized at 22px: 1px = 128 units
- Rasterized at 44px: 1px =  64 units

## Development

For instructions on how to work with the source files and how to
[compile & build font files](CONTRIBUTING.md#compiling-font-files),
refer to [CONTRIBUTING.md](CONTRIBUTING.md).

Inter Alia is licensed under the [SIL Open Font License](LICENSE.txt)
