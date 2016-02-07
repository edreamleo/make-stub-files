
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

=== Bugs, problems, choices