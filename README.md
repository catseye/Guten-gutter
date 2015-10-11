Guten-Gutter
============

Guten-gutter is a command-line filter for stripping the boilerplate off of
text files from Project Gutenberg.  I was using [gutenizer][] for this
purpose, but it has some shortcomings and there were several Project Gutenberg
texts which it failed to properly strip, so I wrote this as a more robust
replacement.  It's also, like Project Gutenberg texts themselves, in the
public domain.

Usage
-----

If you want to get just the book's text out of a Project Gutenberg text file:

    bin/guten-gutter pg10662.txt > The_Night_Land.txt

If you want to do that to an entire collection of Project Gutenberg files:

    mkdir cleaned
    bin/guten-gutter ../gutenberg/*.txt --output-dir=cleaned

To use Guten-gutter from any working directory, add the `bin` directory in this
repository to your `PATH`.  For example, you might add this line to your
`.bashrc`:

    export PATH=/path/to/this/repo/bin:$PATH

Guten-gutter requires that the `t_rext` Python module from [T-Rext][] can be
found on your `PYTHONPATH`.  For example, you might add this line to your
`.bashrc`:

    export PYTHONPATH=/path/to/t-rext/repo/src:$PYTHONPATH

An easy way to accomplish the above two things is to dock T-Rext and
Guten-gutter using [toolshelf][]:

    toolshelf dock gh:catseye/t-rext gh:catseye/guten-gutter

Tests
-----

This is a test suite, written in [Falderal][] format, for the `guten-gutter`
utility.  (Note that this isn't a very paradigmatic usage of Falderal!)

    -> Functionality "Extract text from Project Gutenberg file" is implemented by
    -> shell command "%(test-body-text)"

    -> Tests for functionality "Extract text from Project Gutenberg file"

Our basic tests will be on Peter Rabbit.

    | cat fixture/pg14838.txt | wc -l
    = 618

In its default invokation, it tries to strip most things.

    | bin/guten-gutter fixture/pg14838.txt | wc -l
    = 230

It can be told to strip illustrations, too...

    | bin/guten-gutter --strip-illustrations fixture/pg14838.txt | wc -l
    = 201

If it's not given a Project Gutenberg file, it doesn't strip anything.

    | cat fixture/plain.txt | wc -l
    = 10

    | bin/guten-gutter fixture/plain.txt | wc -l
    = 10

TODO
----

Rewrite ProducedByProcessor as a StartSentinelProcessor (or otherwise
have it ignore the end sentinel)

Make IllustrationProcessor handle multiple lines
