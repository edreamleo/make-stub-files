
This is the theory of operation document for the make_stub_files script.

=== Patterns
- Distributing patterns to visitors.
- trace-patterns, trace-matches, trace-visitors
- Are user patterns recognized everywhere?
  Explain the code and the issues.

=== Reducing types
- List vs. strings.
- I'll use lists only if strings simply can't do the job.  That's unlikely.
- An assert in AstFormatter.visit will fail if a visitor mistakenly returns a list.
- Visitors can create Tuple[...] types by calling reduce_types(aList)
- Top-level call to reduce_types merges Tuples.

=== Unit testing
- Alt-4,5,6
- write-unit-tests button.

=== Demonstration that *nothing* remains to be removed.

* This is a *very* simple program!

- The key are the three calls to reduce_types in the visitors:
do_BinOp, do_BoolOp and do_IfExp

- sf.match_all called from do_Tuple, do_Call, do_Subscript, do_UnaryOp.
  It probably should be called from do_BinOp, do_Dict, do_List.

- Very simple *type-parsing methods* allows the script to
  *use strings everywhere*:
    - split_types
  
  (merge_types is elegant, but will not be used.)

* reduce_type is the *key* method. This is a lucky accident!
