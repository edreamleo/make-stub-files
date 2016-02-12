# make_stub_files: Fri 12 Feb 2016 at 09:55:15

from typing import Any, Dict, Optional, Sequence, Tuple, Union
# At present, I don't understand how to tell mypy about ast.Node
# import ast
# Node = ast.Node
Node = Any
def truncate(s: str, n: int) -> str: ...
    #   0: return s if len(s)<=n else s[:n-3]+'...'
    #   0: return str
