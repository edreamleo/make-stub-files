<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20160207181637.1"><vh>Startup</vh>
<v t="ekr.20160207181648.1"><vh>@settings</vh>
<v t="ekr.20180706073424.1"><vh>@bool run-pyflakes-on-write = False</vh></v>
<v t="ekr.20160207182535.1"><vh>@bool preload-find-pattern = False</vh></v>
</v>
<v t="ekr.20210805061637.1"><vh>buttons</vh>
<v t="ekr.20210804020706.1"><vh>@button coverage</vh></v>
<v t="ekr.20210804060105.1"><vh>@button unitttest</vh></v>
<v t="ekr.20210804021331.1"><vh>@button msf</vh></v>
</v>
</v>
<v t="ekr.20210805061856.1"><vh>Notes</vh>
<v t="ekr.20210805061902.1"><vh>No longer used</vh>
<v t="ekr.20160318141204.5"><vh>merge_types (not used)</vh></v>
<v t="ekr.20160207051429.1"><vh>test_merge_types</vh></v>
</v>
<v t="ekr.20210804153200.1"><vh>script convert-at-test</vh></v>
</v>
<v t="ekr.20160128104714.1"><vh>Files</vh>
<v t="ekr.20160128225533.1"><vh>@clean .gitignore</vh></v>
<v t="ekr.20160128102557.1"><vh>@clean example.cfg</vh></v>
<v t="ekr.20160126153220.1"><vh>@clean make_stub_files.cfg</vh></v>
<v t="ekr.20160330201030.1"><vh>@clean PKG-INFO.TXT</vh></v>
<v t="ekr.20160211110739.1"><vh>@clean README.md</vh>
<v t="ekr.20160211110807.1"><vh>Overview</vh></v>
<v t="ekr.20160211113019.1"><vh>Quick start</vh></v>
<v t="ekr.20160211110810.1"><vh>Command-line arguments</vh></v>
<v t="ekr.20160211110810.2"><vh>The configuration file</vh>
<v t="ekr.20160211111807.1"><vh>Patterns</vh></v>
<v t="ekr.20160211111823.1"><vh>[Global]</vh></v>
<v t="ekr.20160211111839.1"><vh>[Def Name Patterns]</vh></v>
<v t="ekr.20160211111901.1"><vh>[General Patterns]</vh></v>
</v>
<v t="ekr.20160211110810.3"><vh>Why this script is important</vh></v>
<v t="ekr.20160211110811.1"><vh>Summary</vh></v>
</v>
<v t="ekr.20160207101607.1"><vh>@clean theory.md</vh></v>
<v t="ekr.20160318141204.1" descendentVnodeUnknownAttributes="7d71005805000000302e362e3571017d71025808000000616e6e6f7461746571037d710473732e"><vh>@file make_stub_files.py</vh></v>
</v>
<v t="ekr.20210805061823.1"><vh>To do</vh>
<v t="ekr.20210805054028.1"><vh>=== #19: revise readme.md</vh></v>
<v t="ekr.20210805053830.1"><vh>=== #18: full coverage</vh></v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20160126153220.1">@language config

# A configuration file to make stubs for make_stub_files.py itself.

[Global]

files: make_stub_files.py
    
output_directory: .
    
prefix_lines:
    from typing import Any, Dict, Optional, Sequence, Tuple, Union
        # At present, I don't understand how to tell mypy about ast.Node
        # import ast
        # Node = ast.Node
    Node = Any

[Def Name Patterns]

# The returns are inherent in the design of make_stub_files.py:
AstFormatter.do_*: str
StubFormatter.do_*: str
StubTraverser.do_*: str

# Test of regex pattern.
.*__hash__$: int

# Pattern.all_matches: Sequence
# Pattern.full_balanced_match: Optional[int]
# Pattern.match_balanced: int
# Pattern.match_entire_string: bool
# StandAloneMakeStubFile.scan_types: Dict[str, str]

# StubTraverser.format_returns: str
# StubTraverser.match_return_patterns: Tuple[bool,str]
# StubTraverser.match_return_pattern: Optional[str]
# StubTraverser.match_balanced: int

[General Patterns]

# Declarations of names...
NotImplemented: bool
a: str
aList: List[Any]
comments: str
controller: StandAloneMakeStubFile
find_s: str
fn: str
found: str
general_patterns: List[Pattern]
group: str
i1: int
i2: int
i: int
j1: int
j2: int
j: int
n1: int
n2: int
n: int
name: str
ndots: int
node: Node
parser: optparse.OptionParser
patterns: List
repl_s: str
s: str
s1: str
s2: str
# s[1-2]?$: str
strict: bool
trace: bool
# New known functions
endswith(*): bool 

# Known functions...
os.path.basename(*): str
os.sep.join(*): str
sep.join(*): str
self.__eq__(*): bool
self.__ne__(*): bool
self.__gt__(*): bool
self.__lt__(*): bool
all(*): bool
any(*): bool

int(*): int
hash(*): int
len(*): int
repr(*): str
sorted(*): str
str%(*): str
str.join(*): str
r[*]: str
# Put this in the code.
str[*]: str
###.*\.__name__$: str
###.*\.hash()$: int
</t>
<t tx="ekr.20160128102557.1"># An example configuration file for make_stub_files.py.
# By default, make_stub_files.py uses ~/stubs/make_stub_files.cfg.
# Can be changed using the --config=path command-line option.

[Global]

files:
    
    # Files to be used *only* if no files are given on the command line.
    # glob.glob wildcards are supported.
    
output_directory: ~/stubs
    
prefix_lines:
    # Lines to be inserted at the start of each stub file.

    from typing import TypeVar
    T = TypeVar('T', int, float, complex)
    
# Notes about patterns used below:
#
#  **Balanced patterns** contain either (*), [*], or {*}.
#  Unlike regular expressions, balanced patterns match only balanced brackets.
#
#  Both regex and balanced patterns may appear in each section.
#  However, balanced patterns will never match argument names.
#
#  Patterns are matched in the order they appear in each section,
#  but the .* pattern (if present) will match last, regardless of its
#  position in the section.
    
[Def Name Patterns]

# These regex patterns give the return types of functions or methods.
#
# Patterns for methods should match class_name.method_name.
#
# Patterns in this section *override* all other patterns,
# so you should use these patterns only if:
#
# - No other pattern properly handles the function or method, or
#
# - The pattern specifies functions that should all return the same value.
#   For example, all ast tree traversers should have the same signatures.
#
# It may be unwise to use .* in this section, but the choice is yours.

[Argument Patterns]

# The regex patterns in this section apply only when assigning types
# to *arguments* to functions or methods. Patterns match argument names.
# Typically, most patterns can be put [General Patterns] section instead.

[General Patterns]

# The patterns in this section may be either regex or balanced patterns.
# Patterns in this section are applied both to arguments and return expressions.
# These patterns are applied *once* to argument names and *repeatedly* to
# return types until no further matches can be made.

aList[1-3]?: Sequence
i: int
j: int
k: int
node: ast.Ast
s[1-3]?: str

[Return Patterns]

# The patterns in this section may be either regex or balanced patterns.
# Patterns in this section are applied only to return expressions.
# These patterns are applied *repeatedly* to return expressions
# until no further matches can be made.

# Balanced patterns...

repr(*): str
str.join(*): str
str.replace(*): str
str%(*): str
str%str: str

# Regex patterns...

.*__name__: str
</t>
<t tx="ekr.20160128104714.1"></t>
<t tx="ekr.20160128225533.1">*.pyc
*.pyi
test/*.pyc
__pycache__/
.mypy_cache/
.cache/
.coverage
htmlcov/
</t>
<t tx="ekr.20160207051429.1">def test_merge_types(self):

    a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
    none = 'None'
    La, Lc = ['Any'], ['complex']
    Lac, Lai, Lan = ['Any', 'complex'], ['Any', 'int'], ['Any', 'None']
    Laci = ['Any', 'complex', 'int']
    Lnone = ['None']
    table = (
        (none, Lnone,   Lnone),
        (none, none,    Lnone),
        (a, none,       Lan),
        (a, a,          La),
        (La, a,         La),
        (Lac, a,        Lac),
        (Lac, i,        Laci),
        (Lac, Lai,      Laci),
    )
    for a1, a2, expected in table:
        got = merge_types(a1, a2)
        self.assertEqual(expected, got)
</t>
<t tx="ekr.20160207101607.1">@language rest
@wrap

This is the theory-of-operation document for the `make_stub_files` script. It is intentionally brief. Please [ask questions](#summary) if anything is unclear.

### Prerequisites

Maintainers should be familiar with the following:

- The [Python 3 ast class](https://docs.python.org/3/library/ast.html).
  You should know what a tree traversal is.
- [Pep 484](https://www.python.org/dev/peps/pep-0484/) and
  [Python's typing module](https://docs.python.org/3/library/typing.html).
  Having a clear **target language** greatly simplifies this project.
  
You don't need to know anything about type inference.

### High level description

This is, truly, a *very* simple script. Indeed, this is just a modified code formatter. This script traverses the incoming ast tree *once* from the top down, generating results from the bottom up. There is only a *single* traversal, composed of four traversal classes. (See [below](#traversers) for details). This traversal produces a stub for every class and def line. To do this, it **replaces expressions with type hints**. In other words, the goal is to **reduce** expressions to **known types**, as defined by Pep 484.

The StubFormatter visitors do most of the work of type reduction. They are simple because they delegate type reduction to the following helpers:

1. **`ReduceTypes.reduce_types(aList)`** reduces a *list* of 0 or more types to a *string* representing a type hint. It returns 'Any' for unknown types. At the top of the traversal, StubTraverser.do_FunctionDef also calls reduce_types (via helpers) on the list of all return expressions.

2. **`StubFormatter.match_all(node, s)`** applies all user-patterns to s and returns the result.

3. **`ReduceTypes.is_known_type(s)`** embodies the known types as defined in Pep 484 and the typing module.

In short, visitors are hardly more complex than the corresponding AstFormatter methods.

**Notes**:

- The `sf.do_Attribute` and `sf.do_Name` visitors look up names in `sf.names_dict`. This is much faster than matching patterns.

- `sf.match_all` is very fast because it only applies patterns that *could possibly* match at the node being visited. Those patterns are:

        self.patterns_dict.get(node.__class__.__name__, []) + self.regex_patterns
        
  That is, all regex patterns are applied "everywhere" in return expressions.

- The startup code create `names_dict`, `patterns_dict` and `regex_patterns` data structures. That's all you have to know about the startup code.

- The Pattern class handles almost all details of pattern matching. This shields the rest of the code from knowledge of patterns. In particular, `sf.match_all` knows nothing about patterns.

### Examples

The previous section is really you should need to know about this program.  However, a few examples may make this script's operation clearer. The --trace-matches and --trace-reduce switches turn on detailed traces that show exactly when and where reductions happen, and what the resulting type hints are. These traces are the truth.  Believe them, not words here.

Given the file truncate.py:

    def truncate(s, n):
        """Return s truncated to n characters."""
        return s if len(s) &lt;= n else s[:n-3] + '...'
        
The script produces this output with the --verbose option in effect:

    def truncate(s: str, n: int) -&gt; str: ...
        #   0: return s if len(s)&lt;=n else s[:n-3]+'...'
        #   0: return str
        
Here is the output with --trace-reduce --trace-matches in effect:

    make_stub_files.py -c msf.cfg truncate.py -v -o --trace-reduce --trace-matches
    
    callers                     pattern                types ==&gt; hint    
    =======                     =======         ========================
    reduce_types: do_BinOp                      [int, number] ==&gt; number
    match_all:    do_Subscript  str[*]: str      str[:number] ==&gt; str
    reduce_types: do_IfExp                               str] ==&gt; str

Finally, here is *part* of the result of tracing make_stub_files.py itself:

          context                   pattern                                                          types ==&gt; hint    
    =============================== ================ =========================================================================
    reduce_types: do_IfExp                                                    [bool, is_known_type(inner)] ==&gt; ? Any
    reduce_types: do_IfExp                                                    [bool, is_known_type(inner)] ==&gt; ? Any
    match_all:    do_Call           all(*): bool                  all(is_known_type(z.strip()) for z in... ==&gt; bool
    reduce_types: is_known_type                                                                [Any, bool] ==&gt; Union[Any, bool]
    match_all:    do_Call           sorted(*): str                                      sorted(Set[r1+r2]) ==&gt; str
    reduce_types: show                                  [show_helper(List[Any][:], known, str, str, bool)] ==&gt; ? Any
    match_all:    do_Subscript      r[*]: str                                                    r[number] ==&gt; str
    match_all:    do_Call           str.join(*): str                                         str.join(str) ==&gt; str
    reduce_types: reduce_types                       [show(str), show(str, known=bool), show_helper(Li...] ==&gt; ? Any
    reduce_types: do_BinOp                                                                   [int, number] ==&gt; number
    match_all:    do_Subscript      str[*]: str                                               str[:number] ==&gt; str
    reduce_types: do_IfExp                                                                           [str] ==&gt; str
    
    class AstFormatter
    
    reduce_types: do_BoolOp                                                              [val, val.strip()] ==&gt; ? Any
    reduce_types: do_BoolOp                                                                      [Any, str] ==&gt; Union[Any, str]
    reduce_types: visit                                                                               [str] ==&gt; str
    reduce_types: do_IfExp                                                                            [str] ==&gt; str
    match_all:    do_Call           repr(*): str                                               repr(Node.n) ==&gt; str
    reduce_types: get_import_names                                                                 [result] ==&gt; ? Any
    reduce_types: kind                                                            [Node.__class__.__name__] ==&gt; ? Any
    
This trace contains pretty much everything you need to know about pattern matching and type reduction.

Enable tracing in various visitors if you need more data.

&lt;a name="traversers"/&gt;
### Traversers

As stated above, this script traverses the parse tree *once*, using four different traversal classes. Each traverser produces the results needed at a particular point of the traversal. Imo, using separate traversal classes is good style, even though it would be straightforward to use a single class. Indeed, each class has a distinct purpose...

#### AstFormatter

This is the base formatter class. It defines the default formatting for each kind of node. More importantly, it emphasizes that subclasses must return strings, *never* lists. The `AstFormatter.visit` method checks that this is so. This assertion guarantees that subclasses must call `st.reduce_types` to convert a list of possible types into a single string representing their union.

#### StubTraverser

This class drives the traversal. It is a subclass of ast.NodeVisitor. No custom visit method is needed. Visitors are *not* formatters--they *use* formatters to produce stubs. This class overrides only the visitors for ClassDef, FunctionDef and Return ast nodes. The FunctionDef visitor invokes the StubFormatter class to format all the functions return statements. The FunctionDef visitor invokes the AstArgFormatter to format names in argument lists.

#### StubFormatter

This class formats return statements. The overridden visitors of this class replace constants and operators with their corresponding type hints. The do_BinOp method contains hard-coded patterns for creating type hints. More could be added. The script is truly simple because the visitor methods of this class are hardly more complex than the corresponding methods of the AstFormatter class.

### AstArgFormatter

This class works just like the StubFormatter class except that does *not* apply patterns to Name nodes. As the name implies, it is used to format arguments in function definitions. It could easily be merged into the StubFormatter class, but imo having a separate class is cleaner and even a bit safer.

### Unit testing

The easy way to do unit testing is from within Leo:

- Alt-6 runs all unit tests in @test nodes.
- Alt-5 runs all *marked* @test nodes. Super convenient while developing code.

The `@button write-unit-test` script writes all @test nodes to `make_stub_files/test`.

The `--test` option runs all test files in `make_stub_files/test`.

The following also runs all test files in `make_stub_files/test`:

    cd make_stub_files
    python -m unittest discover -s test

&lt;a name="summary"/&gt;
### Summary

This script is a straightforward tree traversal. Or so it seems to me.
Please feel free to ask questions.

Edward K. Ream  
edreamleo@gmail.com  
(608) 886-5730
</t>
<t tx="ekr.20160207181637.1"></t>
<t tx="ekr.20160207181648.1"></t>
<t tx="ekr.20160207182535.1"></t>
<t tx="ekr.20160211110739.1">@language rest
@wrap

This is the readme file for `make_stub_files.py`. This file explains what the script does, how it works and why it is important. After a brief overview, a step-by-step section will get you started. Full source code for the script is in its [github repository](https://github.com/edreamleo/make-stub-files). This script is in the public domain.

@others
</t>
<t tx="ekr.20160211110807.1">
### Overview

This script makes a stub (.pyi) file in the **output directory** for each **source file** listed on the command line (wildcard file names are supported). This script never creates directories automatically, nor does it overwrite stub files unless the --overwrite command-line option is in effect.

GvR says, "We actually do have a [stub generator](https://github.com/JukkaL/mypy/blob/master/mypy/stubgen.py) as part of mypy now (it has a few options) but yours has the advantage of providing a way to tune the generated signatures...This allows for a nice iterative way of developing stubs."

The script does no type inference. Instead, the user supplies **patterns** in a configuration file. The script matches these patterns to:

1. The names of arguments in functions and methods and

2. The text of **return expressions**. Return expressions are the actual text of whatever follows the "return" keyword. The script removes all comments in return expressions and converts all strings to "str". This **preprocessing** greatly simplifies pattern matching.

As a first example, given the method:

    def foo(self, i, s):
        if i:
            return "abc" # a comment
        else:
            return s
        
and the patterns:

    i: int
    s: str
    
the script produces the stub:

    def foo(i: int, s: str) --&gt; str: ...

The `make_stub_files` script eliminates much of the drudgery of creating [python stub (.pyi) files](https://www.python.org/dev/peps/pep-0484/#stub-files) from python source files. This script should encourage more people to use mypy. Stub files can be used by people who use Python 2.x code bases.

</t>
<t tx="ekr.20160211110810.1">
### Command-line arguments

    Usage: make_stub_files.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing stub (.pyi) files
      -t, --test          run unit tests on startup
      --trace-matches     trace Pattern.matches
      --trace-patterns    trace pattern creation
      --trace-reduce      trace st.reduce_types
      --trace-visitors    trace visitor methods
      -u, --update        update stubs in existing stub file
      -v, --verbose       verbose output in .pyi file
      -w, --warn          warn about unannotated args

*Note*: glob.glob wildcards can be used in file1, file2, ...
</t>
<t tx="ekr.20160211110810.2">
### The configuration file

The --config command-line option specifies the full path to the optional configuration file. The configuration file uses the .ini format. It has several configuration sections, all optional.

</t>
<t tx="ekr.20160211110810.3">
### Why this script is important

The script eliminates most of the drudgery from creating stub files. The script produces syntactically and semantically correct stub files without any patterns at all. Patterns make it easy to make stubs more specific.

Once we create stub files, mypy will check them by doing real type inference. This will find errors both in the stub files and in the program under test. There is now an easy way to use mypy!

Stubs express design intentions and intuitions as well as types. Until now, there has been no practical way of expressing and *testing* these assumptions. Now there is.

Using mypy, we can be as specific as we like about types. We can simply annotate that d is a dict, or we can say that d is a dict whose keys are strings and whose values are executables with a union of possible signatures. Stubs are the easy way to play with type inference.

Stub files clarify long-standing questions about types. To what extent *do* we understand types? How dynamic (RPython-like) *are* our programs? mypy will tell us where are stub files are dubious. Could we use type annotation to convert our programs to C? Not likely, but now there is a way to know where things get sticky.

Finally, stubs can simplify the general type inference problem. Without type hints or annotations, the type of everything depends on the type of everything else. Stubs could allow robust, maybe even complete, type inference to be done locally. Stubs help mypy to work faster.
</t>
<t tx="ekr.20160211110811.1">
### Summary

The make-stub-files script does for type/design analysis what Leo's c2py command did for converting C sources to python. It eliminates much of the drudgery associated with creating stub files, leaving the programmer to make non-trivial inferences.

Stub files allow us to explore type checking using mypy as a guide and helper. Stub files are both a design document and an executable, checkable, type specification. Stub files allow those with a Python 2 code base to use mypy.

One could imagine a similar insert_annotations script that would inject function annotations into source files using stub files as data. The "reverse" script should be more straightforward than this script.

Edward K. Ream  
January 25 to February 15, 2016
</t>
<t tx="ekr.20160211111807.1">
#### Patterns

The [Def Name Patterns] and [General Patterns] configuration sections
specify patterns. All patterns have the form:

    find-string: replacement-string
    
Colons are not allowed in the find-string. This is a limitation of .ini files.

There are three kinds of patterns: balanced, regex and plain.

**Balanced patterns** are patterns whose find string that:

A: contain either `(*)`, `[*]`, or `{*}` or

B: ends with `*`.

Unlike regular expressions, `(*)`, `[*]`, or `{*}` match only
balanced brackets. A trailing `*` matches the rest of the string.

Examples:

    str(*): str
    StubTraverser.do_*
    
Balanced patterns such as:

    [*]: List[*]

work as expected. The script replaces the `*` in replacement-strings with
whatever matched `*` in the find-string.

**Regex patterns** (regular expression patterns) are denoted by a
find-string that ends with `$`. The trailing `$` does not become part of
the find-string. For example:

    ab(.*)de$: de\1\1ab

A pattern is a **plain pattern** if it is neither a balanced nor a regex
pattern.

The script matches patterns to *all parts* of return expressions.

*Important*: The script applies patterns *separately* to each return
expression. Comments never appear in return expressions, and all strings in
return values appear as str. As a result, there is no context to worry
about context in which patterns are matched. Very short patterns suffice.

</t>
<t tx="ekr.20160211111823.1">
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
</t>
<t tx="ekr.20160211111839.1">
#### [Def Name Patterns]

The script matches the find-strings in this section against names of
functions and methods. For methods, the script matches find-strings against
names of the form:

    class_name.method_name

When a find-string matches, the replacement-string becomes the return type
in the stub, without any further pattern matching. That is, this section
*overrides* [General Patterns].

Example 1:

    [Def Name Patterns]
    myFunction: List[str]
    
Any function named myFunction returns List[str].

Example 2:

    [Def Name Patterns]
    MyClass.myMethod: str
    
The myMethod method of the MyClass class returns str.

Example 3:

    [Def Name Patterns]
    MyClass.do_*: str
    
All methods of the MyClass class whose names start with "do_" return str.
</t>
<t tx="ekr.20160211111901.1">
#### [General Patterns]

For each function or method, the script matches the patterns in this
section against **all parts** of all return expressions in each function or method.

The intent of the patterns in this section should be to **reduce** return
expressions to **known types**. A known type is a either a name of a type
class, such as int, str, long, etc. or a **type hint**, as per
[Pep 484](https://www.python.org/dev/peps/pep-0484/).

The script *always* produces a syntactically correct stub, even if the
patterns do not reduce the return expression to a known type. For unknown
types, the script does the following:

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

    def foo(a) --&gt; Any: ...
        # return a+frungify(a)
        # return defrungify(a)
        
The comments preserve maximal information about return types, which should
help the user to supply a more specific return type. The user can do this
in two ways by altering the stub files by hand or by adding new patterns to
the config file.
</t>
<t tx="ekr.20160211113019.1">
### Quick Start

1. Put `make_stub_files.py` on your path.

2. Enter a directory containing .py files:

        cd myDirectory
    
3. Generate stubs for foo.py in foo.pyi:

        make_stub_files foo.py

4. Look at foo.pyi to see the generated stubs.

5. Regenerate foo.pyi with more verbose output:

        make_stub_files foo.py -o -v

   The -o (--overwrite) option allows the script to overwrite foo.pyi.  
   The -v (--verbose) options generates return comments for all stubs in foo.pyi.
   
6. Update foo.pyi:

        make_stub_files -o -u
        
   The -u (--update) options updates foo.pyi as follows:
   
   - adds stubs to foo.pyi for classes and defs that are new in foo.py.
   - deletes stubs in foo.pyi for classes and defs that no longer exist in foo.py.
   - leaves all other stubs in foo.pyi unchanged.
   
7. Specify a configuration file containing patterns:

        make_stub_files -c myConfigFile.cfg -o
</t>
<t tx="ekr.20160318141204.5">def merge_types(a1, a2):
    '''
    a1 and a2 may be strings or lists.
    return a list containing both of them, flattened, without duplicates.
    '''
    # Only useful if visitors could return either lists or strings.
    assert a1 is not None
    assert a2 is not None
    r1 = a1 if isinstance(a1, (list, tuple)) else [a1]
    r2 = a2 if isinstance(a2, (list, tuple)) else [a2]
    return sorted(set(r1 + r2))

</t>
<t tx="ekr.20160330201030.1">Metadata-Version: 1.0
Name: make_stub_files
Version: 0.1
Summary: make stub files for mypy
Home-page: https://github.com/edreamleo/make-stub-files
Author: Edward K. Ream
Author-email: edreamleo@gmail.com
License: MIT
Description:
    Usage: make_stub_files.py [options] file1, file2, ...
    
    Options:
      -h, --help          show this help message and exit
      -c FN, --config=FN  full path to configuration file
      -d DIR, --dir=DIR   full path to the output directory
      -o, --overwrite     overwrite existing stub (.pyi) files
      -t, --test          run unit tests on startup
      --trace-matches     trace Pattern.matches
      --trace-patterns    trace pattern creation
      --trace-reduce      trace st.reduce_types
      --trace-visitors    trace visitor methods
      -u, --update        update stubs in existing stub file
      -v, --verbose       verbose output in .pyi file
      -w, --warn          warn about unannotated args

Download URL: https://github.com/edreamleo/make-stub-files
Keywords: mypy, type checking, stub, Python
Platform: Windows, Linux, MacOS
Categories:
    Development Status :: 4 - Beta
    License :: OSI Approved :: MIT License
    Operating System :: MacOS
    Operating System :: Microsoft :: Windows
    Operating System :: POSIX :: Linux
    Programming Language :: Python
    Topic :: Software Development
</t>
<t tx="ekr.20180706073424.1"># pyflakes complains about the TestClass class.</t>
<t tx="ekr.20210804020706.1">g.cls()
command = r"python -m pytest --cov-report html --cov-report term-missing --cov make_stub_files make_stub_files.py"
g.execute_shell_commands(command, trace=False)
</t>
<t tx="ekr.20210804021331.1">g.cls()
"""Run make_stub_files with the given set of arguments."""
cfg = r'c:\users\Edward~1\make_stub_files.cfg'
msf = 'make_stub_files.py'
src = 'make_stub_files.py'
command = f"python {msf} -c {cfg} -o -v {src}"
g.execute_shell_commands(command, trace=False)</t>
<t tx="ekr.20210804060105.1">g.cls()
test = '' # '.TestMakeStubFiles.test_bug3' # Run all tests.
command = f"python -m unittest make_stub_files{test}"
g.execute_shell_commands(command, trace=False)</t>
<t tx="ekr.20210804153200.1">"""Convert all following @test nodes."""
g.cls()

def body(p):
    def_s = f"def {headline(p)}(self):\n"
    lines = [' '*4 + z.rstrip()+'\n' for z in g.splitLines(p.b) if '@others' not in z]
    return def_s + ''.join(lines)

def headline(p):
    return p.h[1:].replace('-','_').replace(' ','_').replace('__', '_')

while p:
    if p.h.startswith('@test'):
        if 1:  # Change.
            print(p.h)
            p.b = body(p)  # body first, to use original headline.
            p.h = headline(p)
            p.setDirty()
        else:  # Report.
            h = headline(p)
            b = body(p)
            print(h.rstrip())
            print(b.rstrip())
            print('-'*40)
    p.moveToThreadNext()
c.redraw()
</t>
<t tx="ekr.20210805053830.1">
@language rest
@wrap
https://github.com/edreamleo/make-stub-files/issues/18


@language python
@nosearch
</t>
<t tx="ekr.20210805054028.1">@language rest
@wrap

https://github.com/edreamleo/make-stub-files/issues/19

@language python
@nosearch
</t>
<t tx="ekr.20210805061637.1"></t>
<t tx="ekr.20210805061823.1"></t>
<t tx="ekr.20210805061856.1"></t>
<t tx="ekr.20210805061902.1"></t>
</tnodes>
</leo_file>
