This is the readme file for the make-stub-files script explaining what it
does, how it works and why it is important.

The github repository is at: https://github.com/edreamleo/make-stub-files

This program is in the public domain.

### Overview

This script makes a stub (.pyi) file in the **output directory** for each
source file listed on the command line (wildcard file names are supported).

A **configuration file** (default: ~/stubs/make_stub_files.cfg) specifies
annotation pairs and various **patterns** to be applied to return values.
The configuration file can also supply a list of **prefix lines** to be
inserted verbatim at the start of each stub file.

Command-line arguments can override the locations of the configuration file
and output directory. The configuration file can supply default source
files to be used if none are supplied on the command line.

This script never creates directories automatically, nor does it overwrite
stub files unless the --overwrite command-line option is in effect.

The make_stub_files script eliminates much of the drudgery of creating
[python stub (.pyi) files]( https://www.python.org/dev/peps/pep-0484/#stub-files)
from python source files. From GvR::

    "We actually do have a stub generator as part of mypy now (most of the
    code is in https://github.com/JukkaL/mypy/blob/master/mypy/stubgen.py;
    it has a few options) but yours has the advantage of providing a way to
    tune the generated signatures based on argument conventions. This
    allows for a nice iterative way of developing stubs."

The script does no type inference. Instead, it creates function annotations
using user-supplied **type conventions**, pairs of strings of the form
"name: type-annotation".  As described below, the script simplifies return
values using several different kinds of user-supplied **patterns**.

This script should encourage more people to use mypy. Stub files can be
used by people using Python 2.x code bases. As discussed below, stub files
can be thought of as design documents or as executable and checkable design
tools.

### Command-line arguments

    Usage: make_stub_files.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to alternate configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing stub (.pyi) files
      -t, --trace         trace argument substitutions
      -v, --verbose       trace configuration settings
      
*Note*: glob.blob wildcards can be used in file1, file2, ...

### What the script does

This script makes a stub (.pyi) file in the **output directory** for each
source file listed on the command line (wildcard file names are supported).
For each source file, the script does the following:

1. The script writes the prefix lines verbatim. This makes it easy to add
   common code to the start of stub files. For example::

    from typing import TypeVar, Iterable, Tuple
    T = TypeVar('T', int, float, complex)
    
2. The script walks the parse (ast) tree for the source file, generating
   stub lines for each function, class or method. The script generates no
   stub lines for defs nested within other defs. Return values are handled
   in a clever way as described below.

For example, given the naming conventions:

    aList: Sequence
    i: int
    c: Commander
    s: str
    
and a function::

    def scan(s, i, x):
        whatever
        
the script will generate::

    def scan(s: str, i:int, x): --> (see next section):
    
### Handling function returns
    
The script handles function returns pragmatically. The tree walker simply
writes a list of return expressions for each def. For example, here is the
*default* output at the start of leoAst.pyi, before any patterns are applied:

    class AstDumper:
        def dump(self, node: ast.Ast, level=number) -> 
            repr(node), 
            str%(name,sep,sep1.join(aList)), 
            str%(name,str.join(aList)), 
            str%str.join(str%(sep,self.dump(z,level+number)) for z in node): ...
        def get_fields(self, node: ast.Ast) -> result: ...
        def extra_attributes(self, node: ast.Ast) -> Sequence: ...
        
The stub for the dump function is not syntactically correct because there
are four returns listed. As discussed below, the configuration file can
specify several kinds of patterns to be applied to return values.

**These patterns often suffice to collapse all return values** In fact,
just a few patterns (given below) will convert::

    def dump(self, node: ast.Ast, level=number) -> 
        repr(node), 
        str%(name,sep,sep1.join(aList)), 
        str%(name,str.join(aList)), 
        str%str.join(str%(sep,self.dump(z,level+number)) for z in node): ...
        
to:

    def dump(self, node: ast.Ast, level=number) -> str: ... 

If multiple return values still remain after applying all patterns, you
must edit stubs to specify a proper return type. And even if only a single
value remains, its "proper" value may not obvious from naming conventions.
In that case, you will have to update the stub using the actual source code
as a guide.

### The configuration file

As mentioned above, the configuration file, make_stub_files.cfg, is located
in the ~/stubs directory. This is mypy's default directory for stubs.
The configuration file uses the .ini format. It has the following sections,
all optional.

#### The [Global] section

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
        
#### The [Arg Patterns] section

This configuration section specifies naming conventions. These conventions
are applied to *both* argument lists *and* return values.
  
- For argument lists, the replacement becomes the annotation.
- For return values, the replacement *replaces* the pattern.

For example:

    [Arg Patterns]

    # Lines have the form:
    #   verbatim-pattern: replacement
    
    aList: Sequence
    aList2: Sequence
    c: Commander
    i: int
    j: int
    k: int
    node: ast.Ast
    p: Position
    s: str
    s2: str
    v: VNode
    
#### The [Def Name Patterns] section

This configuration specifies the *final* return value to be associated with
functions or methods. The pattern is a regex matching the names of defs.
Methods names should have the form class_name.method_name. No further
pattern matching is done if any of these patterns match. For example:

    [Def Name Patterns]

    # These  patterns are matched *before* the patterns in the
    # [Return Balanced Patterns] and [Return Regex Patterns] sections.
    
    AstFormatter.do_.*: str
    StubTraverser.format_returns: str
    StubTraverser.indent: str
    
#### The [Return Balanced Patterns] section

This configuration section gives **balanced patterns** to be applied to
return values. Balanced patterns match verbatim, except that the three
patterns: ``(*), [*], and {*}`` match only *balanced* parens, square and curly brackets.

Return values are rescanned until no more balanced patterns apply. Balanced
patterns are *much* simpler to use than regex's. Indeed, the following
balanced patterns suffice to collapse most string expressions to str:

    [Return Balanced Patterns]

    repr(*): str
    str.join(*): str
    str.replace(*): str
    str%(*): str
    str%str: str
    
#### The [Return Regex Patterns] section
    
This configuration section gives regex patterns to be applied to return
values. These patterns are applied last, after all other patterns have been
applied.
  
Again, these regex patterns are applied repeatedly until no further
replacements are possible. For example:

    [Return Regex Patterns]

    .*__name__: str
    
#### Important note about pattern matching

The patterns in the [Return Balanced Patterns] and [Return Regex Patterns]
sections are applied to each individual return value separately. Comments
never appear in return values, and all strings in return values appear as
str. As a result, there is no context to worry about and very short
patterns suffice.

### Why this script is important

The script eliminates most of the drudgery from creating stub files.
Creating a syntactically correct stub file from the output of the script is
straightforward: **Just a few patterns will collapse most return values to a single value.**

Stub files are real data. mypy will check the syntax for us. More
importantly, mypy will do its type inference on the stub files. That means
that mypy will discover both errors in the stubs and actual type errors in
the program under test. There is now an easy way to use mypy!

Stubs express design intentions and intuitions as well as types. We
programmers think we *do* know most of the types of arguments passed into
and out of functions and methods. Up until now, there has been no practical
way of expressing and *testing* these assumptions. Using mypy, we can be as
specific as we like about types. For example, we can simply say that d is a
dict, or we can say that d is a dict whose keys are strings and whose
values are executables with a union of possible signatures. In short, stubs
are the easy way to play with type inference.

Most importantly, from my point of view, stub files clarify issues that I
have been struggling with for many years. To what extent *do* we understand
types? mypy will tell us. How dynamic (RPython-like) *are* our programs?
mypy will tell us. Could we use type annotation to convert our programs to
C. Heh, not likely, but the data in the stubs will tell where things get
sticky.

Finally, stubs can simplify the general type inference problem. Without
type hints or annotations, the type of everything depends on the type of
everything else. Stubs could allow robust, maybe even complete, type
inference to be done locally. We might expect stubs to make mypy work
faster.

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
"reverse" script should be more straightfoward than this script.

Edward K. Ream
January 2016
