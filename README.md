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

An easy way to accomplish this is to dock Guten-gutter using [toolshelf][]:

    toolshelf dock gh:catseye/guten-gutter

Tests
-----

This is a test suite, written in [Falderal][] format, for the `guten-gutter`
utility.  (Note that this isn't a very paradigmatic usage of Falderal!)

    -> Functionality "Count lines in processed Project Gutenberg file"
    -> is implemented by shell command "%(test-body-text) | wc -l | sed 's/ //g'"

    -> Tests for functionality "Count lines in processed Project Gutenberg file"

Our basic tests will be on Peter Rabbit.

    | cat fixture/pg14838.txt
    = 618

In its default invokation, it tries to strip most things.

    | script/guten-gutter fixture/pg14838.txt
    = 230

It can be told to strip illustrations, too...

    | script/guten-gutter --strip-illustrations fixture/pg14838.txt
    = 201

If it's not given a Project Gutenberg file, it doesn't strip anything.

    | cat fixture/plain.txt
    = 10

    | script/guten-gutter fixture/plain.txt
    = 10

TODO
----

Rewrite ProducedByProcessor as a StartSentinelProcessor (or otherwise
have it ignore the end sentinel)

Make IllustrationProcessor handle multiple lines

[Falderal]:     http://catseye.tc/node/Falderal
[toolshelf]:    http://catseye.tc/node/toolshelf
[gutenizer]:    https://github.com/okfn/gutenizer
