Guten-gutter
============

Guten-gutter is a command-line filter for stripping the boilerplate off of
text files from Project Gutenberg.  I was using [gutenizer][] for this
purpose, but it has some shortcomings and there were several Project Gutenberg
texts which it failed to properly strip, so I wrote this as a more robust
replacement.  It's also (like Project Gutenberg texts themselves) in the
public domain.

Usage
-----

If you want to get just the book's text out of a Project Gutenberg text file:

    script/guten-gutter pg10662.txt > The_Night_Land.txt

If you want to do that to an entire collection of Project Gutenberg files:

    mkdir cleaned
    script/guten-gutter ../gutenberg/*.txt --output-dir=cleaned

To use Guten-gutter from any working directory, add the `script` directory in
this repository to your `PATH`.  For example, you might add this line to your
`.bashrc`:

    export PATH=/path/to/this/repo/script:$PATH

An easy way to accomplish this is to dock Guten-gutter using [shelf][]:

    shelf_dockgh catseye/Guten-gutter

Tests
-----

A small test script, [test.sh](test.sh), is included with this distribution.

TODO
----

Rewrite ProducedByProcessor as a StartSentinelProcessor (or otherwise
have it ignore the end sentinel)

Make IllustrationProcessor handle multiple lines

[Falderal]:     http://catseye.tc/node/Falderal
[shelf]:        http://catseye.tc/node/shelf
[gutenizer]:    https://github.com/okfn/gutenizer
