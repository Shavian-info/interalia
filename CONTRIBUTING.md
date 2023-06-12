# Contributing to the Inter Alia font

## Types of contributions this project is looking for

- [Reporting issues](https://github.com/shavian-info/inter/issues/new?template=bug_report.md)
  like bad kerning pairs or variable-font interpolation bugs.

- Fixes to
  [issues tagged "help wanted"](https://github.com/shavian-info/inter/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)
  provided as either
  [GitHub pull requests](https://github.com/shavian-info/inter/pulls)
  or comments in the issue.

## Master fonts and interpolated derivatives

This project uses "master styles" (or "key styles") which are combined using some clever maths to generate other styles
that are "mixed" from two masters. Because of this, there are some **very important rules** you must stick to:

- When adding or removing a glyph, you _must_ add or remove the same glyph in all master fonts. If you're using
  Glyphs.app, this is automatically taken care of, but not with RoboFont or some other font tools.
- When editing glyphs we must make sure:
    - all masters have the same number of paths, nodes and handles, as well as components.
    - all components, paths, nodes and handles are in the same order across all masters.
    - all masters have the same set of anchors.

If these rules are not followed, generated styles will fail to build.

[Multiple Masters: Keeping Your Outlines Compatible](https://glyphsapp.com/tutorials/multiple-masters-part-2-keeping-your-outlines-compatible)
is a great article on this topic.

