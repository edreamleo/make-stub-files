
This is the theory-of-operation document for the `make_stub_files` script.
It is intentionally brief. Please ask question if anything is unclear.

### Prerequisites

Maintainers should be familiar with the following:

- The [Python 3 ast class](https://docs.python.org/3/library/ast.html).
  You should know what a tree traversal is.
- [Pep 484](https://www.python.org/dev/peps/pep-0484/) and
  [Python's typing module](https://docs.python.org/3/library/typing.html).
  Having a clear **target language** greatly simplifies this project.
  
You don't need to know anything about type inference.

### High level description

This is, truly, a *very* simple script. This script is a code formatter, quite similar to the AstFormatter class. This script traverses the incoming ast tree *once* from the top down, generating results from the bottom up. There is only a *single* traversal, composed of for traversal classes:
the AstFormatter, AstArgFormatter, StubFormatter and StubTraverser classes. Each class produces the results needed at a particular point of the traversal.

This traversal produces a stub for every class and def line. To do this, it **replaces expressions with type hints**. In other words, the goal is to **reduce** expressions to **known types**.  Pep 484 and the typing module define the known types.  The `is_known_type` function embodies that knowledge. 

The StubFormatter visitors do most of the work of type reduction. They are simple because they delegate type reduction to the following helpers:

1. **reduce_types(aList)** (a top-level function) reduces a *list* of 0 or more types to a *string* representing a type hint. It returns 'Any' for unknown types. At the top of the traversal, StubTraverser.do_FunctionDef also calls reduce_types (via helpers) on the list of all return expressions.

2. **sf.match_all(node, s)** applies all user-patterns to s and returns the result.

In short, visitors are hardly more complex than the corresponding AstFormatter methods.

**Notes**:

- The `sf.do_Attribute` and `sf.do_Name` visitors look up names in `sf.names_dict`. This is much faster than matching patterns.

- `sf.match_all` is very fast because it only applies patterns that *could possibly* match at the node being visited. Those patterns are:

        self.patterns_dict.get(node.__class__.__name__, [])

- The startup code create the `names_dict` and the `patterns_dict`.  That's  all you have to know about the startup code.

- The Pattern class handles almost all details of pattern matching. This shields the rest of the code from knowledge of patterns. In particular, `sf.match_all` knows nothing about patterns.

### Examples

The previous section is really you should need to know about this program.  However, a few examples may make this script's operation clearer. The --trace-matches and --trace-reduce switches turn on detailed traces that show exactly when and where reductions happen, and what the resulting type hints are. These traces are the truth.  Believe them, not words here.

Given the file truncate.py:

    def truncate(s, n):
        '''Return s truncated to n characters.'''
        return s if len(s) <= n else s[:n-3] + '...'
        
The script produces this output with the --verbose option in effect:

    def truncate(s: str, n: int) -> str: ...
        #   0: return s if len(s)<=n else s[:n-3]+'...'
        #   0: return str
        
Here is the output with --trace-reduce --trace-matches in effect:

    make_stub_files.py -c msf.cfg truncate.py -v -o --trace-reduce --trace-matches
    
    callers                     pattern                types ==> hint    
    =======                     =======         ========================
    reduce_types: do_BinOp                      [int, number] ==> number
    match_all:    do_Subscript  str[*]: str      str[:number] ==> str
    reduce_types: do_IfExp                               str] ==> str

Finally, here is *part* of the result of tracing make_stub_files.py itself:

          context                   pattern                                                          types ==> hint    
    =============================== ================ =========================================================================
    reduce_types: do_IfExp                                                    [bool, is_known_type(inner)] ==> ? Any
    reduce_types: do_IfExp                                                    [bool, is_known_type(inner)] ==> ? Any
    match_all:    do_Call           all(*): bool                  all(is_known_type(z.strip()) for z in... ==> bool
    reduce_types: is_known_type                                                                [Any, bool] ==> Union[Any, bool]
    match_all:    do_Call           sorted(*): str                                      sorted(Set[r1+r2]) ==> str
    reduce_types: show                                  [show_helper(List[Any][:], known, str, str, bool)] ==> ? Any
    match_all:    do_Subscript      r[*]: str                                                    r[number] ==> str
    match_all:    do_Call           str.join(*): str                                         str.join(str) ==> str
    reduce_types: reduce_types                       [show(str), show(str, known=bool), show_helper(Li...] ==> ? Any
    reduce_types: do_BinOp                                                                   [int, number] ==> number
    match_all:    do_Subscript      str[*]: str                                               str[:number] ==> str
    reduce_types: do_IfExp                                                                           [str] ==> str
    
    class AstFormatter
    
    reduce_types: do_BoolOp                                                              [val, val.strip()] ==> ? Any
    reduce_types: do_BoolOp                                                                      [Any, str] ==> Union[Any, str]
    reduce_types: visit                                                                               [str] ==> str
    reduce_types: do_IfExp                                                                            [str] ==> str
    match_all:    do_Call           repr(*): str                                               repr(Node.n) ==> str
    reduce_types: get_import_names                                                                 [result] ==> ? Any
    reduce_types: kind                                                            [Node.__class__.__name__] ==> ? Any
    
This trace contains pretty much everything you need to know about pattern matching and type reduction.

Enable tracing in various visitors if you need more data. 

### Unit testing

The easy way to do unit testing is from within Leo:

- Alt-6 runs all unit tests in @test nodes.
- Alt-5 runs all *marked* @test nodes. Super convenient while developing code.

The @button write-unit-test script writes all @test nodes to make_stub_files/test.

The --test option runs all test files in make_stub_files/test.

The following also runs all test files in make_stub_files/test:

    cd make_stub_files
    python -m unittest discover -s test

### Summary

This script is a straightforward tree traversal. Or so it seems to me.
Please feel free to ask questions.

Edward K. Ream  
edreamleo@gmail.com  
(608) 886-5730

