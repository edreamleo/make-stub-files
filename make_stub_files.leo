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
<v t="ekr.20210807133351.1"><vh>@button unitttest1</vh></v>
<v t="ekr.20210804021331.1"><vh>@button msf</vh></v>
</v>
</v>
<v t="ekr.20210805061856.1"><vh>Notes</vh>
<v t="ekr.20210805061902.1"><vh>No longer used</vh>
<v t="ekr.20160318141204.65"><vh>f.Exec</vh></v>
<v t="ekr.20160318141204.41"><vh>f.Index</vh></v>
<v t="ekr.20160318141204.74"><vh>f.Print</vh></v>
<v t="ekr.20160318141204.46"><vh>f.Repr</vh></v>
<v t="ekr.20160318141204.80"><vh>f.TryExcept</vh></v>
<v t="ekr.20160318141204.81"><vh>f.TryFinally</vh></v>
<v t="ekr.20180902073131.1"><vh>g.execute_shell_commands</vh></v>
<v t="ekr.20160318141204.97"><vh>g.isString &amp; isUnicode</vh></v>
<v t="ekr.20160318141204.93"><vh>g.NullObject</vh></v>
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
<v t="ekr.20210809094659.1"><vh>@@@clean launch_msf.py</vh></v>
</v>
<v t="ekr.20210805053830.1"><vh>=== #18: full coverage</vh>
<v t="ekr.20210806162349.1"><vh>--- changed &amp; new AstFormatter visitors</vh>
<v t="ekr.20160318141204.91"><vh>arg_formatter.Constants &amp; Name</vh></v>
<v t="ekr.20160318141204.59"><vh>f.AnnAssign &amp; Assign</vh></v>
<v t="ekr.20160318141204.31"><vh>f.arguments</vh></v>
<v t="ekr.20160318141204.35"><vh>f.Call &amp; f.keyword</vh>
<v t="ekr.20160318141204.36"><vh>f.keyword</vh></v>
</v>
<v t="ekr.20160318141204.20"><vh>f.ClassDef</vh></v>
<v t="ekr.20210804214511.1"><vh>f.Constant</vh></v>
<v t="ekr.20160318141204.75"><vh>f.Raise</vh></v>
<v t="ekr.20160318141204.18"><vh>f.visit</vh></v>
<v t="ekr.20160318141204.83"><vh>f.With</vh></v>
<v t="ekr.20160318141204.84"><vh>f.Yield</vh></v>
<v t="ekr.20160318141204.85"><vh>f.YieldFrom</vh></v>
</v>
<v t="ekr.20210807151105.1"><vh>--- changed StubFormatter visitors</vh>
<v t="ekr.20160318141204.168"><vh>sf.Return</vh></v>
<v t="ekr.20160318141204.167"><vh>sf.UnaryOp</vh></v>
</v>
<v t="ekr.20210807213637.1"><vh>--- changed StubTraverser methods</vh>
<v t="ekr.20160318141204.191"><vh>st.format_return_expressions</vh></v>
</v>
</v>
<v t="ekr.20160318141204.1"><vh>@file make_stub_files.py</vh></v>
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

This script is a modified code formatter. This script traverses the incoming ast tree *once* from the top down, generating results from the bottom up. There is only a *single* traversal, composed of four traversal classes. (See [below](#traversers) for details). This traversal produces a stub for every class and def line. To do this, it **replaces expressions with type hints**. In other words, the goal is to **reduce** expressions to **known types**, as defined by Pep 484.

The StubFormatter visitors do most of the work of type reduction. They delegate type reduction to the following helpers:

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

A few examples may make this script's operation clearer. The --trace-matches and --trace-reduce switches turn on detailed traces that show exactly when and where reductions happen, and what the resulting type hints are. These traces are the truth.  Believe them, not words here.

Given the file truncate.py:

    def truncate(s, n):
        """Return s truncated to n characters."""
        return s if len(s) &lt;= n else s[:n-3] + '...'
        
The script produces this output with the --verbose option in effect:

    def truncate(s: str, n: int) -&gt; str: ...
        #   0: return s if len(s)&lt;=n else s[:n-3]+'...'
        #   0: return str
        
Here is the output with --trace-reduce --trace-matches in effect:

    make_stub_files.py -c make_stub_files.cfg truncate.py -v -o --trace-reduce --trace-matches
    
    callers                     pattern                types ==&gt; hint    
    =======                     =======         ========================
    reduce_types: do_BinOp                      [int, number] ==&gt; number
    match_all:    do_Subscript  str[*]: str      str[:number] ==&gt; str
    reduce_types: do_IfExp                               str] ==&gt; str

Finally, here is *part* of the result of tracing make_stub_files.py itself::

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
    
This trace contains all essential data concerning pattern matching and type reduction.

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

August, 2021: make_stub_files.py now contains traditional unit tests.  See the TestMakeStubFiles class.

Run these unit tests with:

    cd make_stub_files
    python -m unittest make_stub_files
    
Run coverage tests with:

    cd make_stub_files
    python -m pytest --cov-report html --cov-report term-missing --cov make_stub_files make_stub_files.py

&lt;a name="summary"/&gt;
### Summary

make_stub_files.py is a straightforward tree traversal. Or so it seems to me.
Please feel free to ask questions.

Edward K. Ream  
edreamleo@gmail.com</t>
<t tx="ekr.20160207181637.1"></t>
<t tx="ekr.20160207181648.1"></t>
<t tx="ekr.20160207182535.1"></t>
<t tx="ekr.20160211110739.1">@language rest
@wrap

This is the readme file for `make_stub_files.py`. This file explains what the script does, how it works and why it is important. After a brief overview, a step-by-step section will get you started. Full source code for make_stub_files.py is in its [github repository](https://github.com/edreamleo/make-stub-files). Everything is in the public domain.

Before reading further, please be aware of two other tools that create mypy stubs:

- [MonkeyType](https://monkeytype.readthedocs.io/en/latest/index.html) (Python 3),
- [PyAnnotate](https://github.com/dropbox/pyannotate),
- [stubgen](https://mypy.readthedocs.io/en/stable/stubgen.html).

stubgen produces only minimal stubs, but MonkeyType and PyAnnotate are worth serious consideration.

@others</t>
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

`make_stub_files` eliminates much of the drudgery of creating [python stub (.pyi) files](https://www.python.org/dev/peps/pep-0484/#stub-files) from python source files. Stub files can be used by people who use Python 2.x code bases.

</t>
<t tx="ekr.20160211110810.1">
### Command-line arguments

    usage: make_stub_files.py [options] file1, file2, ...

    make_stub_file: Create stub (.pyi) files from python files
    
    positional arguments:
      FILE                  input files
    
    optional arguments:
      -h, --help            show this help message and exit
      -c FILE, --config FILE
                            full path to configuration file
      -d DIR, --dir DIR     full path to the output directory
      -f, --force-pyx       force the parsing of .pyx files
      -o, --overwrite       overwrite existing stub (.pyi) files
      -s, --silent          run without messages
      --trace-matches       trace Pattern.matches
      --trace-patterns      trace pattern creation
      --trace-reduce        trace st.reduce_types
      --trace-visitors      trace visitor methods
      -u, --update          update stubs in existing stub file
      -v, --verbose         verbose output in .pyi file
      -w, --warn            warn about unannotated args

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

Finally, stubs can simplify the general type inference problem. Without type hints or annotations, the type of everything depends on the type of everything else. Stubs could allow robust, maybe even complete, type inference to be done locally. Stubs help mypy to work faster.
</t>
<t tx="ekr.20160211110811.1">
### Summary

The make-stub-files script does for type/design analysis what Leo's c2py command did for converting C sources to python. It eliminates much of the drudgery associated with creating stub files, leaving the programmer to make non-trivial inferences.

Stub files allow us to explore type checking using mypy as a guide and helper. Stub files are both a design document and an executable, checkable, type specification. Stub files allow those with a Python 2 code base to use mypy.

One could imagine a similar insert_annotations script that would inject function annotations into source files using stub files as data. The "reverse" script should be more straightforward than this script.

Edward K. Ream  
January 25 to February 15, 2016
Revised, August 5, 2021.
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
<t tx="ekr.20160318141204.167"># UnaryOp(unaryop op, expr operand)

def do_UnaryOp(self, node: Node) -&gt; str:
    """StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators."""
    op = self.op_name(node.op)
    if op.strip() == 'not':
        return 'bool'
    s = op + self.visit(node.operand)  # bug fix: 2021/08/07.
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160318141204.168">def do_Return(self, node: Node) -&gt; str:
    """
    StubFormatter ast.Return vsitor.
    Return only the return expression itself.
    """
    s = AstFormatter.do_Return(self, node)
    s = s.strip()
    assert s.startswith('return'), repr(s)
    return s[len('return'):].strip()
</t>
<t tx="ekr.20160318141204.18">def visit(self, node: Node) -&gt; str:
    """Return the formatted version of an Ast node, or list of Ast nodes."""
    tag = 'AstFormatter.visit'
    name = node.__class__.__name__
    ### g.trace(name) ###
    if isinstance(node, (list, tuple)):
        return ','.join([self.visit(z) for z in node])  # pragma: no cover (defensive)
    if node is None:
        return 'None'  # pragma: no cover
    method_name = 'do_' + node.__class__.__name__
    method = getattr(self, method_name, None)
    if method:
        s = method(node)
        assert isinstance(s, str), s.__class__.__name__
        return s
    # #13: *Never* ignore missing visitors!
    #      Insert an error comment directly into the output.
    message = f"\n#{tag}: no visitor: do_{name}\n"  # pragma: no cover (defensive)
    print(message, flush=True)  # pragma: no cover (defensive)
    return message  # pragma: no cover (defensive)
</t>
<t tx="ekr.20160318141204.191">def format_return_expressions(self,
    node: Node, name: str, raw_returns: List[Any], reduced_returns: List[Any]
) -&gt; str:
    """
    aList is a list of maximally reduced return expressions.
    For each expression e in Alist:
    - If e is a single known type, add e to the result.
    - Otherwise, add Any # e to the result.
    Return the properly indented result.
    """
    assert len(raw_returns) == len(reduced_returns)
    lws = '\n' + ' ' * 4
    n = len(raw_returns)
    known = all(is_known_type(e) for e in reduced_returns)
    empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
    tail = ': ...' if empty else ':'
    # pylint: disable=no-else-return
    if not known or self.verbose:
        # First, generate the return lines.
        aList = []
        for i in range(n):
            e, raw = reduced_returns[i], raw_returns[i]
            known2 = ' ' if is_known_type(e) else '?'
            aList.append('# %s %s: %s' % (' ', i, raw.rstrip()))
            aList.append('# %s %s: return %s' % (known2, i, e))
        results = ''.join([lws + self.indent(z) for z in aList])
        # Put the return lines in their proper places.
        if known:
            s = reduce_types(reduced_returns, name=name, trace=self.trace_reduce)
            return s + tail + results
        return 'Any' + tail + results
    s = reduce_types(reduced_returns, name=name, trace=self.trace_reduce)
    return s + tail
</t>
<t tx="ekr.20160318141204.20"># ClassDef(identifier name, expr* bases, keyword* keywords, stmt* body, expr* decorator_list)

def do_ClassDef(self, node: Node) -&gt; str:
    result = []
    name = node.name  # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if getattr(node, 'decorator_list', None):
        for decorator in node.decorator_list:
            result.append(f"@{self.visit(decorator)}\n")  # Bug fix: 2021/08/06.
    if getattr(node, 'keywords', None):
        for keyword in node.keywords:
            bases.append('%s=%s' % (keyword.arg, self.visit(keyword.value)))
    # Fix issue #2: look ahead to see if there are any functions in this class.
    empty = not any(isinstance(z, ast.FunctionDef) for z in node.body)
    tail = ' ...' if empty else ''
    if bases:
        result.append(
            self.indent('class %s(%s):%s\n' % (name, ', '.join(bases), tail)))
    else:
        result.append(self.indent('class %s:%s\n' % (name, tail)))  # Fix #2
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.31"># arguments = (
#       arg* posonlyargs, arg* args, arg? vararg, arg* kwonlyargs,
#       expr* kw_defaults, arg? kwarg, expr* defaults
# )

def do_arguments(self, node: Node) -&gt; str:
    """Format the arguments node."""
    kind = self.kind(node)
    assert kind == 'arguments', kind
    args = [self.visit(z) for z in node.args]
    defaults = [self.visit(z) for z in node.defaults]
    # Assign default values to the last args.
    args2 = []
    # PEP 570: Position-only args.
    posonlyargs = getattr(node, 'posonlyargs', [])
    if posonlyargs:
        for z in posonlyargs:
            args2.append(self.visit(z))
        args2.append('/')
    # Regular args.
    n_plain = len(args) - len(defaults)
    for i in range(len(args)):
        if i &lt; n_plain:
            args2.append(args[i])
        else:
            args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
    # PEP 3102: keyword-only args.
    if node.kwonlyargs:
        assert len(node.kwonlyargs) == len(node.kw_defaults)
        args2.append('*')
        for n, z in enumerate(node.kwonlyargs):
            if node.kw_defaults[n] is None:
                args2.append(self.visit(z))
            else:
                args2.append('%s=%s' % (self.visit(z), self.visit(node.kw_defaults[n])))
    # Add the vararg and kwarg expressions.
    vararg = getattr(node, 'vararg', None)
    if vararg:
        args2.append('*' + self.visit(vararg))
    kwarg = getattr(node, 'kwarg', None)
    if kwarg:
        args2.append('**' + self.visit(kwarg))
    return ', '.join(args2)
</t>
<t tx="ekr.20160318141204.35"># Call(expr func, expr* args, keyword* keywords)

def do_Call(self, node: Node) -&gt; str:
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    return '%s(%s)' % (func, ', '.join(args))
</t>
<t tx="ekr.20160318141204.36"># keyword = (identifier arg, expr value)

def do_keyword(self, node: Node) -&gt; str:
    """Handle keyword *arg*, not a Python keyword!"""
    # node.arg is a string.
    value = self.visit(node.value)
    return '%s=%s' % (node.arg, value) if node.arg else '**%s' % value

</t>
<t tx="ekr.20160318141204.41">def do_Index(self, node):  # pragma: no cover (python 2)
    return self.visit(node.value)

</t>
<t tx="ekr.20160318141204.46">def do_Repr(self, node):  # pragma: no cover (Python 2.x only)
    return 'repr(%s)' % self.visit(node.value)

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
<t tx="ekr.20160318141204.59"># AnnAssign(expr target, expr annotation, expr? value, int simple)

def do_AnnAssign(self, node: Node) -&gt; str:
    return self.indent('%s: [%s] = %s\n' % (
        self.visit(node.target),
        self.visit(node.annotation),
        self.visit(node.value)))

def do_Assign(self, node: Node) -&gt; str:
    return self.indent('%s = %s\n' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value)))
</t>
<t tx="ekr.20160318141204.65">def do_Exec(self, node):  # pragma: no cover (Python 2.x only)
    body = self.visit(node.body)
    args = []  # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        return self.indent('exec %s in %s\n' % (
            body, ','.join(args)))
    return self.indent('exec %s\n' % (body))

</t>
<t tx="ekr.20160318141204.74">def do_Print(self, node):  # pragma: no cover (Python 2.x only)
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None):
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None):
        vals.append('nl=%s' % node.nl)
    return self.indent('print(%s)\n' % ','.join(vals))

</t>
<t tx="ekr.20160318141204.75">def do_Raise(self, node: Node) -&gt; str:
    args = []
    for attr in ('exc', 'cause'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    args_s = f" {', '.join(args)}" if args else ''
    return self.indent('raise%s\n' % args_s)


</t>
<t tx="ekr.20160318141204.80">def do_TryExcept(self, node):  # pragma: no cover (python 2)
    result = []
    result.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.81">def do_TryFinally(self, node):  # pragma: no cover (python 2)
    result = []
    result.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append(self.indent('finally:\n'))
    for z in node.finalbody:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.83"># With(withitem* items, stmt* body)

def do_With(self, node: Node) -&gt; str:
    result = []
    result.append(self.indent('with '))
    vars_list = []
    if getattr(node, 'items', None):
        for item in node.items:
            result.append(self.visit(item.context_expr))
            result.append(' as ')
            if getattr(item, 'optional_vars', None):
                try:
                    for z in item.optional_vars: # pragma: no cover (expect TypeError)
                        vars_list.append(self.visit(z))
                except TypeError:
                    vars_list.append(self.visit(item.optional_vars))
                
    result.append(','.join(vars_list))
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160318141204.84">def do_Yield(self, node: Node) -&gt; str:
    # do_Expr has already indented this *expression*.
    if getattr(node, 'value', None):
        return 'yield %s' % self.visit(node.value)
    return 'yield'
</t>
<t tx="ekr.20160318141204.85"># YieldFrom(expr value)

def do_YieldFrom(self, node: Node) -&gt; str:
    # do_Expr has already indented this *expression*.
    return 'yield from %s' % self.visit(node.value)
</t>
<t tx="ekr.20160318141204.91"># Return generic markers to allow better pattern matches.

def do_Constant(self, node: Node) -&gt; str:
    return 'None' if node.value is None else node.value.__class__.__name__

def do_BoolOp(self, node: Node) -&gt; str:  # pragma: no cover (obsolete)
    return 'bool'

def do_Bytes(self, node: Node) -&gt; str:  # pragma: no cover (obsolete)
    return 'bytes'

def do_Name(self, node: Node) -&gt; str:  # pragma: no cover (obsolete)
    return 'bool' if node.id in ('True', 'False') else node.id

def do_Num(self, node: Node) -&gt; str:  # pragma: no cover (obsolete)
    return 'number'

def do_Str(self, node: Node) -&gt; str:  # pragma: no cover (obsolete)
    """This represents a string constant."""
    return 'str'
</t>
<t tx="ekr.20160318141204.93">
class NullObject:
    """
    An object that does nothing, and does it very well.
    From the Python cookbook, recipe 5.23
    """
    def __init__(self, *args, **keys): pass
    def __call__(self, *args, **keys): return self
    def __repr__(self): return "NullObject"
    def __str__(self): return "NullObject"
    def __bool__(self): return False
    def __nonzero__(self): return 0
    def __delattr__(self, attr): return self
    def __getattr__(self, attr): return self
    def __setattr__(self, attr, val): return self
</t>
<t tx="ekr.20160318141204.97">def isString(self, s):
    """Return True if s is any string, but not bytes."""
    # pylint: disable=no-member
    if isPython3:
        return isinstance(s, str)
    return isinstance(s, types.StringTypes)

def isUnicode(self, s):
    """Return True if s is a unicode string."""
    # pylint: disable=no-member
    if isPython3:
        return isinstance(s, str)
    return isinstance(s, types.UnicodeType)
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
<t tx="ekr.20180902073131.1" annotate="7d71002e">def execute_shell_commands(self, commands, trace=False):
    """
    Execute each shell command in a separate process.
    Wait for each command to complete, except those starting with '&amp;'
    """
    if g.isString(commands):
        commands = [commands]
    for command in commands:
        wait = not command.startswith('&amp;')
        if command.startswith('&amp;'):
            command = command[1:].strip()
        proc = subprocess.Popen(command, shell=True)
        if wait:
            proc.communicate()
</t>
<t tx="ekr.20210804020706.1">g.cls()
command = r"python -m pytest --cov-report html --cov-report term-missing --cov make_stub_files make_stub_files.py"
g.execute_shell_commands(command, trace=False)
</t>
<t tx="ekr.20210804021331.1">g.cls()
"""Run make_stub_files with the given set of arguments."""
cfg = r'c:\users\Edward~1\make_stub_files.cfg'
msf = 'make_stub_files.py'
src = 'make_stub_files.py'
command = f"python {msf} -c {cfg} -o -v {src} -h"
g.execute_shell_commands(command, trace=False)</t>
<t tx="ekr.20210804060105.1">"""Run all unit tests"""
g.cls()
command = f"python -m unittest make_stub_files"
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
<t tx="ekr.20210804214511.1">def do_Constant(self, node: Node) -&gt; str:  # #13
    return repr(node.value)
</t>
<t tx="ekr.20210805053830.1">@language rest

https://github.com/edreamleo/make-stub-files/issues/18

^(def .*)(:\s*?)$
\1 -&gt; XXX:


@language python
@nosearch
</t>
<t tx="ekr.20210805061637.1"></t>
<t tx="ekr.20210805061856.1"></t>
<t tx="ekr.20210805061902.1"></t>
<t tx="ekr.20210806162349.1"></t>
<t tx="ekr.20210807133351.1">g.cls()
# Run one test.
# test = '.TestMakeStubFiles.test_stub_formatter_class'
# test = '.TestMakeStubFiles.test_ast_arg_formatter_class'
# test = '.TestMakeStubFiles.test_st_format_returns'
# test = '.TestMakeStubFiles.test_rt_is_known_type'
# test = '.TestMakeStubFiles.test_pattern_class'
# test = '.TestMakeStubFiles.test_controller_class'
# test = '.TestMakeStubFiles.test_stub_formatter_class'
test = '.TestMakeStubFiles.test_stub_traverser_class'
command = f"python -m unittest make_stub_files{test}"
g.execute_shell_commands(command, trace=False)</t>
<t tx="ekr.20210807151105.1"></t>
<t tx="ekr.20210807213637.1"></t>
<t tx="ekr.20210809094659.1">"""
Use a separate file to launch make_stub_file.py to test the stubs in
make_stub_files.pyi.
"""
import os
import sys
# import make_stub_files
from make_stub_files import main
print('main', main)
if 0:
    fn = __file__
    directory = os.path.dirname(fn)
    print('directory', directory)
    for z in sys.path:
        print(z)
    if directory not in sys.path:
        sys.path.insert(0, directory)
        print('Add directory', directory)
sys.argv = ['python', 'make_stub_files.py']
# print(dir(make_stub_files))
main()
</t>
</tnodes>
</leo_file>
