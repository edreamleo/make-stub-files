
This is the readme file for the make-stub-files script explaining what it
does, how it works and why it is important.

The github repository for this script is at: https://github.com/edreamleo/make-stub-files

This script is in the public domain.

### Overview

This script makes a stub (.pyi) file in the **output directory** for each
**source file** listed on the command line (wildcard file names are
supported). This script never creates directories automatically, nor does
it overwrite stub files unless the --overwrite command-line option is in
effect.

The script does no type inference. Instead, the user supplies **patterns**
in a configuration file. The script matches these patterns to:

1. The names of arguments in functions and methods and

2. The text of **return expressions**. Return expressions are the actual
   text of whatever follows the "return" keyword. The script removes all
   comments in return expressions and converts all strings to "str". This
   **preprocessing** greatly simplifies pattern matching.

As a first example, given the method:

    def foo(self, i, s):
        if i:
            return "abc" # a comment
        else:
            return s
        
and the patterns:

    i[1-3]: int
    s: str
    
the script produces the stub:

    def foo(i: int, s: str) --> str: ...

The make_stub_files script eliminates much of the drudgery of creating
[python stub (.pyi) files]( https://www.python.org/dev/peps/pep-0484/#stub-files)
from python source files. GvR says::

    "We actually do have a stub generator as part of mypy now (most of the
    code is in https://github.com/JukkaL/mypy/blob/master/mypy/stubgen.py;
    it has a few options) but yours has the advantage of providing a way to
    tune the generated signatures based on argument conventions. This
    allows for a nice iterative way of developing stubs."

This script should encourage more people to use mypy. This tool, and stub files
themselves, can be people who use Python 2.x code bases.

### Command-line arguments

    Usage: make_stub_files.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to alternate configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing stub (.pyi) files
      -t, --trace         trace argument substitutions
      -u, --unit-test     enable unit tests at startup
      -v, --verbose       trace configuration settings
      -w, --warn          warn about unannotated args
      
*Note*: glob.blob wildcards can be used in file1, file2, ...

### The configuration file

By default, the configuration file is ~/stubs/make_stub_files.cfg. ~/stubs
is mypy's default directory for stubs. You can change the name and location
of the configuration file using the --config command-line option.

The configuration file uses the .ini format. It has several
configuration sections, all optional.

#### [Global]

This configuration section specifies the files list, prefix lines and
output directory. For example:

    [Global]

    files:
        # Files to be used *only* if no files are given on the command line.
        # glob.glob wildcards are supported.
        ~/leo-editor/leo/core/*.py
        
    output_directory:
        # The output directory to be used if no --dir option is given.
        ~/stubs
        
    prefix:
        # Lines to be inserted at the start of each stub file.
        from typing import TypeVar, Iterable, Tuple
        T = TypeVar('T', int, float, complex)

#### Patterns used in [xxx Patterns] sections.

The configuration sections to be discussed next, namely:

    [Def Name Patterns]
    [Arg Patterns]
    [General Patterns]
    [Return Patterns]
    
all specify patterns that associate annotations with argument lists or
return values.

All patterns have the form:

    find-string: replacement-string
    
Colons are not allowed in the find-string.  This is a limitation of .ini files.

There are two kinds of patterns: regex patterns and balanced patterns.

**Balanced patterns** contain either `(*)`, `[*]`, or `{*}` in the find-string.
Unlike regular expressions, balanced patterns match only balanced brackets.

For example:

    str(*): str
    
At present, the following *does not work*:

    [Arg Patterns]
    aList[List[*]]: List[List[*]]
    
That is, the script does not replace `*` in replacement-strings with whatever
matched `*` in the find-string. This is on the to-do list.

A pattern is a **regex pattern** if and only if it is *not* a balanced
pattern. The find-string is a python regular expression. At present, the
replacement-string is a *plain* string. That is, \1, \2, etc. are not
allowed.

*Note*: Regex and balanced patterns may appear in any section. However,
balanced patterns will never match argument names.

The script matches patterns in the order they appear in each section. As a
special case, the script matches the .* pattern (a regex pattern) last,
regardless of its position in each section.
        
#### [Def Name Patterns]

The script matches the find-strings in this section against names of
functions and methods. For methods, the script matches find-strings against
names of the form:

    class_name.method_name

When a find-string matches, the replacement-string becomes the return type
in the stub, without any further pattern matching. That is, this section
*overrides* the [General Patterns] and [Return Patterns] sections.

Example 1:

    [Def Name Patterns]
    myFunction: List[str]
    
Any function named myFunction returns List[str].

Example 2:

    [Def Name Patterns]
    MyClass\.myMethod: str
    
The myMethod method of the MyClass class returns str.

Here, the find-string is a regex (because it's not a balanced expression).
Using \. in the find-string as shown is best. In most cases, however, using
MyClass.myMethod as the find-string would also match as expected.

Example 3:

    [Def Name Patterns]
    MyClass\.do_.*: str
    
All methods of the MyClass class whose names start with "do_" return str.
        
#### [Arg Patterns]

The script matches the patterns in this section against argument names. When
a find-string matches, the script adds the replacement-string as an annotation.

Example 1:

    [Arg Patterns]
    aList: Sequence
    
Converts arguments named aList to aList: Sequence.

Example 2:

Given the function:

    def whatever(aList, aList1, aList5):
        pass
        
the pattern:

    [Arg Patterns]
    aList[1-2]: Sequence
    
creates the stub:

    def whatever(aList: Sequence, aList1: Sequence, aList5) --> None: ...
        pass

#### [Return Patterns]

For each function or method, the script matches the patterns in this
section against all return expressions in each function or method. The
script matches all patterns repeatedly until no further matches are
possible. *Important*: the script matches patterns against each return
expression *separately*.

The intent of the patterns in this section should be to **reduce** return
expressions to **known types**. A known type is a either a name of a type
class, such as int, str, long, etc. or a **type hint**, as per
[Pep 484](https://www.python.org/dev/peps/pep-0484/).

The script *always* produces a syntactically correct stub, even if the
patterns in this section (and in the [General Patterns] section) do not, in
fact, reduce to a known type. For unknown types, the script does the
following:

1. Uses Any as the type of the function or method.

2. Follows the stub with a list of comments giving all the return
   expressions in the function or method.
   
For example, suppose that the patterns are not sufficient to resolve the
return type of:

    def foo(a):
        if a:
            return a+frungify(a)
        else:
            return defrungify(a)
         
The script will create this stub:

    def foo(a) --> Any: ...
        # a+frungify(a)
        # defrungify(a)
        
The comments preserve maximal information about return types, which should
help the user to supply a more specific return type. The user can do this
in two ways:

1. By altering the stub file by hand or
2. By adding new patterns to [Def Name Patterns] or [Return Patterns].

*Important*: The script applies the patterns in this section *separately*
to each return expression in each function or method. Comments never appear
in return expressions, and all strings in return values appear as str. As a
result, there is no context to worry about and very short patterns suffice.
    
#### [General Patterns]

The patterns in this section apply to *both* argument lists *and* return values.

In essence, the patterns in this section work as if they appeared at the end of both
[Arg Patterns] and [Return Patterns].

### Why this script is important

The script eliminates most of the drudgery from creating stub files. The
script produces syntactically and semantically correct stub files without
any patterns at all. Patterns make it easy to make stubs more specific.

Once we create stub files, mypy will check them by doing real type
inference. This will find errors both in the stub files and in the program
under test. There is now an easy way to use mypy!

Stubs express design intentions and intuitions as well as types. Until now,
there has been no practical way of expressing and *testing* these
assumptions. Now there is.

Using mypy, we can be as specific as we like about types. We can simply
annotate that d is a dict, or we can say that d is a dict whose keys are
strings and whose values are executables with a union of possible
signatures. Stubs are the easy way to play with type inference.

Stub files clarify long-standing questions about types. To what extent *do*
we understand types? How dynamic (RPython-like) *are* our programs? mypy
will tell us where are stub files are dubious. Could we use type annotation
to convert our programs to C? Not likely, but now there is a way to know
where things get sticky.

Finally, stubs can simplify the general type inference problem. Without
type hints or annotations, the type of everything depends on the type of
everything else. Stubs could allow robust, maybe even complete, type
inference to be done locally. Stubs help mypy to work faster.

### Summary

The make-stub-files script does for type/design analysis what Leo's c2py
command did for converting C sources to python. It eliminates much of the
drudgery associated with creating stub files, leaving the programmer to
make non-trivial inferences.

Stub files allow us to explore type checking using mypy as a guide and
helper. Stub files are both a design document and an executable, checkable,
type specification. Stub files allow those with a Python 2 code base to use
mypy.

One could imagine a similar insert_annotations script that would inject
function annotations into source files using stub files as data. The
"reverse" script should be more straightforward than this script.

Edward K. Ream
January 2016
