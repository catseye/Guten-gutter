#!/bin/sh

#
# Our basic tests will be on Peter Rabbit.  It has 618 lines.
#

cat fixture/pg14838.txt | wc -l | sed 's/ //g' >results.txt
echo '618' >expected.txt
diff -u results.txt expected.txt || exit 1
rm -f expected.txt results.txt

#
# In guten-guttern's default invokation, it tries to strip most things.
#

script/guten-gutter fixture/pg14838.txt | wc -l | sed 's/ //g' >results.txt
echo '230' >expected.txt
diff -u results.txt expected.txt || exit 1
rm -f expected.txt results.txt

#
# It can be told to strip illustrations, too...
#

script/guten-gutter --strip-illustrations fixture/pg14838.txt | wc -l | sed 's/ //g' >results.txt
echo '201' >expected.txt
diff -u results.txt expected.txt || exit 1
rm -f expected.txt results.txt

#
# If it's not given a Project Gutenberg file, it doesn't strip anything.
#

cat fixture/plain.txt | wc -l | sed 's/ //g' >results.txt
echo '10' >expected.txt
diff -u results.txt expected.txt || exit 1
rm -f expected.txt results.txt

script/guten-gutter fixture/plain.txt 2>/dev/null | wc -l | sed 's/ //g' >results.txt
echo '10' >expected.txt
diff -u results.txt expected.txt || exit 1
rm -f expected.txt results.txt
