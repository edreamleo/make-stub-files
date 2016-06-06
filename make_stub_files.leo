<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ekr.20160207181637.1"><vh>Startup</vh>
<v t="ekr.20160207181648.1"><vh>@settings</vh>
<v t="ekr.20160207181710.1"><vh>@data history-list</vh></v>
<v t="ekr.20160207181843.1"><vh>@button cfa-code</vh></v>
<v t="ekr.20160207182535.1"><vh>@bool preload-find-pattern = False</vh></v>
</v>
<v t="ekr.20160207105647.1"><vh>Scripts</vh>
<v t="ekr.20160206095102.1"><vh>@button write-unit-tests</vh>
<v t="ekr.20160206095102.2"><vh>&lt;&lt; docstring &gt;&gt; (write-unit-tests)</vh></v>
<v t="ekr.20160206101802.3"><vh>class TestWriter</vh>
<v t="ekr.20160206101802.4"><vh>&lt;&lt; define file_template &gt;&gt;</vh></v>
<v t="ekr.20160206101802.5"><vh>&lt;&lt; define test_template &gt;&gt;</vh></v>
<v t="ekr.20160206101802.6"><vh> ctor</vh></v>
<v t="ekr.20160206101802.7"><vh>clean</vh></v>
<v t="ekr.20160206101802.8"><vh>get_body</vh></v>
<v t="ekr.20160206101802.9"><vh>run</vh></v>
<v t="ekr.20160206103417.1"><vh>plural</vh></v>
<v t="ekr.20160206101802.10"><vh>test</vh></v>
<v t="ekr.20160206101802.11"><vh>write_file</vh></v>
</v>
</v>
<v t="ekr.20160207105710.1"><vh>@button check-leading-lines</vh></v>
</v>
<v t="ekr.20160126153016.3"><vh>Unused</vh>
<v t="ekr.20160206104033.1"><vh>@@test run all msf unit tests</vh></v>
<v t="ekr.20160208162138.1"><vh>from st.Call (failed experiment)</vh></v>
<v t="ekr.20160202064553.1"><vh>sf.match</vh></v>
<v t="ekr.20160202061118.1"><vh>sf.visit (attempts all matches on all nodes)</vh></v>
<v t="ekr.20160214103050.1"><vh>recent type-reduction stuff</vh>
<v t="ekr.20160214171726.1"><vh>unused code from is_known_type</vh></v>
<v t="ekr.20160214172029.1"><vh>unused code from rt.reduce_unknowns</vh></v>
<v t="ekr.20160214154338.1"><vh>recent, obsolete reduce_types code</vh></v>
</v>
<v t="ekr.20160214043351.1"><vh>rt.make_optional</vh></v>
</v>
</v>
<v t="ekr.20160128105006.1"><vh>Documentation</vh>
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
<v t="ekr.20160330201030.1"><vh>@clean PKG-INFO.TXT</vh></v>
<v t="ekr.20160211063121.1"><vh>Views for study</vh>
<v t="ekr.20160211074825.1"><vh>1. ctors</vh>
<v t="ekr.20160126153212.74"><vh>msf.ctor</vh></v>
<v t="ekr.20160128113859.1"><vh>pattern.ctor</vh></v>
<v t="ekr.20160202061329.1"><vh>sf.ctor</vh></v>
<v t="ekr.20160126153212.83"><vh>st.ctor</vh></v>
<v t="ekr.20160210134702.1"><vh>stub.ctor</vh></v>
</v>
<v t="ekr.20160211063226.1"><vh>2. Startup code</vh>
<v t="ekr.20160126153212.77"><vh>msf.scan_command_line</vh></v>
<v t="ekr.20160126153212.78"><vh>msf.scan_options &amp; helpers</vh>
<v t="ekr.20160204170921.1"><vh>msf.make_op_name_dict</vh></v>
<v t="ekr.20160203105356.1"><vh>msf.create_parser</vh></v>
<v t="ekr.20160204170443.1"><vh>msf.find_pattern_ops</vh></v>
<v t="ekr.20160203105721.1"><vh>msf.get_config_string</vh></v>
<v t="ekr.20160203074843.1"><vh>msf.init_parser</vh></v>
<v t="ekr.20160203094439.1"><vh>msf.is_section_name</vh></v>
<v t="ekr.20160204113206.1"><vh>msf.make_patterns_dict</vh></v>
<v t="ekr.20160126153212.79"><vh>msf.scan_patterns</vh></v>
</v>
</v>
<v t="ekr.20160211063252.1"><vh>3. Type-related ast.Node visitors</vh>
<v t="ekr.20160205053705.1"><vh>sf.Operands</vh>
<v t="ekr.20160205103604.4"><vh>sf.Attribute</vh></v>
<v t="ekr.20160126153212.81"><vh>sf.Constants: Bytes, Num, Str</vh></v>
<v t="ekr.20160205103604.9"><vh>sf.Dict</vh></v>
<v t="ekr.20160206204452.1"><vh>sf.List</vh></v>
<v t="ekr.20160204153904.1"><vh>sf.Name</vh></v>
<v t="ekr.20160126153212.38"><vh>sf.Tuple</vh></v>
</v>
<v t="ekr.20160205053641.1"><vh>sf.Operators</vh>
<v t="ekr.20160205053641.2"><vh>sf.BinOp</vh></v>
<v t="ekr.20160205053641.3"><vh>sf.BoolOp</vh></v>
<v t="ekr.20160205103604.6"><vh>sf.Call &amp; sf.keyword</vh>
<v t="ekr.20160205103604.7"><vh>sf.keyword</vh></v>
</v>
<v t="ekr.20160205053641.4"><vh>sf.Compare</vh></v>
<v t="ekr.20160205053641.6"><vh>sf.IfExp</vh></v>
<v t="ekr.20160205142626.1"><vh>sf.Subscript</vh></v>
<v t="ekr.20160205053641.5"><vh>sf.UnaryOp</vh></v>
</v>
<v t="ekr.20160201194801.1"><vh>sf.Return</vh></v>
</v>
<v t="ekr.20160211063238.1"><vh>4. Comments for return expressions</vh>
<v t="ekr.20160126153212.90"><vh>st.format_returns &amp; helpers</vh>
<v t="ekr.20160130032546.1"><vh>st.format_return_expressions</vh></v>
<v t="ekr.20160128122410.1"><vh>st.get_def_name</vh></v>
<v t="ekr.20160207190840.1"><vh>st.remove_recursive_calls</vh></v>
</v>
<v t="ekr.20160205072101.1"><vh>reduce_types</vh></v>
</v>
<v t="ekr.20160211074737.1"><vh>5. --update</vh>
<v t="ekr.20160126153212.85"><vh>st.run (main line) &amp; helpers</vh>
<v t="ekr.20160203183228.1"><vh>st.output_stubs</vh></v>
<v t="ekr.20160209105448.1"><vh>st.output_time_stamp</vh></v>
<v t="ekr.20160204224242.1"><vh>st.update &amp; helpers</vh>
<v t="ekr.20160205060709.1"><vh>st.get_stub_file</vh></v>
<v t="ekr.20160205060807.1"><vh>st.parse_stub_file</vh></v>
<v t="ekr.20160210041431.1"><vh>st.merge_stubs &amp; helpers</vh>
<v t="ekr.20160211060949.1"><vh>st.check_delete</vh></v>
<v t="ekr.20160211045806.1"><vh>st.flatten_stubs</vh></v>
<v t="ekr.20160210043910.1"><vh>st.find_parent_stub</vh></v>
<v t="ekr.20160210043933.1"><vh>st.find_stub</vh></v>
<v t="ekr.20160210043957.1"><vh>st.sort_stubs_by_hierarchy</vh></v>
</v>
<v t="ekr.20160209104843.1"><vh>st.trace_stubs</vh></v>
</v>
</v>
</v>
<v t="ekr.20160207165240.1"><vh>re: Improve inferences</vh>
<v t="ekr.20160126153212.90"></v>
<v t="ekr.20160205072101.1"></v>
<v t="ekr.20160205103604.6"></v>
<v t="ekr.20160126153212.88"><vh>st.visit_FunctionDef &amp; helpers</vh>
<v t="ekr.20160126153212.89"><vh>st.format_arguments &amp; helper</vh>
<v t="ekr.20160126153212.91"><vh>st.munge_arg</vh></v>
</v>
<v t="ekr.20160126153212.90"></v>
</v>
<v t="ekr.20160126153212.87"><vh>st.visit_ClassDef</vh></v>
</v>
</v>
</v>
<v t="ekr.20160128154704.1"><vh>Files</vh>
<v t="ekr.20160210112634.1"><vh>Test files</vh>
<v t="ekr.20160128154715.1"><vh>@clean test/test_msf.py</vh>
<v t="ekr.20160128190252.1"><vh>setUp</vh></v>
<v t="ekr.20160128190112.1"><vh>test_pattern_class</vh></v>
<v t="ekr.20160128190224.1"><vh>test_is_known_type</vh></v>
</v>
<v t="ekr.20160206165656.1"><vh>@clean test/test.py</vh></v>
</v>
<v t="ekr.20160128104714.1"><vh>Config files</vh>
<v t="ekr.20160128225533.1"><vh>@clean .gitignore</vh></v>
<v t="ekr.20160128102557.1"><vh>@clean example.cfg</vh></v>
<v t="ekr.20160128104639.1"><vh>@clean msf.cfg</vh></v>
<v t="ekr.20160126153220.1"><vh>@clean make_stub_files.cfg</vh></v>
<v t="ekr.20160206165507.1"><vh>@clean test.cfg</vh></v>
</v>
</v>
<v t="ekr.20160131174909.1"><vh>To do</vh></v>
<v t="ekr.20160206171945.1"><vh>Unit tests</vh>
<v t="ekr.20160207051429.1"><vh>@test merge_types</vh>
<v t="ekr.20160207051316.1"><vh>merge_types (not used)</vh></v>
</v>
<v t="ekr.20160206110004.1"><vh>@test Pattern class</vh>
<v t="ekr.20160206104634.1"><vh>  utility functions</vh>
<v t="ekr.20160210083825.1"><vh>dump</vh></v>
<v t="ekr.20160210141342.1"><vh>dump_dict</vh></v>
<v t="ekr.20160210141651.1"><vh>dump_list</vh></v>
<v t="ekr.20160126153212.100"><vh>main</vh></v>
<v t="ekr.20160206120522.1"><vh>pdb</vh></v>
<v t="ekr.20160207115604.1"><vh>truncate</vh></v>
</v>
<v t="ekr.20160131180118.1"><vh>class LeoGlobals</vh>
<v t="ekr.20160210143802.1"><vh>class NullObject (Python Cookbook)</vh></v>
<v t="ekr.20160203095618.2"><vh>g._callerName</vh></v>
<v t="ekr.20160203095618.1"><vh>g.callers</vh></v>
<v t="ekr.20160202170529.1"><vh>g.cls</vh></v>
<v t="ekr.20160131180244.1"><vh>g.pdb</vh></v>
<v t="ekr.20160203183934.1"><vh>g.shortFileName</vh></v>
<v t="ekr.20160206101140.1"><vh>g.splitLines</vh></v>
<v t="ekr.20160131180306.1"><vh>g.trace</vh></v>
</v>
<v t="ekr.20160128041938.1"><vh>class Pattern(object)</vh>
<v t="ekr.20160128113859.1"></v>
<v t="ekr.20160203130717.1"><vh>pattern.__eq__, __ne__, __hash__</vh></v>
<v t="ekr.20160128113914.1"><vh>pattern.str &amp; repr</vh></v>
<v t="ekr.20160128042857.1"><vh>pattern.is_balanced</vh></v>
<v t="ekr.20160206174054.1"><vh>pattern.is_regex</vh></v>
<v t="ekr.20160128042705.1"><vh>pattern.all_matches &amp; helpers</vh>
<v t="ekr.20160128051025.1"><vh>pattern.full_balanced_match</vh></v>
<v t="ekr.20160128045845.1"><vh>pattern.match_balanced</vh></v>
</v>
<v t="ekr.20160202070025.1"><vh>pattern.match (trace-matches)</vh></v>
<v t="ekr.20160128114726.1"><vh>pattern.match_entire_string</vh></v>
<v t="ekr.20160206174740.1"><vh>pattern.replace &amp; helpers</vh>
<v t="ekr.20160131204607.1"><vh>pattern.replace_balanced</vh></v>
<v t="ekr.20160206174547.1"><vh>pattern.replace_regex</vh></v>
</v>
</v>
</v>
<v t="ekr.20160206170515.1"><vh>@test reduce_numbers</vh>
<v t="ekr.20160214044429.1"><vh>class ReduceTypes</vh>
<v t="ekr.20160214044444.1"><vh>rt.ctor</vh></v>
<v t="ekr.20160130034812.1"><vh>rt.is_known_type</vh></v>
<v t="ekr.20160214051730.1"><vh>rt.reduce_collection</vh></v>
<v t="ekr.20160205101134.1"><vh>rt.reduce_numbers</vh></v>
<v t="ekr.20160214044515.1"><vh>rt.reduce_types</vh></v>
<v t="ekr.20160214094129.1"><vh>rt.reduce_unknowns</vh></v>
<v t="ekr.20160214044536.1"><vh>rt.show</vh></v>
<v t="ekr.20160206212123.1"><vh>rt.split_types</vh></v>
</v>
</v>
<v t="ekr.20160206173343.1"><vh>@test reduce_types</vh>
<v t="ekr.20160128041938.1"></v>
<v t="ekr.20160214044429.1"></v>
</v>
<v t="ekr.20160207162818.1"><vh>@test split_types</vh>
<v t="ekr.20160214044429.1"></v>
</v>
<v t="ekr.20160210145128.1"><vh>@test st.find_stub &amp; find_parent_stub</vh>
<v t="ekr.20160203075612.1"><vh> &lt;&lt; imports &gt;&gt; (@test st.find/parent_stub)</vh></v>
<v t="ekr.20160210164250.1"><vh>&lt;&lt; define s &gt;&gt; (@test st.find/parent_stub)</vh></v>
<v t="ekr.20160210082857.1"><vh>base classes</vh>
<v t="ekr.20160126153212.3"><vh> class AstFormatter</vh>
<v t="ekr.20160126153212.4"><vh> f.Entries</vh>
<v t="ekr.20160126153212.5"><vh>f.format</vh></v>
<v t="ekr.20160126153212.6"><vh>f.visit</vh></v>
</v>
<v t="ekr.20160126153212.7"><vh>f.Contexts</vh>
<v t="ekr.20160126153212.8"><vh>f.ClassDef</vh></v>
<v t="ekr.20160126153212.9"><vh>f.FunctionDef</vh></v>
<v t="ekr.20160126153212.10"><vh>f.Interactive</vh></v>
<v t="ekr.20160126153212.11"><vh>f.Module</vh></v>
<v t="ekr.20160126153212.12"><vh>f.Lambda</vh></v>
</v>
<v t="ekr.20160126153212.13"><vh>f.Expressions</vh>
<v t="ekr.20160126153212.14"><vh>f.Expr</vh></v>
<v t="ekr.20160126153212.15"><vh>f.Expression</vh></v>
<v t="ekr.20160126153212.16"><vh>f.GeneratorExp</vh></v>
<v t="ekr.20160126153212.17"><vh>f.ctx nodes</vh></v>
</v>
<v t="ekr.20160126153212.18"><vh>f.Operands</vh>
<v t="ekr.20160126153212.19"><vh>f.arguments</vh></v>
<v t="ekr.20160126153212.20"><vh>f.arg (Python3 only)</vh></v>
<v t="ekr.20160126153212.21"><vh>f.Attribute</vh></v>
<v t="ekr.20160126153212.22"><vh>f.Bytes</vh></v>
<v t="ekr.20160126153212.23"><vh>f.Call &amp; f.keyword</vh>
<v t="ekr.20160126153212.24"><vh>f.keyword</vh></v>
</v>
<v t="ekr.20160126153212.25"><vh>f.comprehension</vh></v>
<v t="ekr.20160126153212.26"><vh>f.Dict</vh></v>
<v t="ekr.20160126153212.27"><vh>f.Ellipsis</vh></v>
<v t="ekr.20160126153212.28"><vh>f.ExtSlice</vh></v>
<v t="ekr.20160126153212.29"><vh>f.Index</vh></v>
<v t="ekr.20160126153212.30"><vh>f.List</vh></v>
<v t="ekr.20160126153212.31"><vh>f.ListComp</vh></v>
<v t="ekr.20160126153212.32"><vh>f.Name &amp; f.NameConstant</vh></v>
<v t="ekr.20160126153212.33"><vh>f.Num</vh></v>
<v t="ekr.20160126153212.34"><vh>f.Repr</vh></v>
<v t="ekr.20160126153212.35"><vh>f.Slice</vh></v>
<v t="ekr.20160126153212.36"><vh>f.Str</vh></v>
<v t="ekr.20160126153212.37"><vh>f.Subscript</vh></v>
<v t="ekr.20160205143923.1"><vh>f.Tuple</vh></v>
</v>
<v t="ekr.20160126153212.39"><vh>f.Operators</vh>
<v t="ekr.20160126153212.40"><vh>f.BinOp</vh></v>
<v t="ekr.20160126153212.41"><vh>f.BoolOp</vh></v>
<v t="ekr.20160126153212.42"><vh>f.Compare</vh></v>
<v t="ekr.20160126153212.43"><vh>f.UnaryOp</vh></v>
<v t="ekr.20160126153212.44"><vh>f.ifExp (ternary operator)</vh></v>
</v>
<v t="ekr.20160126153212.45"><vh>f.Statements</vh>
<v t="ekr.20160126153212.46"><vh>f.Assert</vh></v>
<v t="ekr.20160126153212.47"><vh>f.Assign</vh></v>
<v t="ekr.20160126153212.48"><vh>f.AugAssign</vh></v>
<v t="ekr.20160126153212.49"><vh>f.Break</vh></v>
<v t="ekr.20160126153212.50"><vh>f.Continue</vh></v>
<v t="ekr.20160126153212.51"><vh>f.Delete</vh></v>
<v t="ekr.20160126153212.52"><vh>f.ExceptHandler</vh></v>
<v t="ekr.20160126153212.53"><vh>f.Exec</vh></v>
<v t="ekr.20160126153212.54"><vh>f.For</vh></v>
<v t="ekr.20160126153212.55"><vh>f.Global</vh></v>
<v t="ekr.20160126153212.56"><vh>f.If</vh></v>
<v t="ekr.20160126153212.57"><vh>f.Import &amp; helper</vh>
<v t="ekr.20160126153212.58"><vh>f.get_import_names</vh></v>
</v>
<v t="ekr.20160126153212.59"><vh>f.ImportFrom</vh></v>
<v t="ekr.20160317060308.2"><vh>f.Nonlocal (Python 3)</vh></v>
<v t="ekr.20160126153212.60"><vh>f.Pass</vh></v>
<v t="ekr.20160126153212.61"><vh>f.Print</vh></v>
<v t="ekr.20160126153212.62"><vh>f.Raise</vh></v>
<v t="ekr.20160126153212.63"><vh>f.Return</vh></v>
<v t="ekr.20160317060308.3"><vh>f.Starred (Python 3)</vh></v>
<v t="ekr.20160317060308.4"><vh>f.Try (Python 3)</vh></v>
<v t="ekr.20160126153212.64"><vh>f.TryExcept</vh></v>
<v t="ekr.20160126153212.65"><vh>f.TryFinally</vh></v>
<v t="ekr.20160126153212.66"><vh>f.While</vh></v>
<v t="ekr.20160126153212.67"><vh>f.With</vh></v>
<v t="ekr.20160126153212.68"><vh>f.Yield</vh></v>
<v t="ekr.20160317060308.5"><vh>f.YieldFrom (Python 3)</vh></v>
</v>
<v t="ekr.20160126153212.69"><vh>f.Utils</vh>
<v t="ekr.20160126153212.70"><vh>f.kind</vh></v>
<v t="ekr.20160126153212.71"><vh>f.indent</vh></v>
<v t="ekr.20160126153212.72"><vh>f.op_name</vh></v>
</v>
</v>
<v t="ekr.20160202165117.1"><vh>class AstArgFormatter (AstFormatter)</vh>
<v t="ekr.20160202165143.1"><vh>sf.Constants &amp; Name</vh></v>
</v>
<v t="ekr.20160131180118.1"></v>
<v t="ekr.20160126153212.80"><vh>class StubFormatter (AstFormatter)</vh>
<v t="ekr.20160202061329.1"></v>
<v t="ekr.20160205131910.1"><vh>sf.match_all</vh></v>
<v t="ekr.20160206203133.1"><vh>sf.visit</vh></v>
<v t="ekr.20160208093906.1"><vh>sf.trace_visitor</vh></v>
<v t="ekr.20160205053705.1"></v>
<v t="ekr.20160205053641.1"></v>
<v t="ekr.20160201194801.1"></v>
</v>
</v>
<v t="ekr.20160203073604.1"><vh>class Stub(object)</vh>
<v t="ekr.20160210134702.1"></v>
<v t="ekr.20160203130235.1"><vh>stub.__eq__ and __ne__</vh></v>
<v t="ekr.20160203140342.1"><vh>stub.__hash__</vh></v>
<v t="ekr.20160210111955.1"><vh>stub.__repr__and __str__</vh></v>
<v t="ekr.20160210132520.1"><vh>stub.parents and level</vh></v>
</v>
<v t="ekr.20160126153212.82"><vh>class StubTraverser (ast.NodeVisitor)</vh>
<v t="ekr.20160126153212.83"></v>
<v t="ekr.20160209194832.1"><vh>st.add_stub</vh></v>
<v t="ekr.20160126153212.84"><vh>st.indent &amp; out</vh></v>
<v t="ekr.20160126153212.85"></v>
<v t="ekr.20160126153212.87"></v>
<v t="ekr.20160126153212.88"></v>
<v t="ekr.20160126153212.99"><vh>st.visit_Return</vh></v>
</v>
</v>
<v t="ekr.20160211050346.1"><vh>@test st.flatten_stubs</vh>
<v t="ekr.20160211050346.2"><vh> &lt;&lt; imports &gt;&gt; (@test st.flatten_stubs)</vh></v>
<v t="ekr.20160211050346.3"><vh>&lt;&lt; define s &gt;&gt; (@test st.flatten_stubs)</vh></v>
<v t="ekr.20160211050346.4"><vh>base classes</vh>
<v t="ekr.20160211050346.5"><vh> class AstFormatter</vh>
<v t="ekr.20160211050346.6"><vh> f.Entries</vh>
<v t="ekr.20160211050346.7"><vh>f.format</vh></v>
<v t="ekr.20160211050346.8"><vh>f.visit</vh></v>
</v>
<v t="ekr.20160211050346.9"><vh>f.Contexts</vh>
<v t="ekr.20160211050346.10"><vh>f.ClassDef</vh></v>
<v t="ekr.20160211050346.11"><vh>f.FunctionDef</vh></v>
<v t="ekr.20160211050346.12"><vh>f.Interactive</vh></v>
<v t="ekr.20160211050346.13"><vh>f.Module</vh></v>
<v t="ekr.20160211050346.14"><vh>f.Lambda</vh></v>
</v>
<v t="ekr.20160211050346.15"><vh>f.Expressions</vh>
<v t="ekr.20160211050346.16"><vh>f.Expr</vh></v>
<v t="ekr.20160211050346.17"><vh>f.Expression</vh></v>
<v t="ekr.20160211050346.18"><vh>f.GeneratorExp</vh></v>
<v t="ekr.20160211050346.19"><vh>f.ctx nodes</vh></v>
</v>
<v t="ekr.20160211050346.20"><vh>f.Operands</vh>
<v t="ekr.20160211050346.21"><vh>f.arguments</vh></v>
<v t="ekr.20160211050346.22"><vh>f.arg (Python3 only)</vh></v>
<v t="ekr.20160211050346.23"><vh>f.Attribute</vh></v>
<v t="ekr.20160211050346.24"><vh>f.Bytes</vh></v>
<v t="ekr.20160211050346.25"><vh>f.Call &amp; f.keyword</vh>
<v t="ekr.20160211050346.26"><vh>f.keyword</vh></v>
</v>
<v t="ekr.20160211050346.27"><vh>f.comprehension</vh></v>
<v t="ekr.20160211050346.28"><vh>f.Dict</vh></v>
<v t="ekr.20160211050346.29"><vh>f.Ellipsis</vh></v>
<v t="ekr.20160211050346.30"><vh>f.ExtSlice</vh></v>
<v t="ekr.20160211050346.31"><vh>f.Index</vh></v>
<v t="ekr.20160211050346.32"><vh>f.List</vh></v>
<v t="ekr.20160211050346.33"><vh>f.ListComp</vh></v>
<v t="ekr.20160211050346.34"><vh>f.Name</vh></v>
<v t="ekr.20160211050346.35"><vh>f.Num</vh></v>
<v t="ekr.20160211050346.36"><vh>f.Repr</vh></v>
<v t="ekr.20160211050346.37"><vh>f.Slice</vh></v>
<v t="ekr.20160211050346.38"><vh>f.Str</vh></v>
<v t="ekr.20160211050346.39"><vh>f.Subscript</vh></v>
<v t="ekr.20160211050346.40"><vh>f.Tuple</vh></v>
</v>
<v t="ekr.20160211050346.41"><vh>f.Operators</vh>
<v t="ekr.20160211050346.42"><vh>f.BinOp</vh></v>
<v t="ekr.20160211050346.43"><vh>f.BoolOp</vh></v>
<v t="ekr.20160211050346.44"><vh>f.Compare</vh></v>
<v t="ekr.20160211050346.45"><vh>f.UnaryOp</vh></v>
<v t="ekr.20160211050346.46"><vh>f.ifExp (ternary operator)</vh></v>
</v>
<v t="ekr.20160211050346.47"><vh>f.Statements</vh>
<v t="ekr.20160211050346.48"><vh>f.Assert</vh></v>
<v t="ekr.20160211050346.49"><vh>f.Assign</vh></v>
<v t="ekr.20160211050346.50"><vh>f.AugAssign</vh></v>
<v t="ekr.20160211050346.51"><vh>f.Break</vh></v>
<v t="ekr.20160211050346.52"><vh>f.Continue</vh></v>
<v t="ekr.20160211050346.53"><vh>f.Delete</vh></v>
<v t="ekr.20160211050346.54"><vh>f.ExceptHandler</vh></v>
<v t="ekr.20160211050346.55"><vh>f.Exec</vh></v>
<v t="ekr.20160211050346.56"><vh>f.For</vh></v>
<v t="ekr.20160211050346.57"><vh>f.Global</vh></v>
<v t="ekr.20160211050346.58"><vh>f.If</vh></v>
<v t="ekr.20160211050346.59"><vh>f.Import &amp; helper</vh>
<v t="ekr.20160211050346.60"><vh>f.get_import_names</vh></v>
</v>
<v t="ekr.20160211050346.61"><vh>f.ImportFrom</vh></v>
<v t="ekr.20160211050346.62"><vh>f.Pass</vh></v>
<v t="ekr.20160211050346.63"><vh>f.Print</vh></v>
<v t="ekr.20160211050346.64"><vh>f.Raise</vh></v>
<v t="ekr.20160211050346.65"><vh>f.Return</vh></v>
<v t="ekr.20160211050346.66"><vh>f.TryExcept</vh></v>
<v t="ekr.20160211050346.67"><vh>f.TryFinally</vh></v>
<v t="ekr.20160211050346.68"><vh>f.While</vh></v>
<v t="ekr.20160211050346.69"><vh>f.With</vh></v>
<v t="ekr.20160211050346.70"><vh>f.Yield</vh></v>
</v>
<v t="ekr.20160211050346.71"><vh>f.Utils</vh>
<v t="ekr.20160211050346.72"><vh>f.kind</vh></v>
<v t="ekr.20160211050346.73"><vh>f.indent</vh></v>
<v t="ekr.20160211050346.74"><vh>f.op_name</vh></v>
</v>
</v>
<v t="ekr.20160211050346.75"><vh>class AstArgFormatter (AstFormatter)</vh>
<v t="ekr.20160211050346.76"><vh>sf.Constants &amp; Name</vh></v>
</v>
<v t="ekr.20160211050346.77"><vh>class LeoGlobals</vh>
<v t="ekr.20160211050346.78"><vh>class NullObject (Python Cookbook)</vh></v>
<v t="ekr.20160211050346.79"><vh>g._callerName</vh></v>
<v t="ekr.20160211050346.80"><vh>g.callers</vh></v>
<v t="ekr.20160211050346.81"><vh>g.cls</vh></v>
<v t="ekr.20160211050346.82"><vh>g.pdb</vh></v>
<v t="ekr.20160211050346.83"><vh>g.shortFileName</vh></v>
<v t="ekr.20160211050346.84"><vh>g.splitLines</vh></v>
<v t="ekr.20160211050346.85"><vh>g.trace</vh></v>
</v>
<v t="ekr.20160211050346.86"><vh>class StubFormatter (AstFormatter)</vh>
<v t="ekr.20160211050346.87"><vh>sf.ctor</vh></v>
<v t="ekr.20160211050346.88"><vh>sf.match_all (trace-matches)</vh></v>
<v t="ekr.20160211050346.89"><vh>sf.visit</vh></v>
<v t="ekr.20160211050346.90"><vh>sf.trace_visitor</vh></v>
<v t="ekr.20160211050346.91"><vh>sf.Operands</vh>
<v t="ekr.20160211050346.92"><vh>sf.Attribute (names_dict)</vh></v>
<v t="ekr.20160211050346.93"><vh>sf.Constants: Bytes, Num, Str</vh></v>
<v t="ekr.20160211050346.94"><vh>sf.Dict ** call match_all?</vh></v>
<v t="ekr.20160211050346.95"><vh>sf.List ** call_match_all?</vh></v>
<v t="ekr.20160211050346.96"><vh>sf.Name (names_dict)</vh></v>
<v t="ekr.20160211050346.97"><vh>sf.Tuple (match_all)</vh></v>
</v>
<v t="ekr.20160211050346.98"><vh>sf.Operators</vh>
<v t="ekr.20160211050346.99"><vh>sf.BinOp (reduce_types &amp; match_all)</vh></v>
<v t="ekr.20160211050346.100"><vh>sf.BoolOp (reduce_types)</vh></v>
<v t="ekr.20160211050346.101"><vh>sf.Call &amp; sf.keyword (match_all)</vh>
<v t="ekr.20160211050346.102"><vh>sf.keyword</vh></v>
</v>
<v t="ekr.20160211050346.103"><vh>sf.Compare</vh></v>
<v t="ekr.20160211050346.104"><vh>sf.IfExp (reduce_types, match_all)</vh></v>
<v t="ekr.20160211050346.105"><vh>sf.Subscript (match_all)</vh></v>
<v t="ekr.20160211050346.106"><vh>sf.UnaryOp (match_all)</vh></v>
</v>
<v t="ekr.20160211050346.107"><vh>sf.Return</vh></v>
</v>
</v>
<v t="ekr.20160211050346.108"><vh>class Stub(object)</vh>
<v t="ekr.20160211050346.109"><vh>stub.__ctor__</vh></v>
<v t="ekr.20160211050346.110"><vh>stub.__eq__ and __ne__</vh></v>
<v t="ekr.20160211050346.111"><vh>stub.__hash__</vh></v>
<v t="ekr.20160211050346.112"><vh>stub.__repr__and __str__</vh></v>
<v t="ekr.20160211050346.113"><vh>stub.parents and level</vh></v>
</v>
<v t="ekr.20160211050346.114"><vh>class StubTraverser (ast.NodeVisitor)</vh>
<v t="ekr.20160211050346.115"><vh>st.ctor</vh></v>
<v t="ekr.20160211050346.116"><vh>st.add_stub</vh></v>
<v t="ekr.20160211050346.117"><vh>st.indent &amp; out</vh></v>
<v t="ekr.20160211050346.118"><vh>st.run (main line) &amp; helpers</vh>
<v t="ekr.20160211050346.119"><vh>st.output_stubs</vh></v>
<v t="ekr.20160211050346.120"><vh>st.output_time_stamp</vh></v>
<v t="ekr.20160211050346.121"><vh>st.update &amp; helpers</vh>
<v t="ekr.20160211050346.122"><vh>st.get_stub_file</vh></v>
<v t="ekr.20160211050346.123"><vh>st.parse_stub_file</vh></v>
<v t="ekr.20160211050346.124"><vh>st.merge_stubs &amp; helpers</vh>
<v t="ekr.20160211050346.125"><vh>st.flatten_stubs</vh></v>
<v t="ekr.20160211050346.126"><vh>st.find_parent_stub</vh></v>
<v t="ekr.20160211050346.127"><vh>st.find_stub</vh></v>
<v t="ekr.20160211050346.128"><vh>st.sort_stubs_by_hierarchy</vh></v>
</v>
<v t="ekr.20160211050346.129"><vh>st.trace_stubs</vh></v>
</v>
</v>
<v t="ekr.20160211050346.130"><vh>st.visit_ClassDef</vh></v>
<v t="ekr.20160211050346.131"><vh>st.visit_FunctionDef &amp; helpers</vh>
<v t="ekr.20160211050346.132"><vh>st.format_arguments &amp; helper</vh>
<v t="ekr.20160211050346.133"><vh>st.munge_arg</vh></v>
</v>
<v t="ekr.20160211050346.134"><vh>st.format_returns &amp; helpers</vh>
<v t="ekr.20160211050346.135"><vh>st.format_return_expressions</vh></v>
<v t="ekr.20160211050346.136"><vh>st.get_def_name</vh></v>
<v t="ekr.20160211050346.137"><vh>st.remove_recursive_calls</vh></v>
</v>
</v>
<v t="ekr.20160211050346.138"><vh>st.visit_Return</vh></v>
</v>
</v>
<v t="ekr.20160210080720.1"><vh>@test st.merge_stubs</vh>
<v t="ekr.20160203075612.1"></v>
<v t="ekr.20160210081628.1"><vh>&lt;&lt; old_stubs &gt;&gt;</vh></v>
<v t="ekr.20160210144515.1"><vh>&lt;&lt; new_stubs &gt;&gt;</vh></v>
<v t="ekr.20160206104634.1"></v>
<v t="ekr.20160210082857.1"></v>
<v t="ekr.20160203073604.1"></v>
<v t="ekr.20160126153212.82"></v>
</v>
<v t="ekr.20160210112945.1"><vh>@test Stub class</vh>
<v t="ekr.20160203075612.1"></v>
<v t="ekr.20160131180118.1"></v>
<v t="ekr.20160203073604.1"></v>
</v>
<v t="ekr.20160207115947.1"><vh>@test truncate</vh>
<v t="ekr.20160207115604.1"></v>
</v>
</v>
<v t="ekr.20160318141204.1"><vh>@clean make_stub_files.py</vh>
<v t="ekr.20160318141204.2"><vh> &lt;&lt; imports &gt;&gt; (make_stub_files.py)</vh></v>
<v t="ekr.20160318141204.3"><vh>  type functions</vh>
<v t="ekr.20160318141204.4"><vh>is_known_type</vh></v>
<v t="ekr.20160318141204.5"><vh>merge_types (not used)</vh></v>
<v t="ekr.20160318141204.6"><vh>reduce_types</vh></v>
</v>
<v t="ekr.20160318141204.7"><vh>  utility functions</vh>
<v t="ekr.20160318141204.8"><vh>dump</vh></v>
<v t="ekr.20160318141204.9"><vh>dump_dict</vh></v>
<v t="ekr.20160318141204.10"><vh>dump_list</vh></v>
<v t="ekr.20160318141204.11"><vh>main</vh></v>
<v t="ekr.20160318141204.12"><vh>pdb</vh></v>
<v t="ekr.20160318141204.13"><vh>truncate</vh></v>
</v>
<v t="ekr.20160318141204.14"><vh> class AstFormatter</vh>
<v t="ekr.20160318141204.15"><vh> f.Entries</vh>
<v t="ekr.20160318141204.17"><vh>f.format</vh></v>
<v t="ekr.20160318141204.18"><vh>f.visit</vh></v>
</v>
<v t="ekr.20160318141204.19"><vh>f.Contexts</vh>
<v t="ekr.20160318141204.20"><vh>f.ClassDef (make_stub_files)</vh></v>
<v t="ekr.20160318141204.21"><vh>f.FunctionDef (make_stub_files)</vh></v>
<v t="ekr.20160318141204.22"><vh>f.Interactive</vh></v>
<v t="ekr.20160318141204.23"><vh>f.Module</vh></v>
<v t="ekr.20160318141204.24"><vh>f.Lambda</vh></v>
</v>
<v t="ekr.20160318141204.25"><vh>f.Expressions</vh>
<v t="ekr.20160318141204.26"><vh>f.Expr</vh></v>
<v t="ekr.20160318141204.27"><vh>f.Expression</vh></v>
<v t="ekr.20160318141204.28"><vh>f.GeneratorExp</vh></v>
<v t="ekr.20160318141204.29"><vh>f.ctx nodes</vh></v>
</v>
<v t="ekr.20160318141204.30"><vh>f.Operands</vh>
<v t="ekr.20160318141204.31"><vh>f.arguments (make_stub_files)</vh></v>
<v t="ekr.20160318141204.32"><vh>f.arg (Python3 only) (make_stub_files)</vh></v>
<v t="ekr.20160318141204.33"><vh>f.Attribute</vh></v>
<v t="ekr.20160318141204.34"><vh>f.Bytes</vh></v>
<v t="ekr.20160318141204.35"><vh>f.Call &amp; f.keyword</vh>
<v t="ekr.20160318141204.36"><vh>f.keyword</vh></v>
</v>
<v t="ekr.20160318141204.37"><vh>f.comprehension</vh></v>
<v t="ekr.20160318141204.38"><vh>f.Dict</vh></v>
<v t="ekr.20160318141204.39"><vh>f.Ellipsis</vh></v>
<v t="ekr.20160318141204.40"><vh>f.ExtSlice</vh></v>
<v t="ekr.20160318141204.41"><vh>f.Index</vh></v>
<v t="ekr.20160318141204.42"><vh>f.List</vh></v>
<v t="ekr.20160318141204.43"><vh>f.ListComp</vh></v>
<v t="ekr.20160318141204.44"><vh>f.Name &amp; NameConstant</vh></v>
<v t="ekr.20160318141204.45"><vh>f.Num</vh></v>
<v t="ekr.20160318141204.46"><vh>f.Repr</vh></v>
<v t="ekr.20160318141204.47"><vh>f.Slice</vh></v>
<v t="ekr.20160318141204.48"><vh>f.Str</vh></v>
<v t="ekr.20160318141204.49"><vh>f.Subscript</vh></v>
<v t="ekr.20160318141204.50"><vh>f.Tuple</vh></v>
</v>
<v t="ekr.20160318141204.51"><vh>f.Operators</vh>
<v t="ekr.20160318141204.52"><vh>f.BinOp</vh></v>
<v t="ekr.20160318141204.53"><vh>f.BoolOp</vh></v>
<v t="ekr.20160318141204.54"><vh>f.Compare</vh></v>
<v t="ekr.20160318141204.55"><vh>f.UnaryOp</vh></v>
<v t="ekr.20160318141204.56"><vh>f.ifExp (ternary operator)</vh></v>
</v>
<v t="ekr.20160318141204.57"><vh>f.Statements</vh>
<v t="ekr.20160318141204.58"><vh>f.Assert</vh></v>
<v t="ekr.20160318141204.59"><vh>f.Assign</vh></v>
<v t="ekr.20160318141204.60"><vh>f.AugAssign</vh></v>
<v t="ekr.20160318141204.61"><vh>f.Break</vh></v>
<v t="ekr.20160318141204.62"><vh>f.Continue</vh></v>
<v t="ekr.20160318141204.63"><vh>f.Delete</vh></v>
<v t="ekr.20160318141204.64"><vh>f.ExceptHandler</vh></v>
<v t="ekr.20160318141204.65"><vh>f.Exec</vh></v>
<v t="ekr.20160318141204.66"><vh>f.For</vh></v>
<v t="ekr.20160318141204.67"><vh>f.Global</vh></v>
<v t="ekr.20160318141204.68"><vh>f.If</vh></v>
<v t="ekr.20160318141204.69"><vh>f.Import &amp; helper</vh>
<v t="ekr.20160318141204.70"><vh>f.get_import_names</vh></v>
</v>
<v t="ekr.20160318141204.71"><vh>f.ImportFrom</vh></v>
<v t="ekr.20160318141204.72"><vh>f.Nonlocal (Python 3)</vh></v>
<v t="ekr.20160318141204.73"><vh>f.Pass</vh></v>
<v t="ekr.20160318141204.74"><vh>f.Print</vh></v>
<v t="ekr.20160318141204.75"><vh>f.Raise</vh></v>
<v t="ekr.20160318141204.76"><vh>f.Return</vh></v>
<v t="ekr.20160318141204.77"><vh>f.Starred (Python 3)</vh></v>
<v t="ekr.20160318141204.79"><vh>f.Try (Python 3)</vh></v>
<v t="ekr.20160318141204.80"><vh>f.TryExcept</vh></v>
<v t="ekr.20160318141204.81"><vh>f.TryFinally</vh></v>
<v t="ekr.20160318141204.82"><vh>f.While</vh></v>
<v t="ekr.20160318141204.83"><vh>f.With (make_stub_files)</vh></v>
<v t="ekr.20160318141204.84"><vh>f.Yield</vh></v>
<v t="ekr.20160318141204.85"><vh>f.YieldFrom (Python 3)</vh></v>
</v>
<v t="ekr.20160318141204.86"><vh>f.Utils</vh>
<v t="ekr.20160318141204.87"><vh>f.kind</vh></v>
<v t="ekr.20160318141204.88"><vh>f.indent</vh></v>
<v t="ekr.20160318141204.89"><vh>f.op_name</vh></v>
</v>
</v>
<v t="ekr.20160318141204.90"><vh>class AstArgFormatter (AstFormatter)</vh>
<v t="ekr.20160318141204.91"><vh>sf.Constants &amp; Name</vh></v>
</v>
<v t="ekr.20160318141204.92"><vh>class LeoGlobals</vh>
<v t="ekr.20160318141204.93"><vh>class NullObject (Python Cookbook)</vh></v>
<v t="ekr.20160318141204.94"><vh>g._callerName</vh></v>
<v t="ekr.20160318141204.95"><vh>g.callers</vh></v>
<v t="ekr.20160318141204.96"><vh>g.cls</vh></v>
<v t="ekr.20160318141204.97"><vh>g.isString &amp; isUnicode (make_stub_files.py)</vh></v>
<v t="ekr.20160318141204.98"><vh>g.pdb</vh></v>
<v t="ekr.20160318141204.99"><vh>g.shortFileName</vh></v>
<v t="ekr.20160318141204.100"><vh>g.splitLines</vh></v>
<v t="ekr.20160318141204.101"><vh>g.trace</vh></v>
</v>
<v t="ekr.20160318141204.102"><vh>class Pattern(object)</vh>
<v t="ekr.20160318141204.103"><vh>pattern.ctor</vh></v>
<v t="ekr.20160318141204.104"><vh>pattern.__eq__, __ne__, __hash__</vh></v>
<v t="ekr.20160318141204.105"><vh>pattern.str &amp; repr</vh></v>
<v t="ekr.20160318141204.106"><vh>pattern.is_balanced</vh></v>
<v t="ekr.20160318141204.107"><vh>pattern.is_regex</vh></v>
<v t="ekr.20160318141204.108"><vh>pattern.all_matches &amp; helpers</vh>
<v t="ekr.20160318141204.109"><vh>pattern.full_balanced_match</vh></v>
<v t="ekr.20160318141204.110"><vh>pattern.match_balanced</vh></v>
</v>
<v t="ekr.20160318141204.111"><vh>pattern.match (trace-matches)</vh></v>
<v t="ekr.20160318141204.112"><vh>pattern.match_entire_string</vh></v>
<v t="ekr.20160318141204.113"><vh>pattern.replace &amp; helpers</vh>
<v t="ekr.20160318141204.114"><vh>pattern.replace_balanced</vh></v>
<v t="ekr.20160318141204.115"><vh>pattern.replace_regex</vh></v>
</v>
</v>
<v t="ekr.20160318141204.116"><vh>class ReduceTypes</vh>
<v t="ekr.20160318141204.117"><vh>rt.ctor</vh></v>
<v t="ekr.20160318141204.118"><vh>rt.is_known_type</vh></v>
<v t="ekr.20160318141204.119"><vh>rt.reduce_collection</vh></v>
<v t="ekr.20160318141204.120"><vh>rt.reduce_numbers</vh></v>
<v t="ekr.20160318141204.121"><vh>rt.reduce_types</vh></v>
<v t="ekr.20160318141204.122"><vh>rt.reduce_unknowns</vh></v>
<v t="ekr.20160318141204.123"><vh>rt.show</vh></v>
<v t="ekr.20160318141204.124"><vh>rt.split_types</vh></v>
</v>
<v t="ekr.20160318141204.125"><vh>class StandAloneMakeStubFile</vh>
<v t="ekr.20160318141204.126"><vh>msf.ctor</vh></v>
<v t="ekr.20160318141204.127"><vh>msf.finalize</vh></v>
<v t="ekr.20160318141204.128"><vh>msf.make_stub_file</vh></v>
<v t="ekr.20160318141204.129"><vh>msf.run</vh></v>
<v t="ekr.20160318141204.130"><vh>msf.run_all_unit_tests</vh></v>
<v t="ekr.20160318141204.131"><vh>msf.scan_command_line</vh></v>
<v t="ekr.20160318141204.132"><vh>msf.scan_options &amp; helpers</vh>
<v t="ekr.20160318141204.133"><vh>msf.make_op_name_dict</vh></v>
<v t="ekr.20160318141204.134"><vh>msf.create_parser</vh></v>
<v t="ekr.20160318141204.135"><vh>msf.find_pattern_ops</vh></v>
<v t="ekr.20160318141204.136"><vh>msf.get_config_string</vh></v>
<v t="ekr.20160318141204.137"><vh>msf.init_parser</vh></v>
<v t="ekr.20160318141204.138"><vh>msf.is_section_name</vh></v>
<v t="ekr.20160318141204.139"><vh>msf.make_patterns_dict</vh></v>
<v t="ekr.20160318141204.140"><vh>msf.scan_patterns</vh></v>
</v>
</v>
<v t="ekr.20160318141204.141"><vh>class Stub(object)</vh>
<v t="ekr.20160318141204.142"><vh>stub.ctor</vh></v>
<v t="ekr.20160318141204.143"><vh>stub.__eq__ and __ne__</vh></v>
<v t="ekr.20160318141204.144"><vh>stub.__hash__</vh></v>
<v t="ekr.20160318141204.145"><vh>stub.__repr__and __str__</vh></v>
<v t="ekr.20160318141204.146"><vh>stub.parents and level</vh></v>
</v>
<v t="ekr.20160318141204.147"><vh>class StubFormatter (AstFormatter)</vh>
<v t="ekr.20160318141204.148"><vh>sf.ctor</vh></v>
<v t="ekr.20160318141204.149"><vh>sf.match_all</vh></v>
<v t="ekr.20160318141204.150"><vh>sf.visit</vh></v>
<v t="ekr.20160318141204.151"><vh>sf.trace_visitor</vh></v>
<v t="ekr.20160318141204.152"><vh>sf.Operands</vh>
<v t="ekr.20160318141204.153"><vh>sf.Attribute</vh></v>
<v t="ekr.20160318141204.154"><vh>sf.Constants: Bytes, Num, Str</vh></v>
<v t="ekr.20160318141204.155"><vh>sf.Dict</vh></v>
<v t="ekr.20160318141204.156"><vh>sf.List</vh></v>
<v t="ekr.20160318141204.157"><vh>sf.Name</vh></v>
<v t="ekr.20160318141204.158"><vh>sf.Tuple</vh></v>
</v>
<v t="ekr.20160318141204.159"><vh>sf.Operators</vh>
<v t="ekr.20160318141204.160"><vh>sf.BinOp</vh></v>
<v t="ekr.20160318141204.161"><vh>sf.BoolOp</vh></v>
<v t="ekr.20160318141204.162"><vh>sf.Call &amp; sf.keyword</vh>
<v t="ekr.20160318141204.163"><vh>sf.keyword</vh></v>
</v>
<v t="ekr.20160318141204.164"><vh>sf.Compare</vh></v>
<v t="ekr.20160318141204.165"><vh>sf.IfExp</vh></v>
<v t="ekr.20160318141204.166"><vh>sf.Subscript</vh></v>
<v t="ekr.20160318141204.167"><vh>sf.UnaryOp</vh></v>
</v>
<v t="ekr.20160318141204.168"><vh>sf.Return</vh></v>
</v>
<v t="ekr.20160318141204.169"><vh>class StubTraverser (ast.NodeVisitor)</vh>
<v t="ekr.20160318141204.170"><vh>st.ctor</vh></v>
<v t="ekr.20160318141204.171"><vh>st.add_stub</vh></v>
<v t="ekr.20160318141204.172"><vh>st.indent &amp; out</vh></v>
<v t="ekr.20160318141204.173"><vh>st.run (main line) &amp; helpers</vh>
<v t="ekr.20160318141204.174"><vh>st.output_stubs</vh></v>
<v t="ekr.20160318141204.175"><vh>st.output_time_stamp</vh></v>
<v t="ekr.20160318141204.176"><vh>st.update &amp; helpers</vh>
<v t="ekr.20160318141204.177"><vh>st.get_stub_file</vh></v>
<v t="ekr.20160318141204.178"><vh>st.parse_stub_file</vh></v>
<v t="ekr.20160318141204.179"><vh>st.merge_stubs &amp; helpers</vh>
<v t="ekr.20160318141204.180"><vh>st.check_delete</vh></v>
<v t="ekr.20160318141204.181"><vh>st.flatten_stubs</vh></v>
<v t="ekr.20160318141204.182"><vh>st.find_parent_stub</vh></v>
<v t="ekr.20160318141204.183"><vh>st.find_stub</vh></v>
<v t="ekr.20160318141204.184"><vh>st.sort_stubs_by_hierarchy</vh></v>
</v>
<v t="ekr.20160318141204.185"><vh>st.trace_stubs</vh></v>
</v>
</v>
<v t="ekr.20160318141204.186"><vh>st.visit_ClassDef</vh></v>
<v t="ekr.20160318141204.187"><vh>st.visit_FunctionDef &amp; helpers</vh>
<v t="ekr.20160318141204.188"><vh>st.format_arguments &amp; helper</vh>
<v t="ekr.20160318141204.189"><vh>st.munge_arg</vh></v>
</v>
<v t="ekr.20160318141204.190"><vh>st.format_returns &amp; helpers</vh>
<v t="ekr.20160318141204.191"><vh>st.format_return_expressions</vh></v>
<v t="ekr.20160318141204.192"><vh>st.get_def_name</vh></v>
<v t="ekr.20160318141204.193"><vh>st.remove_recursive_calls</vh></v>
</v>
</v>
<v t="ekr.20160318141204.194"><vh>st.visit_Return</vh></v>
</v>
<v t="ekr.20160318141204.195"><vh>class TestClass</vh>
<v t="ekr.20160318141204.196"><vh>parse_group (Guido)</vh></v>
<v t="ekr.20160318141204.197"><vh>return_all</vh></v>
<v t="ekr.20160318141204.198"><vh>return_array</vh></v>
<v t="ekr.20160318141204.199"><vh>return_list</vh></v>
<v t="ekr.20160318141204.200"><vh>return_two_lists (fails)</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="ekr.20160126153016.3"></t>
<t tx="ekr.20160126153212.10">
def do_Interactive(self, node):
    for z in node.body:
        self.visit(z)
</t>
<t tx="ekr.20160126153212.100">
def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = StandAloneMakeStubFile()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')
</t>
<t tx="ekr.20160126153212.11">
def do_Module(self, node):
    assert 'body' in node._fields
    result = ''.join([self.visit(z) for z in node.body])
    return result # 'module:\n%s' % (result)
</t>
<t tx="ekr.20160126153212.12">
def do_Lambda(self, node):
    return self.indent('lambda %s: %s' % (
        self.visit(node.args),
        self.visit(node.body)))
</t>
<t tx="ekr.20160126153212.13">
# Expressions...
</t>
<t tx="ekr.20160126153212.14">
def do_Expr(self, node):
    '''An outer expression: must be indented.'''
    return self.indent('%s\n' % self.visit(node.value))
</t>
<t tx="ekr.20160126153212.15">
def do_Expression(self, node):
    '''An inner expression: do not indent.'''
    return '%s\n' % self.visit(node.body)
</t>
<t tx="ekr.20160126153212.16">
def do_GeneratorExp(self, node):
    elt = self.visit(node.elt) or ''
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '&lt;gen %s for %s&gt;' % (elt, ','.join(gens))
</t>
<t tx="ekr.20160126153212.17">
def do_AugLoad(self, node):
    return 'AugLoad'

def do_Del(self, node):
    return 'Del'

def do_Load(self, node):
    return 'Load'

def do_Param(self, node):
    return 'Param'

def do_Store(self, node):
    return 'Store'
</t>
<t tx="ekr.20160126153212.18">
# Operands...
</t>
<t tx="ekr.20160126153212.19">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def do_arguments(self, node):
    '''Format the arguments node.'''
    kind = self.kind(node)
    assert kind == 'arguments', kind
    args = [self.visit(z) for z in node.args]
    defaults = [self.visit(z) for z in node.defaults]
    # Assign default values to the last args.
    args2 = []
    n_plain = len(args) - len(defaults)
    for i in range(len(args)):
        if i &lt; n_plain:
            args2.append(args[i])
        else:
            args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name: args2.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name: args2.append('**' + name)
    return ','.join(args2)
</t>
<t tx="ekr.20160126153212.20">
# Python 3:
# arg = (identifier arg, expr? annotation)

def do_arg(self, node):
    return node.arg
</t>
<t tx="ekr.20160126153212.21">
# Attribute(expr value, identifier attr, expr_context ctx)

def do_Attribute(self, node):
    return '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
</t>
<t tx="ekr.20160126153212.22">
def do_Bytes(self, node): # Python 3.x only.
    return str(node.s)
</t>
<t tx="ekr.20160126153212.23">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    return '%s(%s)' % (func, ','.join(args))
</t>
<t tx="ekr.20160126153212.24">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160126153212.25">
def do_comprehension(self, node):
    result = []
    name = self.visit(node.target) # A name.
    it = self.visit(node.iter) # An attribute.
    result.append('%s in %s' % (name, it))
    ifs = [self.visit(z) for z in node.ifs]
    if ifs:
        result.append(' if %s' % (''.join(ifs)))
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.26">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        # result.append('{\n' if keys else '{')
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
        # result.append(',\n'.join(items))
        # result.append('\n}' if keys else '}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.27">
def do_Ellipsis(self, node):
    return '...'
</t>
<t tx="ekr.20160126153212.28">
def do_ExtSlice(self, node):
    return ':'.join([self.visit(z) for z in node.dims])
</t>
<t tx="ekr.20160126153212.29">
def do_Index(self, node):
    return self.visit(node.value)
</t>
<t tx="ekr.20160126153212.3">

class AstFormatter:
    '''
    A class to recreate source code from an AST.
    
    This does not have to be perfect, but it should be close.
    '''
    # pylint: disable=consider-using-enumerate
    @others
</t>
<t tx="ekr.20160126153212.30">
def do_List(self, node):
    # Not used: list context.
    # self.visit(node.ctx)
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    return '[%s]' % ','.join(elts)
</t>
<t tx="ekr.20160126153212.31">
def do_ListComp(self, node):
    elt = self.visit(node.elt)
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '%s for %s' % (elt, ''.join(gens))
</t>
<t tx="ekr.20160126153212.32">
def do_Name(self, node):
    return node.id

def do_NameConstant(self, node): # Python 3 only.
    s = repr(node.value)
    return 'bool' if s in ('True', 'False') else s
</t>
<t tx="ekr.20160126153212.33">
def do_Num(self, node):
    return repr(node.n)
</t>
<t tx="ekr.20160126153212.34">
# Python 2.x only

def do_Repr(self, node):
    return 'repr(%s)' % self.visit(node.value)
</t>
<t tx="ekr.20160126153212.35">
def do_Slice(self, node):
    lower, upper, step = '', '', ''
    if getattr(node, 'lower', None) is not None:
        lower = self.visit(node.lower)
    if getattr(node, 'upper', None) is not None:
        upper = self.visit(node.upper)
    if getattr(node, 'step', None) is not None:
        step = self.visit(node.step)
    if step:
        return '%s:%s:%s' % (lower, upper, step)
    else:
        return '%s:%s' % (lower, upper)
</t>
<t tx="ekr.20160126153212.36">
def do_Str(self, node):
    '''This represents a string constant.'''
    return repr(node.s)
</t>
<t tx="ekr.20160126153212.37">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    value = self.visit(node.value)
    the_slice = self.visit(node.slice)
    return '%s[%s]' % (value, the_slice)
</t>
<t tx="ekr.20160126153212.38">
def do_Tuple(self, node):
    '''StubFormatter.Tuple.'''
    elts = [self.visit(z) for z in node.elts]
    if 1:
        return 'Tuple[%s]' % ', '.join(elts)
    else:
        s = '(%s)' % ', '.join(elts)
        return self.match_all(node, s)
    # return 'Tuple[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160126153212.39">
# Operators...
</t>
<t tx="ekr.20160126153212.4">
# Entries...
</t>
<t tx="ekr.20160126153212.40">
def do_BinOp(self, node):
    return '%s%s%s' % (
        self.visit(node.left),
        self.op_name(node.op),
        self.visit(node.right))
</t>
<t tx="ekr.20160126153212.41">
def do_BoolOp(self, node):
    op_name = self.op_name(node.op)
    values = [self.visit(z) for z in node.values]
    return op_name.join(values)
</t>
<t tx="ekr.20160126153212.42">
def do_Compare(self, node):
    result = []
    lt = self.visit(node.left)
    ops = [self.op_name(z) for z in node.ops]
    comps = [self.visit(z) for z in node.comparators]
    result.append(lt)
    if len(ops) == len(comps):
        for i in range(len(ops)):
            result.append('%s%s' % (ops[i], comps[i]))
    else:
        print('can not happen: ops', repr(ops), 'comparators', repr(comps))
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.43">
def do_UnaryOp(self, node):
    return '%s%s' % (
        self.op_name(node.op),
        self.visit(node.operand))
</t>
<t tx="ekr.20160126153212.44">
def do_IfExp(self, node):
    return '%s if %s else %s ' % (
        self.visit(node.body),
        self.visit(node.test),
        self.visit(node.orelse))
</t>
<t tx="ekr.20160126153212.45">
# Statements...
</t>
<t tx="ekr.20160126153212.46">
def do_Assert(self, node):
    test = self.visit(node.test)
    if getattr(node, 'msg', None):
        message = self.visit(node.msg)
        return self.indent('assert %s, %s' % (test, message))
    else:
        return self.indent('assert %s' % test)
</t>
<t tx="ekr.20160126153212.47">
def do_Assign(self, node):
    return self.indent('%s=%s\n' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value)))
</t>
<t tx="ekr.20160126153212.48">
def do_AugAssign(self, node):
    return self.indent('%s%s=%s\n' % (
        self.visit(node.target),
        self.op_name(node.op), # Bug fix: 2013/03/08.
        self.visit(node.value)))
</t>
<t tx="ekr.20160126153212.49">
def do_Break(self, node):
    return self.indent('break\n')
</t>
<t tx="ekr.20160126153212.5">
def format(self, node):
    '''Format the node (or list of nodes) and its descendants.'''
    self.level = 0
    val = self.visit(node)
    return val and val.strip() or ''
</t>
<t tx="ekr.20160126153212.50">
def do_Continue(self, node):
    return self.indent('continue\n')
</t>
<t tx="ekr.20160126153212.51">
def do_Delete(self, node):
    targets = [self.visit(z) for z in node.targets]
    return self.indent('del %s\n' % ','.join(targets))
</t>
<t tx="ekr.20160126153212.52">
def do_ExceptHandler(self, node):
    result = []
    result.append(self.indent('except'))
    if getattr(node, 'type', None):
        result.append(' %s' % self.visit(node.type))
    if getattr(node, 'name', None):
        if isinstance(node.name, ast.AST):
            result.append(' as %s' % self.visit(node.name))
        else:
            result.append(' as %s' % node.name) # Python 3.x.
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.53">
# Python 2.x only

def do_Exec(self, node):
    body = self.visit(node.body)
    args = [] # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        return self.indent('exec %s in %s\n' % (
            body, ','.join(args)))
    else:
        return self.indent('exec %s\n' % (body))
</t>
<t tx="ekr.20160126153212.54">
def do_For(self, node):
    result = []
    result.append(self.indent('for %s in %s:\n' % (
        self.visit(node.target),
        self.visit(node.iter))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.55">
def do_Global(self, node):
    return self.indent('global %s\n' % (
        ','.join(node.names)))
</t>
<t tx="ekr.20160126153212.56">
def do_If(self, node):
    result = []
    result.append(self.indent('if %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.57">
def do_Import(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('import %s\n' % (
        ','.join(names)))
</t>
<t tx="ekr.20160126153212.58">
def get_import_names(self, node):
    '''Return a list of the the full file names in the import statement.'''
    result = []
    for ast2 in node.names:
        if self.kind(ast2) == 'alias':
            data = ast2.name, ast2.asname
            result.append(data)
        else:
            print('unsupported kind in Import.names list', self.kind(ast2))
    return result
</t>
<t tx="ekr.20160126153212.59">
def do_ImportFrom(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('from %s import %s\n' % (
        node.module,
        ','.join(names)))
</t>
<t tx="ekr.20160126153212.6">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    if isinstance(node, (list, tuple)):
        return ','.join([self.visit(z) for z in node])
    elif node is None:
        return 'None'
    else:
        assert isinstance(node, ast.AST), node.__class__.__name__
        method_name = 'do_' + node.__class__.__name__
        method = getattr(self, method_name)
        s = method(node)
        # pylint: disable=unidiomatic-typecheck
        assert type(s) == type('abc'), (node, type(s))
        return s
</t>
<t tx="ekr.20160126153212.60">
def do_Pass(self, node):
    return self.indent('pass\n')
</t>
<t tx="ekr.20160126153212.61">
# Python 2.x only

def do_Print(self, node):
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None):
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None):
        vals.append('nl=%s' % node.nl)
    return self.indent('print(%s)\n' % (
        ','.join(vals)))
</t>
<t tx="ekr.20160126153212.62">
def do_Raise(self, node):
    args = []
    for attr in ('type', 'inst', 'tback'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    if args:
        return self.indent('raise %s\n' % (
            ','.join(args)))
    else:
        return self.indent('raise\n')
</t>
<t tx="ekr.20160126153212.63">
def do_Return(self, node):
    if node.value:
        return self.indent('return %s\n' % (
            self.visit(node.value).strip()))
    else:
        return self.indent('return\n')
</t>
<t tx="ekr.20160126153212.64">
def do_TryExcept(self, node):
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
<t tx="ekr.20160126153212.65">
def do_TryFinally(self, node):
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
<t tx="ekr.20160126153212.66">
def do_While(self, node):
    result = []
    result.append(self.indent('while %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.67">
def do_With(self, node):
    result = []
    result.append(self.indent('with '))
    if hasattr(node, 'context_expression'):
        result.append(self.visit(node.context_expresssion))
    vars_list = []
    if hasattr(node, 'optional_vars'):
        try:
            for z in node.optional_vars:
                vars_list.append(self.visit(z))
        except TypeError: # Not iterable.
            vars_list.append(self.visit(node.optional_vars))
    result.append(','.join(vars_list))
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append('\n')
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.68">
def do_Yield(self, node):
    if getattr(node, 'value', None):
        return self.indent('yield %s\n' % (
            self.visit(node.value)))
    else:
        return self.indent('yield\n')
</t>
<t tx="ekr.20160126153212.69">
# Utils...
</t>
<t tx="ekr.20160126153212.7">
# Contexts...
</t>
<t tx="ekr.20160126153212.70">
def kind(self, node):
    '''Return the name of node's class.'''
    return node.__class__.__name__
</t>
<t tx="ekr.20160126153212.71">
def indent(self, s):
    return '%s%s' % (' ' * 4 * self.level, s)
</t>
<t tx="ekr.20160126153212.72">
def op_name (self,node,strict=True):
    '''Return the print name of an operator node.'''
    d = {
        # Binary operators. 
        'Add':       '+',
        'BitAnd':    '&amp;',
        'BitOr':     '|',
        'BitXor':    '^',
        'Div':       '/',
        'FloorDiv':  '//',
        'LShift':    '&lt;&lt;',
        'Mod':       '%',
        'Mult':      '*',
        'Pow':       '**',
        'RShift':    '&gt;&gt;',
        'Sub':       '-',
        # Boolean operators.
        'And':   ' and ',
        'Or':    ' or ',
        # Comparison operators
        'Eq':    '==',
        'Gt':    '&gt;',
        'GtE':   '&gt;=',
        'In':    ' in ',
        'Is':    ' is ',
        'IsNot': ' is not ',
        'Lt':    '&lt;',
        'LtE':   '&lt;=',
        'NotEq': '!=',
        'NotIn': ' not in ',
        # Context operators.
        'AugLoad':  '&lt;AugLoad&gt;',
        'AugStore': '&lt;AugStore&gt;',
        'Del':      '&lt;Del&gt;',
        'Load':     '&lt;Load&gt;',
        'Param':    '&lt;Param&gt;',
        'Store':    '&lt;Store&gt;',
        # Unary operators.
        'Invert':   '~',
        'Not':      ' not ',
        'UAdd':     '+',
        'USub':     '-',
    }
    name = d.get(self.kind(node),'&lt;%s&gt;' % node.__class__.__name__)
    if strict: assert name,self.kind(node)
    return name
</t>
<t tx="ekr.20160126153212.74">
def __init__ (self):
    '''Ctor for StandAloneMakeStubFile class.'''
    self.options = {}
    # Ivars set on the command line...
    self.config_fn = None
        # self.finalize('~/stubs/make_stub_files.cfg')
    self.enable_unit_tests = False
    self.files = [] # May also be set in the config file.
    # Ivars set in the config file...
    self.output_fn = None
    self.output_directory = self.finalize('.')
        # self.finalize('~/stubs')
    self.overwrite = False
    self.prefix_lines = []
    self.trace_matches = False
    self.trace_patterns = False
    self.trace_reduce = False
    self.trace_visitors = False
    self.update_flag = False
    self.verbose = False # Trace config arguments.
    self.warn = False
    # Pattern lists, set by config sections...
    self.section_names = (
        'Global', 'Def Name Patterns', 'General Patterns')
    self.def_patterns = [] # [Def Name Patterns]
    self.general_patterns = [] # [General Patterns]
    self.names_dict = {}
    self.op_name_dict = self.make_op_name_dict()
    self.patterns_dict = {}
    self.regex_patterns = []
</t>
<t tx="ekr.20160126153212.77">
def scan_command_line(self):
    '''Set ivars from command-line arguments.'''
    # This automatically implements the --help option.
    usage = "usage: make_stub_files.py [options] file1, file2, ..."
    parser = optparse.OptionParser(usage=usage)
    add = parser.add_option
    add('-c', '--config', dest='fn',
        help='full path to configuration file')
    add('-d', '--dir', dest='dir',
        help='full path to the output directory')
    add('-o', '--overwrite', action='store_true', default=False,
        help='overwrite existing stub (.pyi) files')
    add('-t', '--test', action='store_true', default=False,
        help='run unit tests on startup')
    add('--trace-matches', action='store_true', default=False,
        help='trace Pattern.matches')
    add('--trace-patterns', action='store_true', default=False,
        help='trace pattern creation')
    add('--trace-reduce', action='store_true', default=False,
        help='trace st.reduce_types')
    add('--trace-visitors', action='store_true', default=False,
        help='trace visitor methods')
    add('-u', '--update', action='store_true', default=False,
        help='update stubs in existing stub file')
    add('-v', '--verbose', action='store_true', default=False,
        help='verbose output in .pyi file')
    add('-w', '--warn', action='store_true', default=False,
        help='warn about unannotated args')
    # Parse the options
    options, args = parser.parse_args()
    # Handle the options...
    self.enable_unit_tests=options.test
    self.overwrite = options.overwrite
    self.trace_matches = options.trace_matches
    self.trace_patterns = options.trace_patterns
    self.trace_reduce = options.trace_reduce
    self.trace_visitors = options.trace_visitors
    self.update_flag = options.update
    self.verbose = options.verbose
    self.warn = options.warn
    if options.fn:
        self.config_fn = options.fn
    if options.dir:
        dir_ = options.dir
        dir_ = self.finalize(dir_)
        if os.path.exists(dir_):
            self.output_directory = dir_
        else:
            print('--dir: directory does not exist: %s' % dir_)
            print('exiting')
            sys.exit(1)
    # If any files remain, set self.files.
    if args:
        args = [self.finalize(z) for z in args]
        if args:
            self.files = args
</t>
<t tx="ekr.20160126153212.78">
def scan_options(self):
    '''Set all configuration-related ivars.'''
    trace = False
    if not self.config_fn:
        return
    self.parser = parser = self.create_parser()
    s = self.get_config_string()
    self.init_parser(s)
    if self.files:
        files_source = 'command-line'
        files = self.files
    elif parser.has_section('Global'):
        files_source = 'config file'
        files = parser.get('Global', 'files')
        files = [z.strip() for z in files.split('\n') if z.strip()]
    else:
        return
    files2 = []
    for z in files:
        files2.extend(glob.glob(self.finalize(z)))
    self.files = [z for z in files2 if z and os.path.exists(z)]
    if trace:
        print('Files (from %s)...\n' % files_source)
        for z in self.files:
            print(z)
        print('')
    if 'output_directory' in parser.options('Global'):
        s = parser.get('Global', 'output_directory')
        output_dir = self.finalize(s)
        if os.path.exists(output_dir):
            self.output_directory = output_dir
            if self.verbose:
                print('output directory: %s\n' % output_dir)
        else:
            print('output directory not found: %s\n' % output_dir)
            self.output_directory = None # inhibit run().
    if 'prefix_lines' in parser.options('Global'):
        prefix = parser.get('Global', 'prefix_lines')
        self.prefix_lines = prefix.split('\n')
            # The parser does not preserve leading whitespace.
        if trace:
            print('Prefix lines...\n')
            for z in self.prefix_lines:
                print(z)
            print('')
    self.def_patterns = self.scan_patterns('Def Name Patterns')
    self.general_patterns = self.scan_patterns('General Patterns')
    self.make_patterns_dict()
</t>
<t tx="ekr.20160126153212.79">
def scan_patterns(self, section_name):
    '''Parse the config section into a list of patterns, preserving order.'''
    trace = False or self.trace_patterns
    parser = self.parser
    aList = []
    if parser.has_section(section_name):
        seen = set()
        for key in parser.options(section_name):
            value = parser.get(section_name, key)
            # A kludge: strip leading \\ from patterns.
            if key.startswith(r'\\'):
                key = '[' + key[2:]
                if trace: g.trace('removing escapes', key)
            if key in seen:
                g.trace('duplicate key', key)
            else:
                seen.add(key)
                aList.append(Pattern(key, value))
        if trace:
            g.trace('%s...\n' % section_name)
            for z in aList:
                print(z)
            print('')
    # elif trace:
        # print('no section: %s' % section_name)
        # print(parser.sections())
        # print('')
    return aList
</t>
<t tx="ekr.20160126153212.8">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def do_ClassDef(self, node):
    result = []
    name = node.name # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if bases:
        result.append(self.indent('class %s(%s):\n' % (name, ','.join(bases))))
    else:
        result.append(self.indent('class %s:\n' % name))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.80">

class StubFormatter (AstFormatter):
    '''
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    '''
    @others
</t>
<t tx="ekr.20160126153212.81">
# Return generic markers to allow better pattern matches.

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Num(self, node):
    # make_patterns_dict treats 'number' as a special case.
    # return self.names_dict.get('number', 'number')
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160126153212.82">

class StubTraverser (ast.NodeVisitor):
    '''
    An ast.Node traverser class that outputs a stub for each class or def.
    Names of visitors must start with visit_. The order of traversal does
    not matter, because so few visitors do anything.
    '''
    @others
</t>
<t tx="ekr.20160126153212.83">
def __init__(self, controller):
    '''Ctor for StubTraverser class.'''
    self.controller = x = controller
        # A StandAloneMakeStubFile instance.
    # Internal state ivars...
    self.class_name_stack = []
    self.context_stack = []
    sf = StubFormatter(controller=controller,traverser=self)
    self.format = sf.format
    self.arg_format = AstArgFormatter().format
    self.level = 0
    self.output_file = None
    self.parent_stub = None
    self.raw_format = AstFormatter().format
    self.returns = []
    self.stubs_dict = {}
        # Keys are stub.full_name's.  Values are stubs.
    self.warn_list = []
    # Copies of controller ivars...
    self.output_fn = x.output_fn
    self.overwrite = x.overwrite
    self.prefix_lines = x.prefix_lines
    self.regex_patterns = x.regex_patterns
    self.update_flag = x.update_flag
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
    self.warn = x.warn
    # Copies of controller patterns...
    self.def_patterns = x.def_patterns
    self.names_dict = x.names_dict
    self.general_patterns = x.general_patterns
    self.patterns_dict = x.patterns_dict
    </t>
<t tx="ekr.20160126153212.84">
def indent(self, s):
    '''Return s, properly indented.'''
    # This version of indent *is* used.
    return '%s%s' % (' ' * 4 * self.level, s)

def out(self, s):
    '''Output the string to the console or the file.'''
    s = self.indent(s)
    if self.parent_stub:
        self.parent_stub.out_list.append(s)
    elif self.output_file:
        self.output_file.write(s+'\n')
    else:
        print(s)
</t>
<t tx="ekr.20160126153212.85">
def run(self, node):
    '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
    fn = self.output_fn
    dir_ = os.path.dirname(fn)
    if os.path.exists(fn) and not self.overwrite:
        print('file exists: %s' % fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        # Delayed output allows sorting.
        self.parent_stub = Stub(kind='root', name='&lt;new-stubs&gt;')
        for z in self.prefix_lines or []:
            self.parent_stub.out_list.append(z)
        self.visit(node)
            # Creates parent_stub.out_list.
        if self.update_flag:
            self.parent_stub = self.update(fn, new_root=self.parent_stub)
        if 1:
            self.output_file = open(fn, 'w')
            self.output_time_stamp()
            self.output_stubs(self.parent_stub)
            self.output_file.close()
            self.output_file = None
            self.parent_stub = None
        t2 = time.clock()
        print('wrote: %s in %4.2f sec' % (fn, t2 - t1))
    else:
        print('output directory not not found: %s' % dir_)
</t>
<t tx="ekr.20160126153212.87">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def visit_ClassDef(self, node):
    
    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('class', node.name,old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.class_name_stack.append(node.name)
    self.context_stack.append(node.name)
    if self.trace_matches or self.trace_reduce:
        print('\nclass %s\n' % node.name)
    # Format...
    if not node.name.startswith('_'):
        if node.bases:
            s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
        else:
            s = ''
        self.out('class %s%s:' % (node.name, s))
    # Visit...
    self.level += 1
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.class_name_stack.pop()
    self.level -= 1
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160126153212.88">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def visit_FunctionDef(self, node):

    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('def', node.name, old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.returns = []
    self.level += 1
    self.context_stack.append(node.name)
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.level -= 1
    # Format *after* traversing
    # if self.trace_matches or self.trace_reduce:
        # if not self.class_name_stack:
            # print('def %s\n' % node.name)
    self.out('def %s(%s) -&gt; %s' % (
        node.name,
        self.format_arguments(node.args),
        self.format_returns(node)))
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160126153212.89">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def format_arguments(self, node):
    '''
    Format the arguments node.
    Similar to AstFormat.do_arguments, but it is not a visitor!
    '''
    assert isinstance(node,ast.arguments), node
    args = [self.raw_format(z) for z in node.args]
    defaults = [self.raw_format(z) for z in node.defaults]
    # Assign default values to the last args.
    result = []
    n_plain = len(args) - len(defaults)
    # pylint: disable=consider-using-enumerate
    for i in range(len(args)):
        s = self.munge_arg(args[i])
        if i &lt; n_plain:
            result.append(s)
        else:
            result.append('%s=%s' % (s, defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('**' + name)
    return ', '.join(result)
</t>
<t tx="ekr.20160126153212.9">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def do_FunctionDef(self, node):
    '''Format a FunctionDef node.'''
    result = []
    if node.decorator_list:
        for z in node.decorator_list:
            result.append('@%s\n' % self.visit(z))
    name = node.name # Only a plain string is valid.
    args = self.visit(node.args) if node.args else ''
    result.append(self.indent('def %s(%s):\n' % (name, args)))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160126153212.90">
def format_returns(self, node):
    '''
    Calculate the return type:
    - Return None if there are no return statements.
    - Patterns in [Def Name Patterns] override all other patterns.
    - Otherwise, return a list of return values.
    '''
    trace = False
    name = self.get_def_name(node)
    raw = [self.raw_format(z) for z in self.returns]
    r = [self.format(z) for z in self.returns]
        # Allow StubFormatter.do_Return to do the hack.
    # Step 1: Return None if there are no return statements.
    if trace and self.returns:
        g.trace('name: %s r:\n%s' % (name, r))
    if not [z for z in self.returns if z.value != None]:
        return 'None: ...'
    # Step 2: [Def Name Patterns] override all other patterns.
    for pattern in self.def_patterns:
        found, s = pattern.match(name)
        if found:
            if trace:
                g.trace('*name pattern %s: %s -&gt; %s' % (
                    pattern.find_s, name, s))
            return s + ': ...'
    # Step 3: remove recursive calls.
    raw, r = self.remove_recursive_calls(name, raw, r)
    # Step 4: Calculate return types.
    return self.format_return_expressions(name, raw, r)
</t>
<t tx="ekr.20160126153212.91">
def munge_arg(self, s):
    '''Add an annotation for s if possible.'''
    if s == 'self':
        return s
    for pattern in self.general_patterns:
        if pattern.match_entire_string(s):
            return '%s: %s' % (s, pattern.repl_s)
    if self.warn and s not in self.warn_list:
        self.warn_list.append(s)
        print('no annotation for %s' % s)
    return s + ': Any'
</t>
<t tx="ekr.20160126153212.99">
def visit_Return(self, node):

    self.returns.append(node)
        # New: return the entire node, not node.value.
</t>
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
<t tx="ekr.20160128041938.1">

class Pattern(object):
    '''
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern:
        
        for m in reversed(pattern.all_matches(s)):
            s = pattern.replace(m, s)
    '''
    @others
</t>
<t tx="ekr.20160128042705.1">
def all_matches(self, s):
    '''
    Return a list of match objects for all matches in s.
    These are regex match objects or (start, end) for balanced searches.
    '''
    trace = False
    if self.is_balanced():
        aList, i = [], 0
        while i &lt; len(s):
            progress = i
            j = self.full_balanced_match(s, i)
            if j is None:
                i += 1
            else:
                aList.append((i,j),)
                i = j
            assert progress &lt; i
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160128042857.1">
def is_balanced(self):
    '''Return True if self.find_s is a balanced pattern.'''
    s = self.find_s
    if s.endswith('*'):
        return True
    for pattern in ('(*)', '[*]', '{*}'):
        if s.find(pattern) &gt; -1:
            return True
    return False
</t>
<t tx="ekr.20160128045845.1">
def match_balanced(self, delim, s, i):
    '''
    delim == s[i] and delim is in '([{'
    Return the index of the end of the balanced parenthesized string, or len(s)+1.
    '''
    trace = False
    assert s[i] == delim, s[i]
    assert delim in '([{'
    delim2 = ')]}'['([{'.index(delim)]
    assert delim2 in ')]}'
    i1, level = i, 0
    while i &lt; len(s):
        progress = i
        ch = s[i]
        i += 1
        if ch == delim:
            level += 1
        elif ch == delim2:
            level -= 1
            if level == 0:
                if trace: g.trace('found: %s' % s[i1:i])
                return i
        assert progress &lt; i
    # Unmatched: a syntax error.
    g.trace('unmatched %s in %s' % (delim, s), g.callers(4))
    return len(s) + 1
</t>
<t tx="ekr.20160128051025.1">
def full_balanced_match(self, s, i):
    '''Return the index of the end of the match found at s[i:] or None.'''
    i1 = i
    trace = False
    if trace: g.trace(self.find_s, s[i:].rstrip())
    pattern = self.find_s
    j = 0 # index into pattern
    while i &lt; len(s) and j &lt; len(pattern) and pattern[j] in ('*', s[i]):
        progress = i
        if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
            delim = pattern[j]
            i = self.match_balanced(delim, s, i)
            j += 3
        elif j == len(pattern)-1 and pattern[j] == '*':
            # A trailing * matches the rest of the string.
            j += 1
            i = len(s)
            break
        else:
            i += 1
            j += 1
        assert progress &lt; i
    found = i &lt;= len(s) and j == len(pattern)
    if trace and found:
        g.trace('%s -&gt; %s' % (pattern, s[i1:i]))
    return i if found else None
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
<t tx="ekr.20160128104639.1">@language config

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

# Test of regex patterns
.*\.endswith\(.*\)$: bool

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

# Known functions...
all(*): bool
any(*): bool
int(*): int
hash(*): int
len(*): int
os.path.basename(*): str
os.sep.join(*): str
repr(*): str
sep.join(*): str
self.__eq__(*): bool
self.__ne__(*): bool
self.__gt__(*): bool
self.__lt__(*): bool
sorted(*): str
str%(*): str
str.endswith(*): bool 
str.join(*): str
str.startswith(*): bool 
r[*]: str
# Put this in the code.
str[*]: str

</t>
<t tx="ekr.20160128104714.1"></t>
<t tx="ekr.20160128105006.1"></t>
<t tx="ekr.20160128113859.1">
def __init__ (self, find_s, repl_s=''):
    '''Ctor for the Pattern class.'''
    self.find_s = find_s
    self.repl_s = repl_s
    if self.is_regex():
        self.regex = re.compile(find_s)
    elif self.is_balanced():
        self.regex = None
    else:
        # Escape all dangerous characters.
        result = []
        for ch in find_s:
            if ch == '_' or ch.isalnum():
                result.append(ch)
            else:
                result.append('\\'+ch)
        self.regex = re.compile(''.join(result))
</t>
<t tx="ekr.20160128113914.1">
def __repr__(self):
    '''Pattern.__repr__'''
    return '%s: %s' % (self.find_s, self.repl_s)
    
__str__ = __repr__
</t>
<t tx="ekr.20160128114726.1">
def match_entire_string(self, s):
    '''Return True if s matches self.find_s'''
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        return j == len(s)
    else:
        m = self.regex.match(s)
        return m and m.group(0) == s
</t>
<t tx="ekr.20160128122410.1">
def get_def_name(self, node):
    '''Return the representaion of a function or method name.'''
    if self.class_name_stack:
        name = '%s.%s' % (self.class_name_stack[-1], node.name)
        # All ctors should return None
        if node.name == '__init__':
            name = 'None'
    else:
        name = node.name
    return name
</t>
<t tx="ekr.20160128154704.1"></t>
<t tx="ekr.20160128154715.1">import pdb
import unittest
import make_stub_files as msf

class TestMakeStubFiles(unittest.TestCase):
    '''Main test class.'''
    @others
    
if __name__ == '__main__':
    unittest.main()</t>
<t tx="ekr.20160128190112.1">
def test_pattern_class(self):
    table = (
        # regex tests. The pattern must end with $
        ('[str]', r'\[str\]$', 'xxx', 'xxx'), # Guido bug.
        ('s3', r's[1-3]?$', 'str', 'str'), # lengthening bug.
        ('s', 's', 'str', 'str'),
        ('abc', 'abc', 'ABC', 'ABC'),
        ('str(str)', 'str(*)', 'str', 'str'),
        ('[whatever]', '[*]', 'List[*]', 'List[whatever]'), # * on the RHS.
        ('(int,str)', '(*)', 'Tuple[*]', 'Tuple[int,str]'), # Guido bug 2.
        ('abcxyz', 'abc*', 'xxx', 'xxx'), # New test for trailing *.
        ('list(self.regex.finditer(str))','list(*)','List[*]',
         'List[self.regex.finditer(str)]'),
    )
    for s, find, repl, expected in table:
        # pdb.set_trace()
        pattern = msf.Pattern(find, repl)
        result = pattern.match_entire_string(s)
        assert result, (result, s, find, repl, expected)
        aList = pattern.all_matches(s)
        assert len(aList) == 1, aList
        found, s2 = pattern.match(s)
        assert found, 'after pattern.match(s)'
        assert s2 == expected, ('expected', expected, 'got', s2)
    p1 = msf.Pattern('abc','xyz')
    p2 = msf.Pattern('abc','xyz')
    p3 = msf.Pattern('abc','pdq')
    assert p1 == p2
    assert p1 != p3
    assert p2 != p3
    aSet = set()
    aSet.add(p1)
    assert p1 in aSet
    assert p2 in aSet
    assert p3 not in aSet
    assert list(aSet) == [p1] == [p2]
    aSet.add(p3)
</t>
<t tx="ekr.20160128190224.1">
def test_is_known_type(self):
    '''Test that is_known_type handles brackets reasonably.'''
    good = (
        'Any', 'Sequence',
        'Sequence[]',
        'Sequence[List]',
        'Sequence[List[Any]]',
        'Tuple[int,str]',
    )
    bad = (
        'Huh', 'Sequence(List)',
        'List+a',
        'List+List',
    )
    c = msf.StandAloneMakeStubFile()
    for s in good:
        assert msf.is_known_type(s), s
    for s in bad:
        assert not msf.is_known_type(s), s
</t>
<t tx="ekr.20160128190252.1">
# def setUp(self):
    # '''Called before each test.'''
</t>
<t tx="ekr.20160128225533.1">*.pyc
test/*.pyc</t>
<t tx="ekr.20160130032546.1">
def format_return_expressions(self, name, raw_returns, reduced_returns):
    '''
    aList is a list of maximally reduced return expressions.
    For each expression e in Alist:
    - If e is a single known type, add e to the result.
    - Otherwise, add Any # e to the result.
    Return the properly indented result.
    '''
    assert len(raw_returns) == len(reduced_returns)
    lws =  '\n' + ' '*4
    n = len(raw_returns)
    known = all([is_known_type(e) for e in reduced_returns])
    # g.trace(reduced_returns)
    if not known or self.verbose:
        # First, generate the return lines.
        aList = []
        for i in range(n):
            e, raw = reduced_returns[i], raw_returns[i]
            known = ' ' if is_known_type(e) else '?'
            aList.append('# %s %s: %s' % (' ', i, raw))
            aList.append('# %s %s: return %s' % (known, i, e))
        results = ''.join([lws + self.indent(z) for z in aList])
        # Put the return lines in their proper places.
        if known:
            s = reduce_types(reduced_returns,
                             name=name,
                             trace=self.trace_reduce)
            return s + ': ...' + results
        else:
            return 'Any: ...' + results
    else:
        s = reduce_types(reduced_returns,
                         name=name,
                         trace=self.trace_reduce) 
        return s + ': ...'
</t>
<t tx="ekr.20160130034812.1">
def is_known_type(self, s):
    '''
    Return True if s is nothing but a single known type.

    It suits the other methods of this class *not* to test inside inner
    brackets. This prevents unwanted Any types.
    '''
    trace = False
    s1 = s
    s = s.strip()
    table = (
        '', 'None', # Tricky.
        'complex', 'float', 'int', 'long', 'number',
        'dict', 'list', 'tuple',
        'bool', 'bytes', 'str', 'unicode',
    )
    for s2 in table:
        if s2 == s:
            return True
        elif Pattern(s2+'(*)', s).match_entire_string(s):
            return True
    if s.startswith('[') and s.endswith(']'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('(') and s.endswith(')'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('{') and s.endswith('}'):
        return True
        # inner = s[1:-1]
        # return self.is_known_type(inner) if inner else True
    table = (
        # Pep 484: https://www.python.org/dev/peps/pep-0484/
        # typing module: https://docs.python.org/3/library/typing.html
        # Test the most common types first.
        'Any', 'Dict', 'List', 'Optional', 'Tuple', 'Union', 
        # Not generated by this program, but could arise from patterns.
        'AbstractSet', 'AnyMeta', 'AnyStr',
        'BinaryIO', 'ByteString',
        'Callable', 'CallableMeta', 'Container',
        'Final', 'Generic', 'GenericMeta', 'Hashable',
        'IO', 'ItemsView', 'Iterable', 'Iterator',
        'KT', 'KeysView',
        'Mapping', 'MappingView', 'Match',
        'MutableMapping', 'MutableSequence', 'MutableSet',
        'NamedTuple', 'OptionalMeta',
        # 'POSIX', 'PY2', 'PY3',
        'Pattern', 'Reversible',
        'Sequence', 'Set', 'Sized',
        'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
        'T', 'TextIO', 'TupleMeta', 'TypeVar', 'TypingMeta',
        'Undefined', 'UnionMeta',
        'VT', 'ValuesView', 'VarBinding',
    )
    for s2 in table:
        if s2 == s:
            return True
        else:
            # Don't look inside bracketss.
            pattern = Pattern(s2+'[*]', s)
            if pattern.match_entire_string(s):
                return True
    if trace: g.trace('Fail:', s1)
    return False
</t>
<t tx="ekr.20160131174909.1">@language rest
@wrap

None of the following are very important because the user can always add
more patterns.

- Add more hard-coded patterns, especially binop patterns.
- Rough edges re number types. Is reduce_numbers correct?
- How are non-comment lines between subs updated?
</t>
<t tx="ekr.20160131180118.1">

class LeoGlobals:
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''
    @others
</t>
<t tx="ekr.20160131180244.1">
def pdb(self):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160131180306.1">
def trace(self, *args, **keys):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.trace(caller_level=2, *args, **keys)
    except ImportError:
        print(args, keys)
</t>
<t tx="ekr.20160131204607.1">
def replace_balanced(self, s1, start, end):
    '''
    Use m (returned by all_matches) to replace s by the string implied by repr_s.
    Within repr_s, * star matches corresponding * in find_s
    '''
    trace = False
    s = s1[start:end]
    f, r = self.find_s, self.repl_s
    i1 = f.find('(*)')
    i2 = f.find('[*]')
    i3 = f.find('{*}')
    if -1 == i1 == i2 == i3:
        return s1[:start] + r + s1[end:]
    j = r.find('*')
    if j == -1:
        return s1[:start] + r + s1[end:]
    i = min([z for z in [i1, i2, i3] if z &gt; -1])
    assert i &gt; -1 # i is an index into f AND s
    delim = f[i]
    if trace: g.trace('head', s[:i], f[:i])
    assert s[:i] == f[:i], (s[:i], f[:i])
    if trace: g.trace('delim',delim)
    k = self.match_balanced(delim, s, i)
    s_star = s[i+1:k-1]
    if trace: g.trace('s_star',s_star)
    repl = r[:j] + s_star + r[j+1:]
    if trace: g.trace('repl',self.repl_s,'==&gt;',repl)
    return s1[:start] + repl + s1[end:]
</t>
<t tx="ekr.20160201194801.1">
def do_Return(self, node):
    '''
    StubFormatter ast.Return vsitor.
    Return only the return expression itself.
    '''
    s = AstFormatter.do_Return(self, node)
    assert s.startswith('return'), repr(s)
    return s[len('return'):].strip()
</t>
<t tx="ekr.20160202061118.1">
seen_patterns = []

def visit(self, node):
    '''
    Return the formatted version of an Ast node after
    applying all general patterns.
    '''
    # This is the heart of this script.
    trace = False
    s = AstFormatter.visit(self, node)
    if self.fast_match:
        # Match only the patterns associated with this node.
        name = node.__class__.__name__
        for pattern in self.patterns_dict.get(name, []):
            found, s = pattern.match(s)
            if trace and found and pattern not in self.seen_patterns:
                self.seen_patterns.append(pattern)
                g.trace('%10s %s' % (name, pattern))
        if trace:
            # This finds and reports all missed patterns.
            for pattern in self.general_patterns:
                found, s = pattern.match(s)
                if True and found and pattern not in self.seen_patterns:
                    self.seen_patterns.append(pattern)
                    g.trace('**** %5s %s' % (name, pattern))
    else: # Match all general patterns.
        for pattern in self.general_patterns:
            found, s = pattern.match(s)
    return s
</t>
<t tx="ekr.20160202061329.1">
def __init__(self, controller, traverser):
    '''Ctor for StubFormatter class.'''
    self.controller = x = controller
    self.traverser = traverser
        # 2016/02/07: to give the formatter access to the class_stack.
    self.def_patterns = x.def_patterns
    self.general_patterns = x.general_patterns
    self.names_dict = x.names_dict
    self.patterns_dict = x.patterns_dict
    self.raw_format = AstFormatter().format
    self.regex_patterns = x.regex_patterns
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
</t>
<t tx="ekr.20160202064553.1">
def match(self, patterns, s):
    '''Return s with at most one pattern matched.'''
    assert False, g.callers()
    for pattern in patterns:
        found, s = pattern.match(s)
        if found:
            break
    return s
</t>
<t tx="ekr.20160202070025.1">
def match(self, s, trace=False):
    '''
    Perform the match on the entire string if possible.
    Return (found, new s)
    '''
    trace = False or trace
    caller = g.callers(2).split(',')[0].strip()
        # The caller of match_all.
    s1 = truncate(s,40)
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        if j is None:
            return False, s
        else:
            start, end = 0, len(s)
            s = self.replace_balanced(s, start, end)
            if trace:
                g.trace('%-16s %30s %40s ==&gt; %s' % (caller, self, s1, s))
            return True, s
    else:
        m = self.regex.match(s)
        if m and m.group(0) == s:
            s = self.replace_regex(m, s)
            if trace:
                g.trace('%-16s %30s %30s ==&gt; %s' % (caller, self, s1, s))
            return True, s
        else:
            return False, s
</t>
<t tx="ekr.20160202165117.1">

class AstArgFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''
    @others</t>
<t tx="ekr.20160202165143.1">
# Return generic markers to allow better pattern matches.

def do_BoolOp(self, node): # Python 2.x only.
    return 'bool'

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Name(self, node):
    return 'bool' if node.id in ('True', 'False') else node.id

def do_Num(self, node):
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160202170529.1">
def cls(self):
    '''Clear the screen.'''
    if sys.platform.lower().startswith('win'):
        os.system('cls')
</t>
<t tx="ekr.20160203073604.1">

class Stub(object):
    '''
    A class representing all the generated stub for a class or def.
    stub.full_name should represent the complete context of a def.
    '''
    @others
</t>
<t tx="ekr.20160203074843.1">
def init_parser(self, s):
    '''Add double back-slashes to all patterns starting with '['.'''
    trace = False
    if not s: return
    aList = []
    for s in s.split('\n'):
        if self.is_section_name(s):
            aList.append(s)
        elif s.strip().startswith('['):
            aList.append(r'\\'+s[1:])
            if trace: g.trace('*** escaping:',s)
        else:
            aList.append(s)
    s = '\n'.join(aList)+'\n'
    if trace: g.trace(s)
    file_object = io.StringIO(s)
    self.parser.readfp(file_object)</t>
<t tx="ekr.20160203075612.1">import ast
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
import re
import sys
import time
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3

</t>
<t tx="ekr.20160203094439.1">
def is_section_name(self, s):
    
    def munge(s):
        return s.strip().lower().replace(' ','')
    
    s = s.strip()
    if s.startswith('[') and s.endswith(']'):
        s = munge(s[1:-1])
        for s2 in self.section_names:
            if s == munge(s2):
                return True
    return False
</t>
<t tx="ekr.20160203095618.1">
def callers(self, n=4, count=0, excludeCaller=True, files=False):
    '''Return a list containing the callers of the function that called g.callerList.

    If the excludeCaller keyword is True (the default), g.callers is not on the list.

    If the files keyword argument is True, filenames are included in the list.
    '''
    # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
    # The jython stack often has less than 8 entries,
    # so we must be careful to call g._callerName with smaller values of i first.
    result = []
    i = 3 if excludeCaller else 2
    while 1:
        s = self._callerName(i, files=files)
        # print(i,s)
        if s:
            result.append(s)
        if not s or len(result) &gt;= n: break
        i += 1
    result.reverse()
    if count &gt; 0: result = result[: count]
    sep = '\n' if files else ','
    return sep.join(result)
</t>
<t tx="ekr.20160203095618.2">
def _callerName(self, n=1, files=False):
    # print('_callerName: %s %s' % (n,files))
    try: # get the function name from the call stack.
        f1 = sys._getframe(n) # The stack frame, n levels up.
        code1 = f1.f_code # The code object
        name = code1.co_name
        if name == '__init__':
            name = '__init__(%s,line %s)' % (
                self.shortFileName(code1.co_filename), code1.co_firstlineno)
        if files:
            return '%s:%s' % (self.shortFileName(code1.co_filename), name)
        else:
            return name # The code name
    except ValueError:
        # print('g._callerName: ValueError',n)
        return '' # The stack is not deep enough.
    except Exception:
        # es_exception()
        return '' # "&lt;no caller name&gt;"
</t>
<t tx="ekr.20160203105356.1">
def create_parser(self):
    '''Create a RawConfigParser and return it.'''
    parser = configparser.RawConfigParser(dict_type=OrderedDict)
        # Requires Python 2.7
    parser.optionxform = str
    return parser
</t>
<t tx="ekr.20160203105721.1">
def get_config_string(self):
    
    fn = self.finalize(self.config_fn)
    if os.path.exists(fn):
        if self.verbose:
            print('\nconfiguration file: %s\n' % fn)
        f = open(fn, 'r')
        s = f.read()
        f.close()
        return s
    else:
        print('\nconfiguration file not found: %s' % fn)
        return ''
    </t>
<t tx="ekr.20160203130235.1">
def __eq__(self, obj):
    '''
    Stub.__eq__. Return whether two stubs refer to the same method.
    Do *not* test parent links. That would interfere with --update logic.
    '''
    if isinstance(obj, Stub):
        return self.full_name == obj.full_name and self.kind == obj.kind
    else:
        return NotImplemented

def __ne__(self, obj):
    """Stub.__ne__"""
    return not self.__eq__(obj)
</t>
<t tx="ekr.20160203130717.1">
def __eq__(self, obj):
    """Return True if two Patterns are equivalent."""
    if isinstance(obj, Pattern):
        return self.find_s == obj.find_s and self.repl_s == obj.repl_s
    else:
        return NotImplemented

def __ne__(self, obj):
    """Return True if two Patterns are not equivalent."""
    return not self.__eq__(obj)

def __hash__(self):
    '''Pattern.__hash__'''
    return len(self.find_s) + len(self.repl_s)</t>
<t tx="ekr.20160203140342.1">
def __hash__(self):
    '''Stub.__hash__. Equality depends *only* on full_name and kind.'''
    return len(self.kind) + sum([ord(z) for z in self.full_name])</t>
<t tx="ekr.20160203183228.1">
def output_stubs(self, stub):
    '''Output this stub and all its descendants.'''
    for s in stub.out_list or []:
        # Indentation must be present when an item is added to stub.out_list.
        if self.output_file:
            self.output_file.write(s.rstrip()+'\n')
        else:
            print(s)
    # Recursively print all children.
    for child in stub.children:
        self.output_stubs(child)
</t>
<t tx="ekr.20160203183934.1">
def shortFileName(self,fileName, n=None):
    if n is None or n &lt; 1:
        return os.path.basename(fileName)
    else:
        return '/'.join(fileName.replace('\\', '/').split('/')[-n:])
</t>
<t tx="ekr.20160204113206.1">
def make_patterns_dict(self):
    '''Assign all patterns to the appropriate ast.Node.'''
    trace = False or self.trace_patterns
    for pattern in self.general_patterns:
        ops = self.find_pattern_ops(pattern)
        if ops:
            for op in ops:
                # Add the pattern to op's list.
                op_names = self.op_name_dict.get(op)
                for op_name in op_names:
                    aList = self.patterns_dict.get(op_name, [])
                    aList.append(pattern)
                    self.patterns_dict[op_name] = aList
        else:
            # Enter the name in self.names_dict.
            name = pattern.find_s
            # Special case for 'number'
            if name == 'number':
                aList = self.patterns_dict.get('Num', [])
                aList.append(pattern)
                self.patterns_dict['Num'] = aList
            elif name in self.names_dict:
                g.trace('duplicate pattern', pattern)
            else:
                self.names_dict [name] = pattern.repl_s
    if 0:
        g.trace('names_dict...')
        for z in sorted(self.names_dict):
            print('  %s: %s' % (z, self.names_dict.get(z)))
    if 0:
        g.trace('patterns_dict...')
        for z in sorted(self.patterns_dict):
            aList = self.patterns_dict.get(z)
            print(z)
            for pattern in sorted(aList):
                print('  '+repr(pattern))
    # Note: retain self.general_patterns for use in argument lists.
</t>
<t tx="ekr.20160204153904.1">
seen_names = []

def do_Name(self, node):
    '''StubFormatter ast.Name visitor.'''
    trace = False
    d = self.names_dict
    name = d.get(node.id, node.id)
    s = 'bool' if name in ('True', 'False') else name
    if trace and node.id not in self.seen_names:
        self.seen_names.append(node.id)
        if d.get(node.id):
            g.trace(node.id, '==&gt;', d.get(node.id))
        elif node.id == 'aList':
            g.trace('**not found**', node.id)
    return s
</t>
<t tx="ekr.20160204170443.1">
def find_pattern_ops(self, pattern):
    '''Return a list of operators in pattern.find_s.'''
    trace = False or self.trace_patterns
    if pattern.is_regex():
        # Add the pattern to the regex patterns list.
        g.trace(pattern)
        self.regex_patterns.append(pattern)
        return []
    d = self.op_name_dict
    keys1, keys2, keys3, keys9 = [], [], [], []
    for op in d:
        aList = d.get(op)
        if op.replace(' ','').isalnum():
            # an alpha op, like 'not, 'not in', etc.
            keys9.append(op)
        elif len(op) == 3:
            keys3.append(op)
        elif len(op) == 2:
            keys2.append(op)
        elif len(op) == 1:
            keys1.append(op)
        else:
            g.trace('bad op', op)
    ops = []
    s = s1 = pattern.find_s
    for aList in (keys3, keys2, keys1):
        for op in aList:
            # Must match word here!
            if s.find(op) &gt; -1:
                s = s.replace(op, '')
                ops.append(op)
    # Handle the keys9 list very carefully.
    for op in keys9:
        target = ' %s ' % op
        if s.find(target) &gt; -1:
            ops.append(op)
            break # Only one match allowed.
    if trace and ops: g.trace(s1, ops)
    return ops
</t>
<t tx="ekr.20160204170921.1">
def make_op_name_dict(self):
    '''
    Make a dict whose keys are operators ('+', '+=', etc),
    and whose values are lists of values of ast.Node.__class__.__name__.
    '''
    d = {
        '.':   ['Attr',],
        '(*)': ['Call', 'Tuple',],
        '[*]': ['List', 'Subscript',],
        '{*}': ['???',],
        ### 'and': 'BoolOp',
        ### 'or':  'BoolOp',
    }
    for op in (
        '+', '-', '*', '/', '%', '**', '&lt;&lt;',
        '&gt;&gt;', '|', '^', '&amp;', '//',
    ):
        d[op] = ['BinOp',]
    for op in (
        '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=',
        'is', 'is not', 'in', 'not in',
    ):
        d[op] = ['Compare',]
    return d
</t>
<t tx="ekr.20160204224242.1">
def update(self, fn, new_root):
    '''
    Merge the new_root tree with the old_root tree in fn (a .pyi file).

    new_root is the root of the stub tree from the .py file.
    old_root (read below) is the root of stub tree from the .pyi file.
    
    Return old_root, or new_root if there are any errors.
    '''
    trace = False ; verbose = False
    s = self.get_stub_file(fn)
    if not s or not s.strip():
        return new_root
    if '\t' in s:
        # Tabs in stub files make it impossible to parse them reliably.
        g.trace('Can not update stub files containing tabs.')
        return new_root
    # Read old_root from the .pyi file.
    old_d, old_root = self.parse_stub_file(s, root_name='&lt;old-stubs&gt;')
    if old_root:
        # Merge new stubs into the old tree.
        if trace and verbose:
            print(self.trace_stubs(old_root, header='old_root'))
            print(self.trace_stubs(new_root, header='new_root'))
        print('***** updating stubs from %s *****' % fn)
        self.merge_stubs(self.stubs_dict.values(), old_root, new_root)
        if trace:
            print(self.trace_stubs(old_root, header='updated_root'))
        return old_root
    else:
        return new_root
</t>
<t tx="ekr.20160205053641.1">
# StubFormatter visitors for operators...
</t>
<t tx="ekr.20160205053641.2">
# BinOp(expr left, operator op, expr right)

def do_BinOp(self, node):
    '''StubFormatter.BinOp visitor.'''
    trace = False or self.trace_reduce ; verbose = False
    numbers = ['number', 'complex', 'float', 'long', 'int',]
    op = self.op_name(node.op)
    lhs = self.visit(node.left)
    rhs = self.visit(node.right)
    if op.strip() in ('is', 'is not', 'in', 'not in'):
        s = 'bool'
    elif lhs == rhs:
        s = lhs
            # Perhaps not always right,
            # but it is correct for Tuple, List, Dict.
    elif lhs in numbers and rhs in numbers:
        s = reduce_types([lhs, rhs], trace=trace)
            # reduce_numbers would be wrong: it returns a list.
    elif lhs == 'str' and op in '%+*':
        # str + any implies any is a string.
        s = 'str'
    else:
        if trace and verbose and lhs == 'str':
            g.trace('***** unknown string op', lhs, op, rhs)
        # Fall back to the base-class behavior.
        s = '%s%s%s' % (
            self.visit(node.left),
            op,
            self.visit(node.right))
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160205053641.3">
# BoolOp(boolop op, expr* values)

def do_BoolOp(self, node): # Python 2.x only.
    '''StubFormatter.BoolOp visitor for 'and' and 'or'.'''
    trace = False or self.trace_reduce
    op = self.op_name(node.op)
    values = [self.visit(z).strip() for z in node.values]
    s = reduce_types(values, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160205053641.4">
# Compare(expr left, cmpop* ops, expr* comparators)

def do_Compare(self, node):
    '''
    StubFormatter ast.Compare visitor for these ops:
    '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=', 'is', 'is not', 'in', 'not in',
    '''
    s = 'bool' # Correct regardless of arguments.
    ops = ','.join([self.op_name(z) for z in node.ops])
    self.trace_visitor(node, ops, s)
    return s
</t>
<t tx="ekr.20160205053641.5">
# UnaryOp(unaryop op, expr operand)

def do_UnaryOp(self, node):
    '''StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators.'''
    op = self.op_name(node.op)
    # g.trace(op.strip(), self.raw_format(node.operand))
    if op.strip() == 'not':
        return 'bool'
    else:
        s = self.visit(node.operand)
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
</t>
<t tx="ekr.20160205053641.6">
# If(expr test, stmt* body, stmt* orelse)

def do_IfExp(self, node):
    '''StubFormatterIfExp (ternary operator).'''
    trace = False or self.trace_reduce
    aList = [
        self.match_all(node, self.visit(node.body)),
        self.match_all(node, self.visit(node.orelse)),
    ]
    s = reduce_types(aList, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, 'if', s)
    return s
</t>
<t tx="ekr.20160205053705.1">
# StubFormatter visitors for operands...</t>
<t tx="ekr.20160205060709.1">
def get_stub_file(self, fn):
    '''Read the stub file into s.'''
    if os.path.exists(fn):
        try:
            s = open(fn, 'r').read()
        except Exception:
            print('--update: error reading %s' % fn)
            s = None
        return s
    else:
        print('--update: not found: %s' % fn)
        return None
</t>
<t tx="ekr.20160205060807.1">
def parse_stub_file(self, s, root_name):
    '''
    Parse s, the contents of a stub file, into a tree of Stubs.
    
    Parse by hand, so that --update can be run with Python 2.
    '''
    trace = False
    assert '\t' not in s
    d = {}
    root = Stub(kind='root', name=root_name)
    indent_stack = [-1] # To prevent the root from being popped.
    stub_stack = [root]
    lines = []
    pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
    for line in g.splitLines(s):
        m = pat.match(line)
        if m:
            indent, kind, name, rest = (
                len(m.group(1)), m.group(2), m.group(3), m.group(4))
            old_indent = indent_stack[-1]
            # Terminate any previous lines.
            old_stub = stub_stack[-1]
            old_stub.out_list.extend(lines)
            if trace:
                for s in lines:
                    g.trace('  '+s.rstrip())
            lines = [line]
            # Adjust the stacks.
            if indent == old_indent:
                stub_stack.pop()
            elif indent &gt; old_indent:
                indent_stack.append(indent)
            else: # indent &lt; old_indent
                # The indent_stack can't underflow because
                # indent &gt;= 0 and indent_stack[0] &lt; 0
                assert indent &gt;= 0
                while indent &lt;= indent_stack[-1]:
                    indent_stack.pop()
                    old_stub = stub_stack.pop()
                    assert old_stub != root
                indent_stack.append(indent)
            # Create and push the new stub *after* adjusting the stacks.
            assert stub_stack
            parent = stub_stack[-1]
            stack = [z.name for z in stub_stack[1:]]
            parent = stub_stack[-1]
            stub = Stub(kind, name, parent, stack)
            self.add_stub(d, stub)
            stub_stack.append(stub)
            if trace:
                g.trace('%s%5s %s %s' % (' '*indent, kind, name, rest))
        else:
            parent = stub_stack[-1]
            lines.append(line)
    # Terminate the last stub.
    old_stub = stub_stack[-1]
    old_stub.out_list.extend(lines)
    if trace:
        for s in lines:
            g.trace('  '+s.rstrip())
    return d, root
</t>
<t tx="ekr.20160205072101.1">
def reduce_types(aList, name=None, trace=False):
    '''
    Return a string containing the reduction of all types in aList.
    The --trace-reduce command-line option sets trace=True.
    If present, name is the function name or class_name.method_name.
    '''
    return ReduceTypes(aList, name, trace).reduce_types()
</t>
<t tx="ekr.20160205101134.1">
def reduce_numbers(self, aList):
    '''
    Return aList with all number types in aList replaced by the most
    general numeric type in aList.
    '''
    trace = False
    found = None
    numbers = ('number', 'complex', 'float', 'long', 'int')
    for kind in numbers:
        for z in aList:
            if z == kind:
                found = kind
                break
        if found:
            break
    if found:
        assert found in numbers, found
        aList = [z for z in aList if z not in numbers]
        aList.append(found)
    if trace: g.trace(aList)
    return aList
</t>
<t tx="ekr.20160205103604.4">
# Attribute(expr value, identifier attr, expr_context ctx)

attrs_seen = []

def do_Attribute(self, node):
    '''StubFormatter.do_Attribute.'''
    trace = False
    s = '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
    s2 = self.names_dict.get(s)
    if trace and s2 and s2 not in self.attrs_seen:
        self.attrs_seen.append(s2)
        g.trace(s, '==&gt;', s2)
    return s2 or s
</t>
<t tx="ekr.20160205103604.6">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    '''StubFormatter.Call visitor.'''
    trace = False
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    # Explicit pattern:
    if func in ('dict', 'list', 'set', 'tuple',):
        s = '%s[%s]' % (func.capitalize(), ', '.join(args))
    else:
        s = '%s(%s)' % (func, ', '.join(args))
    s = self.match_all(node, s, trace=trace)
    self.trace_visitor(node, 'call', s)
    return s
</t>
<t tx="ekr.20160205103604.7">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160205103604.9">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    # return ''.join(result)
    return 'Dict[%s]' % ''.join(result)
</t>
<t tx="ekr.20160205131910.1">
matched_d = {}

def match_all(self, node, s, trace=False):
    '''Match all the patterns for the given node.'''
    trace = False or trace or self.trace_matches
    # verbose = True
    d = self.matched_d
    name = node.__class__.__name__
    s1 = truncate(s, 40)
    caller = g.callers(2).split(',')[1].strip()
        # The direct caller of match_all.
    patterns = self.patterns_dict.get(name, []) + self.regex_patterns
    for pattern in patterns:
        found, s = pattern.match(s,trace=False)
        if found:
            if trace:
                aList = d.get(name, [])
                if pattern not in aList:
                    aList.append(pattern)
                    d [name] = aList
                    print('match_all:    %-12s %26s %40s ==&gt; %s' % (caller, pattern, s1, s))
            break
    return s</t>
<t tx="ekr.20160205142626.1">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    '''StubFormatter.Subscript.'''
    s = '%s[%s]' % (
        self.visit(node.value),
        self.visit(node.slice))
    s = self.match_all(node, s)
    self.trace_visitor(node, '[]', s)
    return s
</t>
<t tx="ekr.20160205143923.1">
def do_Tuple(self, node):
    elts = [self.visit(z) for z in node.elts]
    return '(%s)' % ', '.join(elts)
</t>
<t tx="ekr.20160206095102.1">&lt;&lt; docstring &gt;&gt;
# **Note**: this is a Leo script.
# It **does** have access to c, g and p.
import os
import re
@others
test_dir = os.path.dirname(c.fileName())+os.sep+'test'
assert os.path.exists(test_dir), test_dir
assert os.path.isdir(test_dir), test_dir

if 1:
    # Writes each test to a separate file in the test directory.
    TestWriter(c,path=test_dir).run(fn=None)    
if 0:
    # Writes all tests to a single file: test/unit_tests.py
    TestWriter(c,path=test_dir).run(fn='unit_tests.py')
</t>
<t tx="ekr.20160206095102.2">@
@language rest
'''
This script transliterates @test nodes into .py file. The two main ways of
using this script are as follows::

    TestWriter(c,path='test').run(fn='unit_tests.py') # writes one file
    TestWriter(c,path='test').run(fn=None)            # writes separate files.
     
The first writes all tests to test/unit_tests.py; the second writes each
unit test to a separate .py file in the test directory.

The script imports each written file and reports any syntax errors.

This is a straightforward script; it should be easy to modify it to suit
individual needs.

The &lt;\&lt; file_template &gt;&gt; and &lt;\&lt; test_template &gt;&gt; sections in the TestWriter
class determines exactly what this script writes.
'''
</t>
<t tx="ekr.20160206101140.1">
def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
</t>
<t tx="ekr.20160206101802.10">
def test(self,fn):
    '''Test the newly created file.'''
    import imp
    import sys

    if self.path not in sys.path:
        sys.path.append(self.path)
    assert fn.endswith('.py')
    name = fn[:-3]
    try:
        f,path,desc = imp.find_module(name,[self.path])
        imp.load_module(name,f,path,desc)
        # print('imported %s' % (name))
    except Exception:
        print('can not import: %s' % (name))
        g.es_print_exception()
</t>
<t tx="ekr.20160206101802.11">
def write_file(self,fn):

    assert g.os_path_exists(self.path),self.path
    fn = g.os_path_finalize_join(self.path,fn)
    f = open(fn,'w')
    f.write(self.file_template)
    # g.trace(''.join([z.h for z in self.nodes]))
    for p in self.nodes:
        f.write(self.test_template % (self.clean(p.h),self.get_body(p)))
    f.close()
    g.trace('wrote', fn)
</t>
<t tx="ekr.20160206101802.3">

class TestWriter:
    
    &lt;&lt; define file_template &gt;&gt;
    &lt;&lt; define test_template &gt;&gt;

    @others
</t>
<t tx="ekr.20160206101802.4"># Add any other common imports here.

file_template = '''\
import unittest
from make_stub_files import *
'''

file_template = g.adjustTripleString(file_template,c.tab_width)
</t>
<t tx="ekr.20160206101802.5">test_template = '''
class %s (unittest.TestCase):
    def runTest(self):
%s
'''

test_template = g.adjustTripleString(test_template,c.tab_width)
</t>
<t tx="ekr.20160206101802.6">
def __init__(self,c,path=''):
    '''TestWriter ctor.'''
    self.c = c
    load_dir = g.os_path_dirname(c.fileName())
    self.path = g.os_path_finalize_join(load_dir,path)
    self.nodes = []
    assert g.os_path_exists(self.path),self.path
</t>
<t tx="ekr.20160206101802.7">
def clean(self,s):
    '''Munge s so that it can be used as a file name.'''
    result,tag = [],'@test'
    if s.startswith(tag):
        s = s[len(tag):]
    for ch in s.strip():
        if ch.isalnum():
            result.append(ch)
        else:
            result.append('_')
        # elif ch.isspace():
            # result.append('_')
    s = ''.join(result)
    if s.endswith('.py'):
        s = s[:-3]
    if not s.startswith('test'):
        s = 'test_' + s
    return s.replace('__','_').strip()
</t>
<t tx="ekr.20160206101802.8">
def get_body(self, p):
    '''Convert p.b to a valid script.'''
    s_old = p.b
    # Suppress @others but not section references.
    p.b = p.b.replace('@others', '')
    assert p.b.find('@others') == -1
    s = g.getScript(c, p,
                    useSelectedText=False,
                    forcePythonSentinels=True,
                    useSentinels=False)
    p.b = s_old
    s = ''.join([' '*8+z for z in g.splitLines(s) if z.strip()])
            # Add leading indentation needed by test_template.
    return s.rstrip()+'\n'
</t>
<t tx="ekr.20160206101802.9">
def run(self,fn=None):
    
    n, p = 0, c.rootPosition()
    while p:
        if p.h.startswith('@ignore '):
            p.moveToNodeAfterTree()
        elif p.h.startswith('@test '):
            self.nodes.append(p.copy())
            if not fn:
                fn2 = self.clean(p.h)+'.py'
                self.write_file(fn2)
                self.test(fn2)
                self.nodes=[]
            n += 1
            p.moveToThreadNext()
        else:
            p.moveToThreadNext()
    if n == 0:
        print('no @file or @suite nodes found.')
    else:
        if fn:
            self.write_file(fn)
            self.test(fn)
        dest = g.os_path_join(self.path, fn) if fn else self.path
        print('wrote %s test%s to %s' % (n,self.plural(n), dest))
</t>
<t tx="ekr.20160206103417.1">
def plural(self, n):
    return 's' if n &gt; 1 else ''
</t>
<t tx="ekr.20160206104033.1"># pylint: disable=relative-import
g.cls()
import test_msf
import unittest
loader = unittest.TestLoader()
suite = loader.loadTestsFromTestCase(test_msf.TestMakeStubFiles)
unittest.TextTestRunner(verbosity=0).run(suite)
</t>
<t tx="ekr.20160206104634.1">
# Top-level functions</t>
<t tx="ekr.20160206110004.1">@others
import re
g = LeoGlobals() # Use the g available to the script.
table = (
    # s,  Pattern.find_s, Pattern.repl_s, expected
    # Passed...
    ('aabbcc', '(a+)(b+)(c+)$', r'\3\2\1', 'ccbbaa'),
    ('[str]', r'\[str\]$', 'xxx', 'xxx'), # Guido bug.
    ('s3', r's[1-3]?\b$', 'str', 'str'), # lengthening bug.
    ('s', 's', 'str', 'str'),
    ('abc', 'abc', 'ABC', 'ABC'),
    ('str(str)', 'str(*)', 'str', 'str'),
    ('[whatever]', '[*]', 'List[*]', 'List[whatever]'), # * on the RHS.
    ('(int,str)', '(*)', 'Tuple[*]', 'Tuple[int,str]'), # Guido bug 2.
    ('abcxyz', 'abc*', 'xxx', 'xxx'), # New test for trailing *.
    ('list(self.regex.finditer(str))','list(*)','List[*]',
     'List[self.regex.finditer(str)]'),
)
for s, find, repl, expected in table:
    pattern = Pattern(find, repl)
    result = pattern.match_entire_string(s)
    assert result, (result, s, find, repl, expected)
    aList = pattern.all_matches(s)
    assert len(aList) == 1, aList
    found, s2 = pattern.match(s)
    assert found, 'after pattern.match(s)'
    assert s2 == expected, (s, pattern, 'expected', expected, 'got', s2)
p1 = Pattern('abc','xyz')
p2 = Pattern('abc','xyz')
p3 = Pattern('abc','pdq')
assert p1 == p2
assert p1 != p3
assert p2 != p3
aSet = set()
aSet.add(p1)
assert p1 in aSet
assert p2 in aSet
assert p3 not in aSet
assert list(aSet) == [p1] == [p2]
aSet.add(p3)
assert p1.match_entire_string('abc')
assert not p1.match_entire_string('abcx')
</t>
<t tx="ekr.20160206120522.1">
def pdb(self):
    '''Invoke a debugger during unit testing.'''
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160206165507.1">@language config

# A configuration file to make stubs for make_stub_files.py itself.

[Global]

files: test/test.py
output_directory: ./test
# prefix_lines:

[Def Name Patterns]

[General Patterns]

# Declarations of names..
a: Any
s: str
aList: List[Any]
is_known_type(*): bool

# Known functions...
all(*): bool
any(*): bool
endswith(*): bool
g.match_word(*): bool
hash(*): int
hasattr(*): bool
int(*): int
len(*): int
os.path.basename(*): str
os.sep.join(*): str
repr(*): str
sep.join(*): str
self.__eq__(*): bool
self.__ne__(*): bool
self.__gt__(*): bool
self.__lt__(*): bool
sorted(*): str
str%(*): str
str.join(*): str
str.isspace(*): str
str[*]: str
sum(*): number
</t>
<t tx="ekr.20160206165656.1">'''A test file containing code that caused mypy errors.'''

def is_known_type(s):
    '''
    Return True if s is nothing but a single known type.
    Recursively test inner types in square brackets.
    '''
    trace = False
    s1 = s
    s = s.strip()
    table = (
        # None,
        'self', # Experimental.
        'None', 
        'complex', 'float', 'int', 'long', 'number',
        'dict', 'list', 'tuple',
        'bool', 'bytes', 'str', 'unicode',
    )
    for s2 in table:
        if s2 == s:
            return True
        elif Pattern(s2+'(*)', s).match_entire_string(s):
            return True
    if s.startswith('[') and s.endswith(']'):
        inner = s[1:-1]
        return is_known_type(inner) if inner else True
    elif s.startswith('(') and s.endswith(')'):
        inner = s[1:-1]
        return is_known_type(inner) if inner else True
    elif s.startswith('{') and s.endswith('}'):
        return True ### Not yet.
        # inner = s[1:-1]
        # return is_known_type(inner) if inner else True
    table = (
        # Pep 484: https://www.python.org/dev/peps/pep-0484/
        # typing module: https://docs.python.org/3/library/typing.html
        'AbstractSet', 'Any', 'AnyMeta', 'AnyStr',
        'BinaryIO', 'ByteString',
        'Callable', 'CallableMeta', 'Container',
        'Dict', 'Final', 'Generic', 'GenericMeta', 'Hashable',
        'IO', 'ItemsView', 'Iterable', 'Iterator',
        'KT', 'KeysView', 'List',
        'Mapping', 'MappingView', 'Match',
        'MutableMapping', 'MutableSequence', 'MutableSet',
        'NamedTuple', 'Optional', 'OptionalMeta',
        # 'POSIX', 'PY2', 'PY3',
        'Pattern', 'Reversible',
        'Sequence', 'Set', 'Sized',
        'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
        'T', 'TextIO', 'Tuple', 'TupleMeta',
        'TypeVar', 'TypingMeta',
        'Undefined', 'Union', 'UnionMeta',
        'VT', 'ValuesView', 'VarBinding',
    )
    for s2 in table:
        if s2 == s:
            return True
        pattern = Pattern(s2+'[*]', s)
        if pattern.match_entire_string(s):
            # Look inside the square brackets.
            # if s.startswith('Dict[List'): g.pdb()
            brackets = s[len(s2):]
            assert brackets and brackets[0] == '[' and brackets[-1] == ']'
            s3 = brackets[1:-1]
            if s3:
                return all([is_known_type(z.strip())
                    for z in split_types(s3)])
            else:
                return True
    if trace: g.trace('Fail:', s1)
    return False


def return_every_kind(a, b):
    # pylint: disable=unreachable
    return 1
    return 1.0
    return float(1.0)
    return complex(2.0,3.0)
    return long(1)
    return ('a','b')
    return [1, 2]
    return {}
    return {'x': 'y',}
    return dict(['p', 'q'])
    return list(1,2)
    return int(0.5)
    return tuple('a1', 'b1')
    return True and False
    return True or False
    return 1 and 0
    return 1 or -1
    return not True
    return not 1
    return 1 if False else 2
    
def match_entire_string(self, s):
    '''Return True if s matches self.find_s'''
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        return j is not None
    else:
        m = self.regex.match(s)
        return m and m.group(0) == s

def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
    
def sum_test(n):
    '''An common recursive pattern.'''
    if n == 1:
        return 1
    else:
        return 1 + sum(n-1)
        
def not_test(a):
    return not a
    
def optional_any(a):
    if a:
        return a
    else:
        return None
        
def optional_any2(a):
    if a:
        return a
    else:
        return
</t>
<t tx="ekr.20160206170515.1">a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
table = (
    ([i,i],     [i]),
    ([i],       [i]),
    ([f, i],    [f]),
    ([c, i],    [c]),
    ([l, a],    [a, l]),
)
@others
for aList, expected in table:
    got = ReduceTypes().reduce_numbers(aList)
    assert expected == got,  (aList, 'expected:', expected, 'got', got)
</t>
<t tx="ekr.20160206171945.1">@language rest

http://leoeditor.com/unitTesting.html discusses unit testing in Leo.

http://leoeditor.com/tutorial-scripting.html discusses basic Leo programming,
including the the predefined vars c, g and p.

*How to run unit tests from this file*:

    Alt-6 runs *all* @test nodes.
    Alt-5 runs all *marked* @test nodes.
    Alt-4 runs the selected @test node.

I typically use Alt-5 when working a long time on a particular test.
Marking just that @test node allows me to run the test from any node.

@language python
</t>
<t tx="ekr.20160206173343.1">a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
none = 'None'
x = 'xyzzy'
y = 'pdq'
table = (
    ([i,i],         i),
    ([i],           i),
    ([f, i],        f),
    ([c, i],        c),
    ([l, a],        'Union[Any, long]'),
    # Handle None
    ([None],        none),
    ([None, None],  none),
    ([None, a, c],  'Optional[Union[Any, complex]]'),
    # Handle unknown types, and special cases
    ([i, x],        'Union[Any, int]'),
    ([None, x],     'Optional[Any]'),
    ([none, x],     'Optional[Any]'),
    (['', x],       'Optional[Any]'),
    ([none, x, c],  'Optional[Union[Any, complex]]'),
    ([x, y],        'Any'),
    # Collection merging.  More could be done...
    (['Dict[int, str]', 'Dict[Any, str]'],          'Union[Dict[Any, str], Dict[int, str]]'),
    (['List[int, str]', 'List[Any, str]'],          'Union[List[Any, str], List[int, str]]'),
    (['Union[int, str]', 'Union[Any, str]'],        'Union[Union[Any, str], Union[int, str]]'),
    (['Union[int, str]', 'int', 'Union[Any, str]'], 'Union[Union[Any, str], Union[int, str], int]'),
    (['Tuple[xyz, pdq]'],                           'Tuple[Any, Any]'),
)
@others
for aList, expected in table:
    got = ReduceTypes(aList).reduce_types()
    assert expected == got, '\naList:    %s\nexpected: %s\ngot:      %s' % (aList, expected, got)
</t>
<t tx="ekr.20160206174054.1">
def is_regex(self):
    '''
    Return True if self.find_s is a regular pattern.
    For now a kludgy convention suffices.
    '''
    return self.find_s.endswith('$')
        # A dollar sign is not valid in any Python expression.
</t>
<t tx="ekr.20160206174547.1">
def replace_regex(self, m, s):
    '''Do the replacement in s specified by m.'''
    s = self.repl_s
    for i in range(9):
        group = '\\%s' % i
        if s.find(group) &gt; -1:
            # g.trace(i, m.group(i))
            s = s.replace(group, m.group(i))
    return s</t>
<t tx="ekr.20160206174740.1">
def replace(self, m, s):
    '''Perform any kind of replacement.'''
    if self.is_balanced():
        start, end = m
        return self.replace_balanced(s, start, end)
    else:
        return self.replace_regex(m, s)
</t>
<t tx="ekr.20160206203133.1">
def visit(self, node):
    '''StubFormatter.visit: supports --verbose tracing.'''
    s = AstFormatter.visit(self, node)
    # g.trace('%12s %s' % (node.__class__.__name__,s))
    return s</t>
<t tx="ekr.20160206204452.1">
def do_List(self, node):
    '''StubFormatter.List.'''
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    # g.trace('=====',elts)
    return 'List[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160206212123.1">
def split_types(self, s):
    '''Split types on *outer level* commas.'''
    aList, i1, level = [], 0, 0
    for i, ch in enumerate(s):
        if ch == '[':
            level += 1
        elif ch == ']':
            level -= 1
        elif ch == ',' and level == 0:
            aList.append(s[i1:i])
            i1 = i+1
    aList.append(s[i1:].strip())
    return aList</t>
<t tx="ekr.20160207051316.1">
def merge_types(a1, a2):
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
<t tx="ekr.20160207051429.1">a, c, f, i, l, n = ('Any', 'complex', 'float', 'int', 'long', 'number')
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
@others
for a1, a2, expected in table:
    got = merge_types(a1, a2)
    assert expected == got, (a1, a2, 'expected:', expected, 'got', got)
</t>
<t tx="ekr.20160207101607.1">@language rest
@wrap

This is the theory-of-operation document for the `make_stub_files` script.
It is intentionally brief. Please [ask questions](#summary) if anything is unclear.

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
        '''Return s truncated to n characters.'''
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
<t tx="ekr.20160207105647.1"></t>
<t tx="ekr.20160207105710.1">g.cls()
for p1 in c.all_unique_positions():
    if p1.h.startswith('@clean'):
        for p in p1.subtree():
            if (not p.h.strip().startswith('&lt;&lt;') and
                p.b.strip() and not p.b.startswith('\n')
            ):
                print(repr(p.b[:3]), p.h)
print('done')
</t>
<t tx="ekr.20160207115604.1">
def truncate(s, n):
    '''Return s truncated to n characters.'''
    return s if len(s) &lt;= n else s[:n-3] + '...'
</t>
<t tx="ekr.20160207115947.1">table = (
    ('abc',     'abc'),
    ('abcd',    'abcd'),
    ('abcde',   'abcde'),
    ('abcdef',  'ab...'),
    ('abcdefg', 'ab...'),
)
@others  
for s1, s2 in table:
    got = truncate(s1, 5)
    assert s2 == got, (s1, 'expected', s2, 'got', got)</t>
<t tx="ekr.20160207162818.1">table = (
    ('list',                    ['list']),
    ('List[a,b]',               ['List[a,b]']),
    ('List[a,b], List[c,d]',    ['List[a,b]', 'List[c,d]']),
)
@others
for s, expected in table:
    got = ReduceTypes().split_types(s)
    assert expected == got, (s, 'expected', expected, 'got', got)
</t>
<t tx="ekr.20160207165240.1"></t>
<t tx="ekr.20160207181637.1"></t>
<t tx="ekr.20160207181648.1"></t>
<t tx="ekr.20160207181710.1">pylint
clone-find-all-flattened
clone-to-at-spot
beautify-tree
sort-lines
</t>
<t tx="ekr.20160207181843.1">@language python

c.cloneFindAllFlattenedAtNode('@clean make_stub_files.py',top_level=True)
</t>
<t tx="ekr.20160207182535.1"></t>
<t tx="ekr.20160207190840.1">
def remove_recursive_calls(self, name, raw, reduced):
    '''Remove any recursive calls to name from both lists.'''
    # At present, this works *only* if the return is nothing but the recursive call.
    trace = False
    assert len(raw) == len(reduced)
    pattern = Pattern('%s(*)' % name)
    n = len(reduced)
    raw_result, reduced_result = [], []
    for i in range(n):
        if pattern.match_entire_string(reduced[i]):
            if trace:
                g.trace('****', name, pattern, reduced[i])
        else:
            raw_result.append(raw[i])
            reduced_result.append(reduced[i])
    return raw_result, reduced_result</t>
<t tx="ekr.20160208093906.1">
def trace_visitor(self, node, op, s):
    '''Trace node's visitor.'''
    if self.trace_visitors:
        caller = g.callers(2).split(',')[1]
        s1 = AstFormatter().format(node).strip()
        print('%12s op %-6s: %s ==&gt; %s' % (caller, op.strip(), s1, s))
</t>
<t tx="ekr.20160208162138.1">
    # First, look at the [Def Name Patterns]
    if 0: # This never seems to match anything.
        stack = self.traverser.class_name_stack
        if stack:
            name = '%s.%s' % (stack[-1], func)
        else:
            name = func
        for pattern in self.def_patterns:
            found, s = pattern.match(name)
            if found:
                if trace: g.trace('%s: %s -&gt; %s' % (pattern.find_s, name, s))
                return s</t>
<t tx="ekr.20160209104843.1">
def trace_stubs(self, stub, aList=None, header=None, level=-1):
    '''Return a trace of the given stub and all its descendants.'''
    indent = ' '*4*max(0,level)
    if level == -1:
        aList = ['===== %s...\n' % (header) if header else '']
    for s in stub.out_list:
        aList.append('%s%s' % (indent, s.rstrip()))
    for child in stub.children:
        self.trace_stubs(child, level=level+1, aList=aList)
    if level == -1:
        return '\n'.join(aList) + '\n'
</t>
<t tx="ekr.20160209105448.1">
def output_time_stamp(self):
    '''Put a time-stamp in the output file.'''
    if self.output_file:
        self.output_file.write('# make_stub_files: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160209194832.1">
def add_stub(self, d, stub):
    '''Add the stub to d, checking that it does not exist.'''
    trace = False ; verbose = False
    key = stub.full_name
    assert key
    if key in d:
        caller = g.callers(2).split(',')[1]
        g.trace('Ignoring duplicate entry for %s in %s' % (stub, caller))
    else:
        d [key] = stub
        if trace and verbose:
            caller = g.callers(2).split(',')[1]
            g.trace('%17s %s' % (caller, stub.full_name))
        elif trace:
            g.trace(stub.full_name)</t>
<t tx="ekr.20160210041431.1">
def merge_stubs(self, new_stubs, old_root, new_root, trace=False):
    '''
    Merge the new_stubs *list* into the old_root *tree*.
    - new_stubs is a list of Stubs from the .py file.
    - old_root is the root of the stubs from the .pyi file.
    - new_root is the root of the stubs from the .py file.
    '''
    trace = False or trace ; verbose = False
    # Part 1: Delete old stubs do *not* exist in the *new* tree.
    aList = self.check_delete(new_stubs,
                              old_root,
                              new_root,
                              trace and verbose)
        # Checks that all ancestors of deleted nodes will be deleted.
    aList = list(reversed(self.sort_stubs_by_hierarchy(aList)))
        # Sort old stubs so that children are deleted before parents.
    if trace and verbose:
        dump_list('ordered delete list', aList)
    for stub in aList:
        if trace: g.trace('deleting  %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.remove(stub)
        assert not self.find_stub(stub, old_root), stub
    # Part 2: Insert new stubs that *not* exist in the *old* tree.
    aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
    aList = self.sort_stubs_by_hierarchy(aList)
        # Sort new stubs so that parents are created before children.
    for stub in aList:
        if trace: g.trace('inserting %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.append(stub)
        assert self.find_stub(stub, old_root), stub</t>
<t tx="ekr.20160210043910.1">
def find_parent_stub(self, stub, root):
    '''Return stub's parent **in root's tree**.'''
    return self.find_stub(stub.parent, root) if stub.parent else None
</t>
<t tx="ekr.20160210043933.1">
def find_stub(self, stub, root):
    '''Return the stub **in root's tree** that matches stub.'''
    if stub == root: # Must use Stub.__eq__!
        return root # not stub!
    for child in root.children:
        stub2 = self.find_stub(stub, child)
        if stub2: return stub2
    return None
</t>
<t tx="ekr.20160210043957.1">
def sort_stubs_by_hierarchy(self, stubs1):
    '''
    Sort the list of Stubs so that parents appear before all their
    descendants.
    '''
    stubs, result = stubs1[:], []
    for i in range(50):
        if stubs:
            # Add all stubs with i parents to the results.
            found = [z for z in stubs if z.level() == i]
            result.extend(found)
            for z in found:
                stubs.remove(z)
        else:
            return result
    g.trace('can not happen: unbounded stub levels.')
    return [] # Abort the merge.
</t>
<t tx="ekr.20160210080720.1">'''Test framework for st.update and helpers.'''
# To do:
# - Test between-stub lines and leading lines.
# - Round-trip tests!
&lt;&lt; imports &gt;&gt;
&lt;&lt; old_stubs &gt;&gt;
&lt;&lt; new_stubs &gt;&gt;
@others
g = LeoGlobals() # Use the g available to the script.
# g.cls()
st = StubTraverser(controller=g.NullObject())
# dump('old_s', old_s)
# dump('new_s', new_s)
old_d, old_root = st.parse_stub_file(old_s, root_name='&lt;old-root&gt;')
new_d, new_root = st.parse_stub_file(new_s, root_name='&lt;new-root&gt;')
if 0:
    dump_dict('old_d', old_d)
    dump_dict('new_d', new_d)
    print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))
    print(st.trace_stubs(new_root, header='trace_stubs(new_root)'))
if 0: # separate unit test. Passed.
    aList = st.sort_stubs_by_hierarchy(new_root)
    dump_list(aList, 'after sort_stubs_by_hierarcy')
new_stubs = new_d.values()
st.merge_stubs(new_stubs, old_root, new_root, trace=False)
if 0:
    print(st.trace_stubs(old_root, header='trace_stubs(old_root)'))
</t>
<t tx="ekr.20160210081628.1"># To be INSERTED (They exist in new stubs, but not here.)
# def is_known_type(s: str) -&gt; Union[Any,bool]: ...
# def reduce_numbers(aList: List[Any]) -&gt; List[Any]: ...
# class AstFormatter:
    # def format(self, node: Node) -&gt; Union[Any,str]: ...
    # def visit(self, node: Node) -&gt; str: ...
    # def do_ClassDef(self, node: Node) -&gt; str: ...
    # def do_FunctionDef(self, node: Node) -&gt; str: ...
old_s = '''\
def main() -&gt; None: ...
def merge_types(a1: Any, a2: Any) -&gt; str: ...
def pdb(self) -&gt; None: ...
def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -&gt; Any: ...
class Pattern(object):
    def __init__(self, find_s: str, repl_s: str='') -&gt; None: ...
    def __eq__(self, obj: Any) -&gt; bool: ...
    def __ne__(self, obj: Any) -&gt; bool: ...
    def __hash__(self) -&gt; int: ...
    def __repr__(self) -&gt; str: ...
    def is_balanced(self) -&gt; bool: ...
    def is_regex(self) -&gt; Any: ...
        #   0: return self.find_s.endswith('$')
        # ? 0: return self.find_s.endswith(str)
'''
</t>
<t tx="ekr.20160210082857.1"></t>
<t tx="ekr.20160210083825.1">
def dump(title, s=None):
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)
</t>
<t tx="ekr.20160210111955.1">
def __repr__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s %s' % (id(self), self.full_name)
    
def __str__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s' % self.full_name
</t>
<t tx="ekr.20160210112634.1"></t>
<t tx="ekr.20160210112945.1">&lt;&lt; imports &gt;&gt;
@others
g = LeoGlobals() # Use the g available to the script.
# g.cls()
# Test equality...
stub1 = Stub(kind='def', name='foo')
stub2 = Stub(kind='class', name='foo')
stub3 = Stub(kind='def', name='bar')
stub4 = Stub(kind='def', name='foo')
stub4.out_list = ['xyzzy']
    # Contents of out_list must not affect equality!
aList = [stub1, stub3]
assert stub1 != stub2
assert stub1 != stub3
assert stub1 == stub4
assert stub1 in aList
assert stub2 not in aList
assert stub3 in aList
# Test __hash__
d = {stub1: 'stub1'}
assert stub1 in d
assert stub2 not in d
# Test parents and level.
stub_1 = Stub(kind='def', name='stub_1')
stub_2 = Stub(kind='def', name='stub_2', parent=stub_1, stack=['stub_1'])
stub_3 = Stub(kind='def', name='stub_3', parent=stub_2, stack=['stub_1', 'stub_2'])
assert stub_1.parents() == [], stub_1.parents()
assert stub_2.parents() == ['stub_1'], stub_2.parents()
assert stub_3.parents() == ['stub_1', 'stub_2'], stub_3.parents()
assert stub_1.level() == 0
assert stub_2.level() == 1
assert stub_3.level() == 2
</t>
<t tx="ekr.20160210132520.1">
def level(self):
    '''Return the number of parents.'''
    return len(self.parents())
    
def parents(self):
    '''Return a list of this stub's parents.'''
    return self.full_name.split('.')[:-1]
</t>
<t tx="ekr.20160210134702.1">
def __init__(self, kind, name, parent=None, stack=None):
    '''Stub ctor. Equality depends only on full_name and kind.'''
    self.children = []
    self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
    self.kind = kind
    self.name = name
    self.out_list = []
    self.parent = parent
    self.stack = stack # StubTraverser.context_stack.
    if stack:
        assert stack[-1] == parent.name, (stack[-1], parent.name)
    if parent:
        assert isinstance(parent, Stub)
        parent.children.append(self)
</t>
<t tx="ekr.20160210141342.1">
def dump_dict(title, d):
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')</t>
<t tx="ekr.20160210141651.1">
def dump_list(title, aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')
</t>
<t tx="ekr.20160210143802.1">
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
<t tx="ekr.20160210144515.1"># To be DELETED (They exist in old_stubs, but not here)
# class Pattern(object):
    # def __init__(self, find_s: str, repl_s: str='') -&gt; None: ...
    # def __eq__(self, obj: Any) -&gt; bool: ...
    # def __ne__(self, obj: Any) -&gt; bool: ...
    # def __hash__(self) -&gt; int: ...
    # def __repr__(self) -&gt; str: ...
    # def is_balanced(self) -&gt; bool: ...
    # def is_regex(self) -&gt; Any: ...
        # #   0: return self.find_s.endswith('$')
        # # ? 0: return self.find_s.endswith(str)
new_s = '''\
def is_known_type(s: str) -&gt; Union[Any,bool]: ...
def main() -&gt; None: ...
def merge_types(a1: Any, a2: Any) -&gt; str: ...
def pdb(self) -&gt; None: ...
def reduce_numbers(aList: List[Any]) -&gt; List[Any]: ...
def reduce_types(aList: List[Any], name: str=None, trace: bool=False) -&gt; Any: ...

class AstFormatter:
    def format(self, node: Node) -&gt; Union[Any,str]: ...
    def visit(self, node: Node) -&gt; str: ...
    def do_ClassDef(self, node: Node) -&gt; str: ...
    def do_FunctionDef(self, node: Node) -&gt; str: ...
'''</t>
<t tx="ekr.20160210145128.1">&lt;&lt; imports &gt;&gt;
&lt;&lt; define s &gt;&gt;
@others
g = LeoGlobals() # Use the g available to the script.
st = StubTraverser(controller=g.NullObject())
d, root = st.parse_stub_file(s, root_name='&lt;root&gt;')
    # Root *is* used below.
if 0:
    print(st.trace_stubs(root, header='root'))
stub1 = Stub(kind='class', name='AstFormatter')
stub2 = Stub(kind='def', name='format', parent=stub1, stack=['AstFormatter'])
stub3 = Stub(kind='def', name='helper', parent = stub2, stack=['AstFormatter', 'format'])
# stub4 = Stub(kind='def', name='main')
for stub in (stub1, stub2, stub3,): # (stub1, stub2, stub3):
    found = st.find_stub(stub, root)
    id_found = found and id(found) or None
    if 0:
        print('found  %s =&gt; %9s %35s ==&gt; %s' % (id(stub), id_found, stub, found))
    found = st.find_parent_stub(stub, root)
    id_found = found and id(found) or None
    if 0:
        print('parent %s =&gt; %9s %35s ==&gt; %s' % (id(stub), id_found, stub, found))</t>
<t tx="ekr.20160210164250.1">s = '''\
def is_known_type(s: str) -&gt; Union[Any,bool]: ...
def main() -&gt; None: ...
def merge_types(a1: Any, a2: Any) -&gt; str: ...

class AstFormatter:
    def format(self, node: Node) -&gt; Union[Any,str]: ...
        def helper(self): -&gt; None
    def visit(self, node: Node) -&gt; str: ...
    def do_ClassDef(self, node: Node) -&gt; str: ...
    def do_FunctionDef(self, node: Node) -&gt; str: ...
'''</t>
<t tx="ekr.20160211045806.1">
def flatten_stubs(self, root):
    '''Return a flattened list of all stubs in root's tree.'''
    aList = [root]
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
    return aList
        
def flatten_stubs_helper(self, root, aList):
    '''Append all stubs in root's tree to aList.'''
    aList.append(root)
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
</t>
<t tx="ekr.20160211050346.1">&lt;&lt; imports &gt;&gt;
&lt;&lt; define s &gt;&gt;
@others
g = LeoGlobals() # Use the g available to the script.
st = StubTraverser(controller=g.NullObject())
d, root = st.parse_stub_file(s, root_name='&lt;root&gt;')
if 0:
    print(st.trace_stubs(root, header='root'))
aList = st.flatten_stubs(root)
assert aList
if 0:
    for i, stub in enumerate(aList):
        print('%2s %s' % (i, stub))
for stub in aList:
    found = st.find_stub(stub, root)
    assert found, stub
</t>
<t tx="ekr.20160211050346.10">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def do_ClassDef(self, node):
    result = []
    name = node.name # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if bases:
        result.append(self.indent('class %s(%s):\n' % (name, ','.join(bases))))
    else:
        result.append(self.indent('class %s:\n' % name))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.100">
# BoolOp(boolop op, expr* values)

def do_BoolOp(self, node): # Python 2.x only.
    '''StubFormatter.BoolOp visitor for 'and' and 'or'.'''
    trace = False or self.trace_reduce
    op = self.op_name(node.op)
    values = [self.visit(z).strip() for z in node.values]
    s = reduce_types(values, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160211050346.101">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    '''StubFormatter.Call visitor.'''
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    # Explicit pattern:
    if func in ('dict', 'list', 'set', 'tuple',):
        s = '%s[%s]' % (func.capitalize(), ', '.join(args))
    else:
        s = '%s(%s)' % (func, ', '.join(args))
    s = self.match_all(node, s)
    self.trace_visitor(node, 'call', s)
    return s
</t>
<t tx="ekr.20160211050346.102">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160211050346.103">
# Compare(expr left, cmpop* ops, expr* comparators)

def do_Compare(self, node):
    '''
    StubFormatter ast.Compare visitor for these ops:
    '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=', 'is', 'is not', 'in', 'not in',
    '''
    s = 'bool' # Correct regardless of arguments.
    ops = ','.join([self.op_name(z) for z in node.ops])
    self.trace_visitor(node, ops, s)
    return s
</t>
<t tx="ekr.20160211050346.104">
# If(expr test, stmt* body, stmt* orelse)

def do_IfExp(self, node):
    '''StubFormatterIfExp (ternary operator).'''
    trace = False or self.trace_reduce
    aList = [
        self.match_all(node, self.visit(node.body)),
        self.match_all(node, self.visit(node.orelse)),
    ]
    s = reduce_types(aList, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, 'if', s)
    return s
</t>
<t tx="ekr.20160211050346.105">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    '''StubFormatter.Subscript.'''
    s = '%s[%s]' % (
        self.visit(node.value),
        self.visit(node.slice))
    s = self.match_all(node, s)
    self.trace_visitor(node, '[]', s)
    return s
</t>
<t tx="ekr.20160211050346.106">
# UnaryOp(unaryop op, expr operand)

def do_UnaryOp(self, node):
    '''StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators.'''
    op = self.op_name(node.op)
    s = 'bool' if op.strip() is 'not' else self.visit(node.operand)
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160211050346.107">
def do_Return(self, node):
    '''
    StubFormatter ast.Return vsitor.
    Return only the return expression itself.
    '''
    s = AstFormatter.do_Return(self, node)
    assert s.startswith('return'), repr(s)
    return s[len('return'):].strip()
</t>
<t tx="ekr.20160211050346.108">

class Stub(object):
    '''
    A class representing all the generated stub for a class or def.
    stub.full_name should represent the complete context of a def.
    '''
    @others
</t>
<t tx="ekr.20160211050346.109">
def __init__(self, kind, name, parent=None, stack=None):
    '''Stub ctor. Equality depends only on full_name and kind.'''
    self.children = []
    self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
    self.kind = kind
    self.name = name
    self.out_list = []
    self.parent = parent
    self.stack = stack # StubTraverser.context_stack.
    if stack:
        assert stack[-1] == parent.name, (stack[-1], parent.name)
    if parent:
        assert isinstance(parent, Stub)
        parent.children.append(self)
</t>
<t tx="ekr.20160211050346.11">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def do_FunctionDef(self, node):
    '''Format a FunctionDef node.'''
    result = []
    if node.decorator_list:
        for z in node.decorator_list:
            result.append('@%s\n' % self.visit(z))
    name = node.name # Only a plain string is valid.
    args = self.visit(node.args) if node.args else ''
    result.append(self.indent('def %s(%s):\n' % (name, args)))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.110">
def __eq__(self, obj):
    '''
    Stub.__eq__. Return whether two stubs refer to the same method.
    Do *not* test parent links. That would interfere with --update logic.
    '''
    if isinstance(obj, Stub):
        return self.full_name == obj.full_name and self.kind == obj.kind
    else:
        return NotImplemented

def __ne__(self, obj):
    """Stub.__ne__"""
    return not self.__eq__(obj)
</t>
<t tx="ekr.20160211050346.111">
def __hash__(self):
    '''Stub.__hash__. Equality depends *only* on full_name and kind.'''
    return len(self.kind) + sum([ord(z) for z in self.full_name])</t>
<t tx="ekr.20160211050346.112">
def __repr__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s %s' % (id(self), self.full_name)
    
def __str__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s' % self.full_name
</t>
<t tx="ekr.20160211050346.113">
def level(self):
    '''Return the number of parents.'''
    return len(self.parents())
    
def parents(self):
    '''Return a list of this stub's parents.'''
    return self.full_name.split('.')[:-1]
</t>
<t tx="ekr.20160211050346.114">

class StubTraverser (ast.NodeVisitor):
    '''
    An ast.Node traverser class that outputs a stub for each class or def.
    Names of visitors must start with visit_. The order of traversal does
    not matter, because so few visitors do anything.
    '''
    @others
</t>
<t tx="ekr.20160211050346.115">
def __init__(self, controller):
    '''Ctor for StubTraverser class.'''
    self.controller = x = controller
        # A StandAloneMakeStubFile instance.
    # Internal state ivars...
    self.class_name_stack = []
    self.context_stack = []
    sf = StubFormatter(controller=controller,traverser=self)
    self.format = sf.format
    self.arg_format = AstArgFormatter().format
    self.level = 0
    self.output_file = None
    self.parent_stub = None
    self.raw_format = AstFormatter().format
    self.returns = []
    self.stubs_dict = {}
        # Keys are stub.full_name's.  Values are stubs.
    self.warn_list = []
    # Copies of controller ivars...
    self.output_fn = x.output_fn
    self.overwrite = x.overwrite
    self.prefix_lines = x.prefix_lines
    self.update_flag = x.update_flag
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
    self.warn = x.warn
    # Copies of controller patterns...
    self.def_patterns = x.def_patterns
    self.names_dict = x.names_dict
    self.general_patterns = x.general_patterns
    self.patterns_dict = x.patterns_dict
    </t>
<t tx="ekr.20160211050346.116">
def add_stub(self, d, stub):
    '''Add the stub to d, checking that it does not exist.'''
    trace = False ; verbose = False
    key = stub.full_name
    assert key
    if key in d:
        caller = g.callers(2).split(',')[1]
        g.trace('Ignoring duplicate entry for %s in %s' % (stub, caller))
    else:
        d [key] = stub
        if trace and verbose:
            caller = g.callers(2).split(',')[1]
            g.trace('%17s %s' % (caller, stub.full_name))
        elif trace:
            g.trace(stub.full_name)</t>
<t tx="ekr.20160211050346.117">
def indent(self, s):
    '''Return s, properly indented.'''
    # This version of indent *is* used.
    return '%s%s' % (' ' * 4 * self.level, s)

def out(self, s):
    '''Output the string to the console or the file.'''
    s = self.indent(s)
    if self.parent_stub:
        self.parent_stub.out_list.append(s)
    elif self.output_file:
        self.output_file.write(s+'\n')
    else:
        print(s)
</t>
<t tx="ekr.20160211050346.118">
def run(self, node):
    '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
    fn = self.output_fn
    dir_ = os.path.dirname(fn)
    if os.path.exists(fn) and not self.overwrite:
        print('file exists: %s' % fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        # Delayed output allows sorting.
        self.parent_stub = Stub(kind='root', name='&lt;new-stubs&gt;')
        for z in self.prefix_lines or []:
            self.parent_stub.out_list.append(z)
        self.visit(node)
            # Creates parent_stub.out_list.
        if self.update_flag:
            self.parent_stub = self.update(fn, new_root=self.parent_stub)
        if 1:
            self.output_file = open(fn, 'w')
            self.output_time_stamp()
            self.output_stubs(self.parent_stub)
            self.output_file.close()
            self.output_file = None
            self.parent_stub = None
        t2 = time.clock()
        print('wrote: %s in %4.2f sec' % (fn, t2 - t1))
    else:
        print('output directory not not found: %s' % dir_)
</t>
<t tx="ekr.20160211050346.119">
def output_stubs(self, stub):
    '''Output this stub and all its descendants.'''
    for s in stub.out_list or []:
        # Indentation must be present when an item is added to stub.out_list.
        if self.output_file:
            self.output_file.write(s.rstrip()+'\n')
        else:
            print(s)
    # Recursively print all children.
    for child in stub.children:
        self.output_stubs(child)
</t>
<t tx="ekr.20160211050346.12">
def do_Interactive(self, node):
    for z in node.body:
        self.visit(z)
</t>
<t tx="ekr.20160211050346.120">
def output_time_stamp(self):
    '''Put a time-stamp in the output file.'''
    if self.output_file:
        self.output_file.write('# make_stub_files: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160211050346.121">
def update(self, fn, new_root):
    '''
    Merge the new_root tree with the old_root tree in fn (a .pyi file).

    new_root is the root of the stub tree from the .py file.
    old_root (read below) is the root of stub tree from the .pyi file.
    
    Return old_root, or new_root if there are any errors.
    '''
    trace = False ; verbose = False
    s = self.get_stub_file(fn)
    if not s or not s.strip():
        return new_root
    if '\t' in s:
        # Tabs in stub files make it impossible to parse them reliably.
        g.trace('Can not update stub files containing tabs.')
        return new_root
    # Read old_root from the .pyi file.
    old_d, old_root = self.parse_stub_file(s, root_name='&lt;old-stubs&gt;')
    if old_root:
        # Merge new stubs into the old tree.
        if trace and verbose:
            print(self.trace_stubs(old_root, header='old_root'))
            print(self.trace_stubs(new_root, header='new_root'))
        print('***** updating stubs from %s *****' % fn)
        self.merge_stubs(self.stubs_dict.values(), old_root)
        if trace:
            print(self.trace_stubs(old_root, header='updated_root'))
        return old_root
    else:
        return new_root
</t>
<t tx="ekr.20160211050346.122">
def get_stub_file(self, fn):
    '''Read the stub file into s.'''
    if os.path.exists(fn):
        try:
            s = open(fn, 'r').read()
        except Exception:
            print('--update: error reading %s' % fn)
            s = None
        return s
    else:
        print('--update: not found: %s' % fn)
        return None
</t>
<t tx="ekr.20160211050346.123">
def parse_stub_file(self, s, root_name):
    '''
    Parse s, the contents of a stub file, into a tree of Stubs.
    
    Parse by hand, so that --update can be run with Python 2.
    '''
    trace = False
    assert '\t' not in s
    d = {}
    root = Stub(kind='root', name=root_name)
    indent_stack = [-1] # To prevent the root from being popped.
    stub_stack = [root]
    lines = []
    pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
    for line in g.splitLines(s):
        m = pat.match(line)
        if m:
            indent, kind, name, rest = (
                len(m.group(1)), m.group(2), m.group(3), m.group(4))
            old_indent = indent_stack[-1]
            # Terminate any previous lines.
            old_stub = stub_stack[-1]
            old_stub.out_list.extend(lines)
            if trace:
                for s in lines:
                    g.trace('  '+s.rstrip())
            lines = [line]
            # Adjust the stacks.
            if indent == old_indent:
                stub_stack.pop()
            elif indent &gt; old_indent:
                indent_stack.append(indent)
            else: # indent &lt; old_indent
                # The indent_stack can't underflow because
                # indent &gt;= 0 and indent_stack[0] &lt; 0
                assert indent &gt;= 0
                while indent &lt;= indent_stack[-1]:
                    indent_stack.pop()
                    old_stub = stub_stack.pop()
                    assert old_stub != root
                indent_stack.append(indent)
            # Create and push the new stub *after* adjusting the stacks.
            assert stub_stack
            parent = stub_stack[-1]
            stack = [z.name for z in stub_stack[1:]]
            parent = stub_stack[-1]
            stub = Stub(kind, name, parent, stack)
            self.add_stub(d, stub)
            stub_stack.append(stub)
            if trace:
                g.trace('%s%5s %s %s' % (' '*indent, kind, name, rest))
        else:
            parent = stub_stack[-1]
            lines.append(line)
    # Terminate the last stub.
    old_stub = stub_stack[-1]
    old_stub.out_list.extend(lines)
    if trace:
        for s in lines:
            g.trace('  '+s.rstrip())
    return d, root
</t>
<t tx="ekr.20160211050346.124">
def merge_stubs(self, new_stubs, old_root):
    '''
    Merge the new_stubs *list* into the old_root *tree*.
    - new_stubs is a list of Stubs from the .py file.
    - old_root is the root of the tree of Stubs from the .pyi file.
    '''
    trace = True
    # Part 1: Delete old stubs.
    # Remove all old stubs that do *not* exist in the new tree.
    aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
    
    # Part 2: Insert new stubs.
    # Remove all new stubs that exist in the old tree.
    aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
    # Order the new stubs so that parents are created before children.
    aList = self.sort_stubs_by_hierarchy(aList)
    for stub in aList:
        if trace: g.trace('inserting', stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.append(stub)
        assert self.find_stub(stub, old_root), stub</t>
<t tx="ekr.20160211050346.125">
def flatten_stubs(self, root):
    '''Return a flattened list of all stubs in root's tree.'''
    aList = [root]
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
    return aList
        
def flatten_stubs_helper(self, root, aList):
    '''Append all stubs in root's tree to aList.'''
    aList.append(root)
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
</t>
<t tx="ekr.20160211050346.126">
def find_parent_stub(self, stub, root):
    '''Return stub's parent **in root's tree**.'''
    return self.find_stub(stub.parent, root) if stub.parent else None
</t>
<t tx="ekr.20160211050346.127">
def find_stub(self, stub, root):
    '''Return the stub **in root's tree** that matches stub.'''
    if stub == root: # Must use Stub.__eq__!
        return root # not stub!
    for child in root.children:
        stub2 = self.find_stub(stub, child)
        if stub2: return stub2
    return None
</t>
<t tx="ekr.20160211050346.128">
def sort_stubs_by_hierarchy(self, stubs1):
    '''
    Sort the list of Stubs so that parents appear before all their
    descendants.
    '''
    stubs, result = stubs1[:], []
    for i in range(50):
        if stubs:
            # Add all stubs with i parents to the results.
            found = [z for z in stubs if z.level() == i]
            result.extend(found)
            for z in found:
                stubs.remove(z)
        else:
            return result
    g.trace('can not happen: unbounded stub levels.')
    return [] # Abort the merge.
</t>
<t tx="ekr.20160211050346.129">
def trace_stubs(self, stub, aList=None, header=None, level=-1):
    '''Return a trace of the given stub and all its descendants.'''
    indent = ' '*4*max(0,level)
    if level == -1:
        aList = ['===== %s...\n' % (header) if header else '']
    for s in stub.out_list:
        aList.append('%s%s' % (indent, s.rstrip()))
    for child in stub.children:
        self.trace_stubs(child, level=level+1, aList=aList)
    if level == -1:
        return '\n'.join(aList) + '\n'
</t>
<t tx="ekr.20160211050346.13">
def do_Module(self, node):
    assert 'body' in node._fields
    result = ''.join([self.visit(z) for z in node.body])
    return result # 'module:\n%s' % (result)
</t>
<t tx="ekr.20160211050346.130">
# ClassDef(identifier name, expr* bases, stmt* body, expr* decorator_list)

def visit_ClassDef(self, node):
    
    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('class', node.name,old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.class_name_stack.append(node.name)
    self.context_stack.append(node.name)
    # Format...
    if not node.name.startswith('_'):
        if node.bases:
            s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
        else:
            s = ''
        self.out('class %s%s:' % (node.name, s))
    # Visit...
    self.level += 1
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.class_name_stack.pop()
    self.level -= 1
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160211050346.131">
# FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)

def visit_FunctionDef(self, node):

    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('def', node.name, old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.returns = []
    self.level += 1
    self.context_stack.append(node.name)
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.level -= 1
    # Format *after* traversing
    self.out('def %s(%s) -&gt; %s' % (
        node.name,
        self.format_arguments(node.args),
        self.format_returns(node)))
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160211050346.132">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def format_arguments(self, node):
    '''
    Format the arguments node.
    Similar to AstFormat.do_arguments, but it is not a visitor!
    '''
    assert isinstance(node,ast.arguments), node
    args = [self.raw_format(z) for z in node.args]
    defaults = [self.raw_format(z) for z in node.defaults]
    # Assign default values to the last args.
    result = []
    n_plain = len(args) - len(defaults)
    # pylint: disable=consider-using-enumerate
    for i in range(len(args)):
        s = self.munge_arg(args[i])
        if i &lt; n_plain:
            result.append(s)
        else:
            result.append('%s=%s' % (s, defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name: result.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name: result.append('**' + name)
    return ', '.join(result)
</t>
<t tx="ekr.20160211050346.133">
def munge_arg(self, s):
    '''Add an annotation for s if possible.'''
    if s == 'self':
        return s
    for pattern in self.general_patterns:
        if pattern.match_entire_string(s):
            return '%s: %s' % (s, pattern.repl_s)
    if self.warn and s not in self.warn_list:
        self.warn_list.append(s)
        print('no annotation for %s' % s)
    return s + ': Any'
</t>
<t tx="ekr.20160211050346.134">
def format_returns(self, node):
    '''
    Calculate the return type:
    - Return None if there are no return statements.
    - Patterns in [Def Name Patterns] override all other patterns.
    - Otherwise, return a list of return values.
    '''
    trace = False
    name = self.get_def_name(node)
    raw = [self.raw_format(z) for z in self.returns]
    r = [self.format(z) for z in self.returns]
        # Allow StubFormatter.do_Return to do the hack.
    # Step 1: Return None if there are no return statements.
    if trace and self.returns:
        g.trace('name: %s r:\n%s' % (name, r))
    if not [z for z in self.returns if z.value != None]:
        return 'None: ...'
    # Step 2: [Def Name Patterns] override all other patterns.
    for pattern in self.def_patterns:
        found, s = pattern.match(name)
        if found:
            if trace:
                g.trace('*name pattern %s: %s -&gt; %s' % (
                    pattern.find_s, name, s))
            return s + ': ...'
    # Step 3: remove recursive calls.
    raw, r = self.remove_recursive_calls(name, raw, r)
    # Step 4: Calculate return types.
    return self.format_return_expressions(name, raw, r)
</t>
<t tx="ekr.20160211050346.135">
def format_return_expressions(self, name, raw_returns, reduced_returns):
    '''
    aList is a list of maximally reduced return expressions.
    For each expression e in Alist:
    - If e is a single known type, add e to the result.
    - Otherwise, add Any # e to the result.
    Return the properly indented result.
    '''
    assert len(raw_returns) == len(reduced_returns)
    lws =  '\n' + ' '*4
    n = len(raw_returns)
    known = all([is_known_type(e) for e in reduced_returns])
    if not known or self.verbose:
        # First, generate the return lines.
        aList = []
        for i in range(n):
            e, raw = reduced_returns[i], raw_returns[i]
            known = ' ' if is_known_type(e) else '?'
            aList.append('# %s %s: %s' % (' ', i, raw))
            aList.append('# %s %s: return %s' % (known, i, e))
        results = ''.join([lws + self.indent(z) for z in aList])
        # Put the return lines in their proper places.
        if known:
            s = reduce_types(reduced_returns, name, self.trace_reduce)
                # newlines=True,        
            return s + ': ...' + results
        else:
            return 'Any: ...' + results
    else:
        s = reduce_types(reduced_returns, name, self.trace_reduce)
                # newlines=True,       
        return s + ': ...'
</t>
<t tx="ekr.20160211050346.136">
def get_def_name(self, node):
    '''Return the representaion of a function or method name.'''
    if self.class_name_stack:
        name = '%s.%s' % (self.class_name_stack[-1], node.name)
        # All ctors should return None
        if node.name == '__init__':
            name = 'None'
    else:
        name = node.name
    return name
</t>
<t tx="ekr.20160211050346.137">
def remove_recursive_calls(self, name, raw, reduced):
    '''Remove any recursive calls to name from both lists.'''
    # At present, this works *only* if the return is nothing but the recursive call.
    assert len(raw) == len(reduced)
    pattern = Pattern('%s(*)' % name)
    n = len(reduced)
    raw_result, reduced_result = [], []
    for i in range(n):
        if pattern.match_entire_string(reduced[i]):
            g.trace('****', name, pattern, reduced[i])
        else:
            raw_result.append(raw[i])
            reduced_result.append(reduced[i])
    return raw_result, reduced_result</t>
<t tx="ekr.20160211050346.138">
def visit_Return(self, node):

    self.returns.append(node)
        # New: return the entire node, not node.value.
</t>
<t tx="ekr.20160211050346.14">
def do_Lambda(self, node):
    return self.indent('lambda %s: %s' % (
        self.visit(node.args),
        self.visit(node.body)))
</t>
<t tx="ekr.20160211050346.15">
# Expressions...
</t>
<t tx="ekr.20160211050346.16">
def do_Expr(self, node):
    '''An outer expression: must be indented.'''
    return self.indent('%s\n' % self.visit(node.value))
</t>
<t tx="ekr.20160211050346.17">
def do_Expression(self, node):
    '''An inner expression: do not indent.'''
    return '%s\n' % self.visit(node.body)
</t>
<t tx="ekr.20160211050346.18">
def do_GeneratorExp(self, node):
    elt = self.visit(node.elt) or ''
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '&lt;gen %s for %s&gt;' % (elt, ','.join(gens))
</t>
<t tx="ekr.20160211050346.19">
def do_AugLoad(self, node):
    return 'AugLoad'

def do_Del(self, node):
    return 'Del'

def do_Load(self, node):
    return 'Load'

def do_Param(self, node):
    return 'Param'

def do_Store(self, node):
    return 'Store'
</t>
<t tx="ekr.20160211050346.2">import ast
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
import re
import sys
import time
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3
</t>
<t tx="ekr.20160211050346.20">
# Operands...
</t>
<t tx="ekr.20160211050346.21">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def do_arguments(self, node):
    '''Format the arguments node.'''
    kind = self.kind(node)
    assert kind == 'arguments', kind
    args = [self.visit(z) for z in node.args]
    defaults = [self.visit(z) for z in node.defaults]
    # Assign default values to the last args.
    args2 = []
    n_plain = len(args) - len(defaults)
    for i in range(len(args)):
        if i &lt; n_plain:
            args2.append(args[i])
        else:
            args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name: args2.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name: args2.append('**' + name)
    return ','.join(args2)
</t>
<t tx="ekr.20160211050346.22">
# Python 3:
# arg = (identifier arg, expr? annotation)

def do_arg(self, node):
    if node.annotation:
        return self.visit(node.annotation)
    else:
        return ''
</t>
<t tx="ekr.20160211050346.23">
# Attribute(expr value, identifier attr, expr_context ctx)

def do_Attribute(self, node):
    return '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
</t>
<t tx="ekr.20160211050346.24">
def do_Bytes(self, node): # Python 3.x only.
    return str(node.s)
</t>
<t tx="ekr.20160211050346.25">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    return '%s(%s)' % (func, ','.join(args))
</t>
<t tx="ekr.20160211050346.26">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160211050346.27">
def do_comprehension(self, node):
    result = []
    name = self.visit(node.target) # A name.
    it = self.visit(node.iter) # An attribute.
    result.append('%s in %s' % (name, it))
    ifs = [self.visit(z) for z in node.ifs]
    if ifs:
        result.append(' if %s' % (''.join(ifs)))
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.28">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        # result.append('{\n' if keys else '{')
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
        # result.append(',\n'.join(items))
        # result.append('\n}' if keys else '}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.29">
def do_Ellipsis(self, node):
    return '...'
</t>
<t tx="ekr.20160211050346.3">s = '''\
def is_known_type(s: str) -&gt; Union[Any,bool]: ...
def main() -&gt; None: ...
def merge_types(a1: Any, a2: Any) -&gt; str: ...

class AstFormatter:
    def format(self, node: Node) -&gt; Union[Any,str]: ...
        def helper(self): -&gt; None
    def visit(self, node: Node) -&gt; str: ...
    def do_ClassDef(self, node: Node) -&gt; str: ...
    def do_FunctionDef(self, node: Node) -&gt; str: ...
'''</t>
<t tx="ekr.20160211050346.30">
def do_ExtSlice(self, node):
    return ':'.join([self.visit(z) for z in node.dims])
</t>
<t tx="ekr.20160211050346.31">
def do_Index(self, node):
    return self.visit(node.value)
</t>
<t tx="ekr.20160211050346.32">
def do_List(self, node):
    # Not used: list context.
    # self.visit(node.ctx)
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    return '[%s]' % ','.join(elts)
</t>
<t tx="ekr.20160211050346.33">
def do_ListComp(self, node):
    elt = self.visit(node.elt)
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '%s for %s' % (elt, ''.join(gens))
</t>
<t tx="ekr.20160211050346.34">
def do_Name(self, node):
    return node.id
</t>
<t tx="ekr.20160211050346.35">
def do_Num(self, node):
    return repr(node.n)
</t>
<t tx="ekr.20160211050346.36">
# Python 2.x only

def do_Repr(self, node):
    return 'repr(%s)' % self.visit(node.value)
</t>
<t tx="ekr.20160211050346.37">
def do_Slice(self, node):
    lower, upper, step = '', '', ''
    if getattr(node, 'lower', None) is not None:
        lower = self.visit(node.lower)
    if getattr(node, 'upper', None) is not None:
        upper = self.visit(node.upper)
    if getattr(node, 'step', None) is not None:
        step = self.visit(node.step)
    if step:
        return '%s:%s:%s' % (lower, upper, step)
    else:
        return '%s:%s' % (lower, upper)
</t>
<t tx="ekr.20160211050346.38">
def do_Str(self, node):
    '''This represents a string constant.'''
    return repr(node.s)
</t>
<t tx="ekr.20160211050346.39">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    value = self.visit(node.value)
    the_slice = self.visit(node.slice)
    return '%s[%s]' % (value, the_slice)
</t>
<t tx="ekr.20160211050346.4"></t>
<t tx="ekr.20160211050346.40">
def do_Tuple(self, node):
    elts = [self.visit(z) for z in node.elts]
    return '(%s)' % ', '.join(elts)
</t>
<t tx="ekr.20160211050346.41">
# Operators...
</t>
<t tx="ekr.20160211050346.42">
def do_BinOp(self, node):
    return '%s%s%s' % (
        self.visit(node.left),
        self.op_name(node.op),
        self.visit(node.right))
</t>
<t tx="ekr.20160211050346.43">
def do_BoolOp(self, node):
    op_name = self.op_name(node.op)
    values = [self.visit(z) for z in node.values]
    return op_name.join(values)
</t>
<t tx="ekr.20160211050346.44">
def do_Compare(self, node):
    result = []
    lt = self.visit(node.left)
    ops = [self.op_name(z) for z in node.ops]
    comps = [self.visit(z) for z in node.comparators]
    result.append(lt)
    if len(ops) == len(comps):
        for i in range(len(ops)):
            result.append('%s%s' % (ops[i], comps[i]))
    else:
        print('can not happen: ops', repr(ops), 'comparators', repr(comps))
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.45">
def do_UnaryOp(self, node):
    return '%s%s' % (
        self.op_name(node.op),
        self.visit(node.operand))
</t>
<t tx="ekr.20160211050346.46">
def do_IfExp(self, node):
    return '%s if %s else %s ' % (
        self.visit(node.body),
        self.visit(node.test),
        self.visit(node.orelse))
</t>
<t tx="ekr.20160211050346.47">
# Statements...
</t>
<t tx="ekr.20160211050346.48">
def do_Assert(self, node):
    test = self.visit(node.test)
    if getattr(node, 'msg', None):
        message = self.visit(node.msg)
        return self.indent('assert %s, %s' % (test, message))
    else:
        return self.indent('assert %s' % test)
</t>
<t tx="ekr.20160211050346.49">
def do_Assign(self, node):
    return self.indent('%s=%s\n' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value)))
</t>
<t tx="ekr.20160211050346.5">

class AstFormatter:
    '''
    A class to recreate source code from an AST.
    
    This does not have to be perfect, but it should be close.
    '''
    # pylint: disable=consider-using-enumerate
    @others
</t>
<t tx="ekr.20160211050346.50">
def do_AugAssign(self, node):
    return self.indent('%s%s=%s\n' % (
        self.visit(node.target),
        self.op_name(node.op), # Bug fix: 2013/03/08.
        self.visit(node.value)))
</t>
<t tx="ekr.20160211050346.51">
def do_Break(self, node):
    return self.indent('break\n')
</t>
<t tx="ekr.20160211050346.52">
def do_Continue(self, node):
    return self.indent('continue\n')
</t>
<t tx="ekr.20160211050346.53">
def do_Delete(self, node):
    targets = [self.visit(z) for z in node.targets]
    return self.indent('del %s\n' % ','.join(targets))
</t>
<t tx="ekr.20160211050346.54">
def do_ExceptHandler(self, node):
    result = []
    result.append(self.indent('except'))
    if getattr(node, 'type', None):
        result.append(' %s' % self.visit(node.type))
    if getattr(node, 'name', None):
        if isinstance(node.name, ast.AST):
            result.append(' as %s' % self.visit(node.name))
        else:
            result.append(' as %s' % node.name) # Python 3.x.
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.55">
# Python 2.x only

def do_Exec(self, node):
    body = self.visit(node.body)
    args = [] # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        return self.indent('exec %s in %s\n' % (
            body, ','.join(args)))
    else:
        return self.indent('exec %s\n' % (body))
</t>
<t tx="ekr.20160211050346.56">
def do_For(self, node):
    result = []
    result.append(self.indent('for %s in %s:\n' % (
        self.visit(node.target),
        self.visit(node.iter))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.57">
def do_Global(self, node):
    return self.indent('global %s\n' % (
        ','.join(node.names)))
</t>
<t tx="ekr.20160211050346.58">
def do_If(self, node):
    result = []
    result.append(self.indent('if %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.59">
def do_Import(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('import %s\n' % (
        ','.join(names)))
</t>
<t tx="ekr.20160211050346.6">
# Entries...
</t>
<t tx="ekr.20160211050346.60">
def get_import_names(self, node):
    '''Return a list of the the full file names in the import statement.'''
    result = []
    for ast2 in node.names:
        if self.kind(ast2) == 'alias':
            data = ast2.name, ast2.asname
            result.append(data)
        else:
            print('unsupported kind in Import.names list', self.kind(ast2))
    return result
</t>
<t tx="ekr.20160211050346.61">
def do_ImportFrom(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('from %s import %s\n' % (
        node.module,
        ','.join(names)))
</t>
<t tx="ekr.20160211050346.62">
def do_Pass(self, node):
    return self.indent('pass\n')
</t>
<t tx="ekr.20160211050346.63">
# Python 2.x only

def do_Print(self, node):
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None):
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None):
        vals.append('nl=%s' % node.nl)
    return self.indent('print(%s)\n' % (
        ','.join(vals)))
</t>
<t tx="ekr.20160211050346.64">
def do_Raise(self, node):
    args = []
    for attr in ('type', 'inst', 'tback'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    if args:
        return self.indent('raise %s\n' % (
            ','.join(args)))
    else:
        return self.indent('raise\n')
</t>
<t tx="ekr.20160211050346.65">
def do_Return(self, node):
    if node.value:
        return self.indent('return %s\n' % (
            self.visit(node.value)))
    else:
        return self.indent('return\n')
</t>
<t tx="ekr.20160211050346.66">
def do_TryExcept(self, node):
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
<t tx="ekr.20160211050346.67">
def do_TryFinally(self, node):
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
<t tx="ekr.20160211050346.68">
def do_While(self, node):
    result = []
    result.append(self.indent('while %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.69">
def do_With(self, node):
    result = []
    result.append(self.indent('with '))
    if hasattr(node, 'context_expression'):
        result.append(self.visit(node.context_expresssion))
    vars_list = []
    if hasattr(node, 'optional_vars'):
        try:
            for z in node.optional_vars:
                vars_list.append(self.visit(z))
        except TypeError: # Not iterable.
            vars_list.append(self.visit(node.optional_vars))
    result.append(','.join(vars_list))
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append('\n')
    return ''.join(result)
</t>
<t tx="ekr.20160211050346.7">
def format(self, node):
    '''Format the node (or list of nodes) and its descendants.'''
    self.level = 0
    val = self.visit(node)
    return val and val.strip() or ''
</t>
<t tx="ekr.20160211050346.70">
def do_Yield(self, node):
    if getattr(node, 'value', None):
        return self.indent('yield %s\n' % (
            self.visit(node.value)))
    else:
        return self.indent('yield\n')
</t>
<t tx="ekr.20160211050346.71">
# Utils...
</t>
<t tx="ekr.20160211050346.72">
def kind(self, node):
    '''Return the name of node's class.'''
    return node.__class__.__name__
</t>
<t tx="ekr.20160211050346.73">
def indent(self, s):
    return '%s%s' % (' ' * 4 * self.level, s)
</t>
<t tx="ekr.20160211050346.74">
def op_name (self,node,strict=True):
    '''Return the print name of an operator node.'''
    d = {
        # Binary operators. 
        'Add':       '+',
        'BitAnd':    '&amp;',
        'BitOr':     '|',
        'BitXor':    '^',
        'Div':       '/',
        'FloorDiv':  '//',
        'LShift':    '&lt;&lt;',
        'Mod':       '%',
        'Mult':      '*',
        'Pow':       '**',
        'RShift':    '&gt;&gt;',
        'Sub':       '-',
        # Boolean operators.
        'And':   ' and ',
        'Or':    ' or ',
        # Comparison operators
        'Eq':    '==',
        'Gt':    '&gt;',
        'GtE':   '&gt;=',
        'In':    ' in ',
        'Is':    ' is ',
        'IsNot': ' is not ',
        'Lt':    '&lt;',
        'LtE':   '&lt;=',
        'NotEq': '!=',
        'NotIn': ' not in ',
        # Context operators.
        'AugLoad':  '&lt;AugLoad&gt;',
        'AugStore': '&lt;AugStore&gt;',
        'Del':      '&lt;Del&gt;',
        'Load':     '&lt;Load&gt;',
        'Param':    '&lt;Param&gt;',
        'Store':    '&lt;Store&gt;',
        # Unary operators.
        'Invert':   '~',
        'Not':      ' not ',
        'UAdd':     '+',
        'USub':     '-',
    }
    name = d.get(self.kind(node),'&lt;%s&gt;' % node.__class__.__name__)
    if strict: assert name,self.kind(node)
    return name
</t>
<t tx="ekr.20160211050346.75">

class AstArgFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''
    @others</t>
<t tx="ekr.20160211050346.76">
# Return generic markers to allow better pattern matches.

def do_BoolOp(self, node): # Python 2.x only.
    return 'bool'

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Name(self, node):
    return 'bool' if node.id in ('True', 'False') else node.id

def do_Num(self, node):
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160211050346.77">

class LeoGlobals:
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''
    @others
</t>
<t tx="ekr.20160211050346.78">
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
<t tx="ekr.20160211050346.79">
def _callerName(self, n=1, files=False):
    # print('_callerName: %s %s' % (n,files))
    try: # get the function name from the call stack.
        f1 = sys._getframe(n) # The stack frame, n levels up.
        code1 = f1.f_code # The code object
        name = code1.co_name
        if name == '__init__':
            name = '__init__(%s,line %s)' % (
                self.shortFileName(code1.co_filename), code1.co_firstlineno)
        if files:
            return '%s:%s' % (self.shortFileName(code1.co_filename), name)
        else:
            return name # The code name
    except ValueError:
        # print('g._callerName: ValueError',n)
        return '' # The stack is not deep enough.
    except Exception:
        # es_exception()
        return '' # "&lt;no caller name&gt;"
</t>
<t tx="ekr.20160211050346.8">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    if isinstance(node, (list, tuple)):
        return ','.join([self.visit(z) for z in node])
    elif node is None:
        return 'None'
    else:
        assert isinstance(node, ast.AST), node.__class__.__name__
        method_name = 'do_' + node.__class__.__name__
        method = getattr(self, method_name)
        s = method(node)
        # pylint: disable=unidiomatic-typecheck
        assert type(s) == type('abc'), type(s)
        return s
</t>
<t tx="ekr.20160211050346.80">
def callers(self, n=4, count=0, excludeCaller=True, files=False):
    '''Return a list containing the callers of the function that called g.callerList.

    If the excludeCaller keyword is True (the default), g.callers is not on the list.

    If the files keyword argument is True, filenames are included in the list.
    '''
    # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
    # The jython stack often has less than 8 entries,
    # so we must be careful to call g._callerName with smaller values of i first.
    result = []
    i = 3 if excludeCaller else 2
    while 1:
        s = self._callerName(i, files=files)
        # print(i,s)
        if s:
            result.append(s)
        if not s or len(result) &gt;= n: break
        i += 1
    result.reverse()
    if count &gt; 0: result = result[: count]
    sep = '\n' if files else ','
    return sep.join(result)
</t>
<t tx="ekr.20160211050346.81">
def cls(self):
    '''Clear the screen.'''
    if sys.platform.lower().startswith('win'):
        os.system('cls')
</t>
<t tx="ekr.20160211050346.82">
def pdb(self):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160211050346.83">
def shortFileName(self,fileName, n=None):
    if n is None or n &lt; 1:
        return os.path.basename(fileName)
    else:
        return '/'.join(fileName.replace('\\', '/').split('/')[-n:])
</t>
<t tx="ekr.20160211050346.84">
def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
</t>
<t tx="ekr.20160211050346.85">
def trace(self, *args, **keys):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.trace(caller_level=2, *args, **keys)
    except ImportError:
        print(args, keys)
</t>
<t tx="ekr.20160211050346.86">

class StubFormatter (AstFormatter):
    '''
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    '''
    @others
</t>
<t tx="ekr.20160211050346.87">
def __init__(self, controller, traverser):
    '''Ctor for StubFormatter class.'''
    self.controller = x = controller
    self.traverser = traverser
        # 2016/02/07: to give the formatter access to the class_stack.
    self.def_patterns = x.def_patterns
    self.general_patterns = x.general_patterns
    self.names_dict = x.names_dict
    self.patterns_dict = x.patterns_dict
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
</t>
<t tx="ekr.20160211050346.88">
matched_d = {}

def match_all(self, node, s):
    '''Match all the patterns for the given node.'''
    trace = False or self.trace_matches
    d = self.matched_d
    name = node.__class__.__name__
    for pattern in self.patterns_dict.get(name, []):
        s1 = s
        found, s = pattern.match(s,trace=trace)
        if found:
            if trace:
                aList = d.get(name, [])
                if pattern not in aList:
                    aList.append(pattern)
                    d [name] = aList
                    g.trace('%46s %s' % (name, pattern))
            break
    return s</t>
<t tx="ekr.20160211050346.89">
def visit(self, node):
    '''StubFormatter.visit: supports --verbose tracing.'''
    s = AstFormatter.visit(self, node)
    # if self.verbose:
        # g.trace('%12s %s' % (node.__class__.__name__,s))
    return s</t>
<t tx="ekr.20160211050346.9">
# Contexts...
</t>
<t tx="ekr.20160211050346.90">
def trace_visitor(self, node, op, s):
    '''Trace node's visitor.'''
    if self.trace_visitors:
        caller = g.callers(2).split(',')[1]
        s1 = AstFormatter().format(node).strip()
        print('%12s %6s: %s ==&gt; %s' % (caller, op.strip(), s1, s))
</t>
<t tx="ekr.20160211050346.91">
# StubFormatter visitors for operands...</t>
<t tx="ekr.20160211050346.92">
# Attribute(expr value, identifier attr, expr_context ctx)

attrs_seen = []

def do_Attribute(self, node):
    '''StubFormatter.do_Attribute.'''
    trace = False
    s = '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
    s2 = self.names_dict.get(s)
    if trace and s2 and s2 not in self.attrs_seen:
        self.attrs_seen.append(s2)
        g.trace(s, '==&gt;', s2)
    return s2 or s
</t>
<t tx="ekr.20160211050346.93">
# Return generic markers to allow better pattern matches.

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Num(self, node):
    # make_patterns_dict treats 'number' as a special case.
    # return self.names_dict.get('number', 'number')
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160211050346.94">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    # return ''.join(result)
    return 'Dict[%s]' % ''.join(result)
</t>
<t tx="ekr.20160211050346.95">
def do_List(self, node):
    '''StubFormatter.List.'''
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    # g.trace('=====',elts)
    return 'List[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160211050346.96">
seen_names = []

def do_Name(self, node):
    '''StubFormatter ast.Name visitor.'''
    trace = False
    d = self.names_dict
    name = d.get(node.id, node.id)
    s = 'bool' if name in ('True', 'False') else name
    if trace and node.id not in self.seen_names:
        self.seen_names.append(node.id)
        if d.get(node.id):
            g.trace(node.id, '==&gt;', d.get(node.id))
        elif node.id == 'aList':
            g.trace('**not found**', node.id)
    return s
</t>
<t tx="ekr.20160211050346.97">
def do_Tuple(self, node):
    '''StubFormatter.Tuple.'''
    elts = [self.visit(z) for z in node.elts]
    if 1:
        return 'Tuple[%s]' % ', '.join(elts)
    else:
        s = '(%s)' % ', '.join(elts)
        return self.match_all(node, s)
    # return 'Tuple[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160211050346.98">
# StubFormatter visitors for operators...
</t>
<t tx="ekr.20160211050346.99">
# BinOp(expr left, operator op, expr right)

def do_BinOp(self, node):
    '''StubFormatter.BinOp visitor.'''
    trace = False or self.trace_reduce
    numbers = ['number', 'complex', 'float', 'long', 'int',]
    op = self.op_name(node.op)
    lhs = self.visit(node.left)
    rhs = self.visit(node.right)
    if op.strip() in ('is', 'is not', 'in', 'not in'):
        s = 'bool'
    elif lhs == rhs:
        s = lhs
            # Perhaps not always right,
            # but it is correct for Tuple, List, Dict.
    elif lhs in numbers and rhs in numbers:
        s = reduce_types([lhs, rhs], trace=trace)
            # reduce_numbers would be wrong: it returns a list.
    elif lhs == 'str' and op in '%*':
        s = 'str'
    else:
        if trace and lhs == 'str':
            g.trace('***** unknown string op', lhs, op, rhs)
        # Fall back to the base-class behavior.
        s = '%s%s%s' % (
            self.visit(node.left),
            op,
            self.visit(node.right))
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160211060949.1">
def check_delete(self, new_stubs, old_root, new_root, trace):
    '''Return a list of nodes that can be deleted.'''
    old_stubs = self.flatten_stubs(old_root)
    old_stubs.remove(old_root)
    aList = [z for z in old_stubs if z not in new_stubs]
    if trace:
        dump_list('old_stubs', old_stubs)
        dump_list('new_stubs', new_stubs)
        dump_list('to-be-deleted stubs', aList)
    delete_list = []
    # Check that all parents of to-be-delete nodes will be deleted.
    for z in aList:
        z1 = z
        for i in range(20):
            z = z.parent
            if not z:
                g.trace('can not append: new root not found', z)
                break
            elif z == old_root:
                # if trace: g.trace('can delete', z1)
                delete_list.append(z1)
                break
            elif z not in aList:
                g.trace("can not delete %s because of %s" % (z1, z))
                break
        else:
            g.trace('can not happen: parent loop')
    if trace:
        dump_list('delete_list', delete_list)
    return delete_list</t>
<t tx="ekr.20160211063121.1">@language rest

Views contain clones of nodes related to a particular topic.

*Important*: often a single node and its children contains all the code
             relevenat to a particular subject. Of particular note:
    
    - st.run and its helpers handles all aspects of --update.
    - The children of sf.Operands and sf.Operators form the base of type computations.
    - st.format_returns &amp; helpers produce comments for return expressions.

*Note*: The numbered children of this node are arranged in approximate execution order.

*Note*: Headlines do not appear in make_stub_files.py.
        As a result, they are a good place for side comments.

@language python
</t>
<t tx="ekr.20160211063226.1"># Much of the StandAloneMakeStubFile class deals with startup.</t>
<t tx="ekr.20160211063238.1"></t>
<t tx="ekr.20160211063252.1"># Much of the StubFormatter class handles type computations,
# especially the sf.Operators visitors.</t>
<t tx="ekr.20160211074737.1"></t>
<t tx="ekr.20160211074825.1"></t>
<t tx="ekr.20160211110739.1">@language rest
@wrap

This is the readme file for `make_stub_files.py`. This file explains what
the script does, how it works and why it is important. After a brief
overview, a step-by-step section will get you started. Full source code for
the script is in its [github repository]
(https://github.com/edreamleo/make-stub-files). This script is in the
public domain.

@others
</t>
<t tx="ekr.20160211110807.1">
### Overview

This script makes a stub (.pyi) file in the **output directory** for each
**source file** listed on the command line (wildcard file names are
supported). This script never creates directories automatically, nor does
it overwrite stub files unless the --overwrite command-line option is in
effect.

GvR says,
&gt; We actually do have a [stub generator](https://github.com/JukkaL/mypy/blob/master/mypy/stubgen.py)
&gt; as part of mypy now (it has a few options) but yours has the advantage of
&gt; providing a way to tune the generated signatures...This allows for a nice
&gt; iterative way of developing stubs.

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

    i: int
    s: str
    
the script produces the stub:

    def foo(i: int, s: str) --&gt; str: ...

The `make_stub_files` script eliminates much of the drudgery of creating
[python stub (.pyi) files]
(https://www.python.org/dev/peps/pep-0484/#stub-files)
from python source files. This script should encourage more people to use mypy. Stub files can be used by people who use Python 2.x code bases.

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

The --config command-line option specifies the full path to the optional
configuration file. The configuration file uses the .ini format. It has
several configuration sections, all optional.

</t>
<t tx="ekr.20160211110810.3">
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
</t>
<t tx="ekr.20160211110811.1">
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
<t tx="ekr.20160214043351.1">
def make_optional(self,r):
    
    if r and 'None' in r:
        r = [z for z in r if z != 'None']
        r = self.show('Optional[%s]' % r[0]) if r else self.show('None')
    return r</t>
<t tx="ekr.20160214044429.1">

class ReduceTypes:
    '''
    A helper class for the top-level reduce_types function.
    
    This class reduces a list of type hints to a string containing the
    reduction of all types in the list.
    '''
    @others
</t>
<t tx="ekr.20160214044444.1">
def __init__(self, aList=None, name=None, trace=False):
    '''Ctor for ReduceTypes class.'''
    self.aList = aList
    self.name = name
    self.optional = False
    self.trace = trace
</t>
<t tx="ekr.20160214044515.1">
def reduce_types(self):
    '''
    self.aList consists of arbitrarily many types because this method is
    called from format_return_expressions.
    
    Return a *string* containing the reduction of all types in this list.
    Returning a string means that all traversers always return strings,
    never lists.
    '''
    trace = False
    if trace: g.trace('=====', self.aList)
    r = [('None' if z in ('', None) else z) for z in self.aList]
    assert None not in r
    self.optional = 'None' in r
        # self.show adds Optional if this flag is set.
    r = [z for z in r if z != 'None']
    if not r:
        self.optional = False
        return self.show('None')
    r = sorted(set(r))
    assert r
    assert None not in r
    r = self.reduce_numbers(r)
    for kind in ('Dict', 'List', 'Tuple',):
        r = self.reduce_collection(r, kind)
    r = self.reduce_unknowns(r)
    r = sorted(set(r))
    assert r
    assert 'None' not in r
    if len(r) == 1:
        return self.show(r[0])
    else:
        return self.show('Union[%s]' % (', '.join(sorted(r))))
</t>
<t tx="ekr.20160214044536.1">
def show(self, s, known=True):
    '''Show the result of reduce_types.'''
    aList, name = self.aList, self.name
    trace = False or self.trace
    s = s.strip()
    if self.optional:
        s = 'Optional[%s]' % s
    if trace and (not known or len(aList) &gt; 1):
        if name:
            if name.find('.') &gt; -1:
                context = ''.join(name.split('.')[1:])
            else:
                context = name
        else:
            context = g.callers(3).split(',')[0].strip()
        context = truncate(context, 26)
        known = '' if known else '? '
        pattern = sorted(set([z.replace('\n',' ') for z in aList]))
        pattern = '[%s]' % truncate(', '.join(pattern), 53-2)
        print('reduce_types: %-26s %53s ==&gt; %s%s' % (context, pattern, known, s))
            # widths above match the corresponding indents in match_all and match.
    return s
</t>
<t tx="ekr.20160214051730.1">
def reduce_collection(self, aList, kind):
    '''
    Reduce the inner parts of a collection for the given kind.
    Return a list with only collections of the given kind reduced.
    '''
    trace = False
    if trace: g.trace(kind, aList)
    assert isinstance(aList, list)
    assert None not in aList, aList
    pattern = Pattern('%s[*]' % kind)
    others, r1, r2 = [], [], []
    for s in sorted(set(aList)):
        if pattern.match_entire_string(s):
            r1.append(s)
        else:
            others.append(s)
    if trace: g.trace('1', others, r1)
    for s in sorted(set(r1)):
        parts = []
        s2 = s[len(kind)+1:-1]
        for s3 in s2.split(','):
            s3 = s3.strip()
            if trace: g.trace('*', self.is_known_type(s3), s3)
            parts.append(s3 if self.is_known_type(s3) else 'Any')
        r2.append('%s[%s]' % (kind, ', '.join(parts)))
    if trace: g.trace('2', r2)
    result = others
    result.extend(r2)
    result = sorted(set(result))
    if trace: g.trace('3', result)
    return result
</t>
<t tx="ekr.20160214094129.1">
def reduce_unknowns(self, aList):
    '''Replace all unknown types in aList with Any.'''
    return [z if self.is_known_type(z) else 'Any' for z in aList]
</t>
<t tx="ekr.20160214103050.1"></t>
<t tx="ekr.20160214154338.1">    r = sorted(set(aList))
    if trace: g.trace('1', r)
    table = (
        self.reduce_unknowns,
        self.reduce_numbers,
        self.merge_tuples,
        self.merge_dicts,
        self.merge_lists,
        self.make_optional,
    )
    # Apply all reductions even on lists of length one.
    for f in table:
        r = f(r)
    if trace: g.trace('2', r)
    if not r:
        return 'None'
    elif len(r) == 1:
        return self.show(r[0])
    elif 'None' in r:
        r = [z for z in aList if z != 'None']
        if len(r) == 0:
            return self.show('None')
        elif len(r) == 1:
            return self.show('Optional[%s]' % r[0])
        else:
            return self.show('Optional[Union[%s]]' % (', '.join(sorted(r))))
    else:
        return self.show('Union[%s]' % (', '.join(sorted(r))))
</t>
<t tx="ekr.20160214171726.1">    # Look inside the square brackets.
    brackets = s[len(s2):]
    if brackets and brackets[0] == '[' and brackets[-1] == ']':
        s3 = brackets[1:-1]
        if s3:
            return all([self.is_known_type(z.strip())
                for z in self.split_types(s3)])
        else:
            return True
    else:
        s3 = brackets[1:-1]
        g.trace('can not happen:\ns2: %s\ns3: %s\npattern: %s' % (
            ' '*5+s2, ' '*5+s3, pattern))
    </t>
<t tx="ekr.20160214172029.1">    result = []
    for z in aList:
        for kind in ('Dict', 'List', 'Optional', 'Tuple', 'Union'):
            if z.startswith(kind):
                result.append(z)
                break
        else:
            result.append(z if self.is_known_type(z) else 'Any')
    g.trace(aList, result)
    return result
</t>
<t tx="ekr.20160317060308.2">
# Nonlocal(identifier* names)

def do_Nonlocal(self, node):
    
    return self.indent('nonlocal %s\n' % ', '.join(node.names))
</t>
<t tx="ekr.20160317060308.3">
# Starred(expr value, expr_context ctx)

def do_Starred(self, node):

    return '*' + self.visit(node.value)
</t>
<t tx="ekr.20160317060308.4">
# Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

def do_Try(self, node): # Python 3

    result = []
    self.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    if node.finalbody:
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160317060308.5">
# YieldFrom(expr value)

def do_YieldFrom(self, node):
    
    return self.indent('yield from %s\n' % (
        self.visit(node.value)))
</t>
<t tx="ekr.20160318141204.1">#!/usr/bin/env python
'''
This script makes a stub (.pyi) file in the output directory for each
source file listed on the command line (wildcard file names are supported).

For full details, see README.md.

This file is in the public domain.

Written by Edward K. Ream.
'''
&lt;&lt; imports &gt;&gt;
isPython3 = sys.version_info &gt;= (3, 0, 0)
@others
g = LeoGlobals() # For ekr.
if __name__ == "__main__":
    main()
</t>
<t tx="ekr.20160318141204.10">
def dump_list(title, aList):
    '''Dump a list with a header.'''
    dump(title)
    for z in aList:
        print(z)
    print('')
</t>
<t tx="ekr.20160318141204.100">
def splitLines(self, s):
    '''Split s into lines, preserving trailing newlines.'''
    return s.splitlines(True) if s else []
</t>
<t tx="ekr.20160318141204.101">
def trace(self, *args, **keys):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.trace(caller_level=2, *args, **keys)
    except ImportError:
        print(args, keys)
</t>
<t tx="ekr.20160318141204.102">

class Pattern(object):
    '''
    A class representing regex or balanced patterns.
    
    Sample matching code, for either kind of pattern:
        
        for m in reversed(pattern.all_matches(s)):
            s = pattern.replace(m, s)
    '''
    @others
</t>
<t tx="ekr.20160318141204.103">
def __init__ (self, find_s, repl_s=''):
    '''Ctor for the Pattern class.'''
    self.find_s = find_s
    self.repl_s = repl_s
    if self.is_regex():
        self.regex = re.compile(find_s)
    elif self.is_balanced():
        self.regex = None
    else:
        # Escape all dangerous characters.
        result = []
        for ch in find_s:
            if ch == '_' or ch.isalnum():
                result.append(ch)
            else:
                result.append('\\'+ch)
        self.regex = re.compile(''.join(result))
</t>
<t tx="ekr.20160318141204.104">
def __eq__(self, obj):
    """Return True if two Patterns are equivalent."""
    if isinstance(obj, Pattern):
        return self.find_s == obj.find_s and self.repl_s == obj.repl_s
    else:
        return NotImplemented

def __ne__(self, obj):
    """Return True if two Patterns are not equivalent."""
    return not self.__eq__(obj)

def __hash__(self):
    '''Pattern.__hash__'''
    return len(self.find_s) + len(self.repl_s)
</t>
<t tx="ekr.20160318141204.105">
def __repr__(self):
    '''Pattern.__repr__'''
    return '%s: %s' % (self.find_s, self.repl_s)
    
__str__ = __repr__
</t>
<t tx="ekr.20160318141204.106">
def is_balanced(self):
    '''Return True if self.find_s is a balanced pattern.'''
    s = self.find_s
    if s.endswith('*'):
        return True
    for pattern in ('(*)', '[*]', '{*}'):
        if s.find(pattern) &gt; -1:
            return True
    return False
</t>
<t tx="ekr.20160318141204.107">
def is_regex(self):
    '''
    Return True if self.find_s is a regular pattern.
    For now a kludgy convention suffices.
    '''
    return self.find_s.endswith('$')
        # A dollar sign is not valid in any Python expression.
</t>
<t tx="ekr.20160318141204.108">
def all_matches(self, s):
    '''
    Return a list of match objects for all matches in s.
    These are regex match objects or (start, end) for balanced searches.
    '''
    trace = False
    if self.is_balanced():
        aList, i = [], 0
        while i &lt; len(s):
            progress = i
            j = self.full_balanced_match(s, i)
            if j is None:
                i += 1
            else:
                aList.append((i,j),)
                i = j
            assert progress &lt; i
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160318141204.109">
def full_balanced_match(self, s, i):
    '''Return the index of the end of the match found at s[i:] or None.'''
    i1 = i
    trace = False
    if trace: g.trace(self.find_s, s[i:].rstrip())
    pattern = self.find_s
    j = 0 # index into pattern
    while i &lt; len(s) and j &lt; len(pattern) and pattern[j] in ('*', s[i]):
        progress = i
        if pattern[j:j+3] in ('(*)', '[*]', '{*}'):
            delim = pattern[j]
            i = self.match_balanced(delim, s, i)
            j += 3
        elif j == len(pattern)-1 and pattern[j] == '*':
            # A trailing * matches the rest of the string.
            j += 1
            i = len(s)
            break
        else:
            i += 1
            j += 1
        assert progress &lt; i
    found = i &lt;= len(s) and j == len(pattern)
    if trace and found:
        g.trace('%s -&gt; %s' % (pattern, s[i1:i]))
    return i if found else None
</t>
<t tx="ekr.20160318141204.11">
def main():
    '''
    The driver for the stand-alone version of make-stub-files.
    All options come from ~/stubs/make_stub_files.cfg.
    '''
    # g.cls()
    controller = StandAloneMakeStubFile()
    controller.scan_command_line()
    controller.scan_options()
    controller.run()
    print('done')

</t>
<t tx="ekr.20160318141204.110">
def match_balanced(self, delim, s, i):
    '''
    delim == s[i] and delim is in '([{'
    Return the index of the end of the balanced parenthesized string, or len(s)+1.
    '''
    trace = False
    assert s[i] == delim, s[i]
    assert delim in '([{'
    delim2 = ')]}'['([{'.index(delim)]
    assert delim2 in ')]}'
    i1, level = i, 0
    while i &lt; len(s):
        progress = i
        ch = s[i]
        i += 1
        if ch == delim:
            level += 1
        elif ch == delim2:
            level -= 1
            if level == 0:
                if trace: g.trace('found: %s' % s[i1:i])
                return i
        assert progress &lt; i
    # Unmatched: a syntax error.
    g.trace('unmatched %s in %s' % (delim, s), g.callers(4))
    return len(s) + 1
</t>
<t tx="ekr.20160318141204.111">
def match(self, s, trace=False):
    '''
    Perform the match on the entire string if possible.
    Return (found, new s)
    '''
    trace = False or trace
    caller = g.callers(2).split(',')[0].strip()
        # The caller of match_all.
    s1 = truncate(s,40)
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        if j is None:
            return False, s
        else:
            start, end = 0, len(s)
            s = self.replace_balanced(s, start, end)
            if trace:
                g.trace('%-16s %30s %40s ==&gt; %s' % (caller, self, s1, s))
            return True, s
    else:
        m = self.regex.match(s)
        if m and m.group(0) == s:
            s = self.replace_regex(m, s)
            if trace:
                g.trace('%-16s %30s %30s ==&gt; %s' % (caller, self, s1, s))
            return True, s
        else:
            return False, s
</t>
<t tx="ekr.20160318141204.112">
def match_entire_string(self, s):
    '''Return True if s matches self.find_s'''
    if self.is_balanced():
        j = self.full_balanced_match(s, 0)
        return j == len(s)
    else:
        m = self.regex.match(s)
        return m and m.group(0) == s
</t>
<t tx="ekr.20160318141204.113">
def replace(self, m, s):
    '''Perform any kind of replacement.'''
    if self.is_balanced():
        start, end = m
        return self.replace_balanced(s, start, end)
    else:
        return self.replace_regex(m, s)
</t>
<t tx="ekr.20160318141204.114">
def replace_balanced(self, s1, start, end):
    '''
    Use m (returned by all_matches) to replace s by the string implied by repr_s.
    Within repr_s, * star matches corresponding * in find_s
    '''
    trace = False
    s = s1[start:end]
    f, r = self.find_s, self.repl_s
    i1 = f.find('(*)')
    i2 = f.find('[*]')
    i3 = f.find('{*}')
    if -1 == i1 == i2 == i3:
        return s1[:start] + r + s1[end:]
    j = r.find('*')
    if j == -1:
        return s1[:start] + r + s1[end:]
    i = min([z for z in [i1, i2, i3] if z &gt; -1])
    assert i &gt; -1 # i is an index into f AND s
    delim = f[i]
    if trace: g.trace('head', s[:i], f[:i])
    assert s[:i] == f[:i], (s[:i], f[:i])
    if trace: g.trace('delim',delim)
    k = self.match_balanced(delim, s, i)
    s_star = s[i+1:k-1]
    if trace: g.trace('s_star',s_star)
    repl = r[:j] + s_star + r[j+1:]
    if trace: g.trace('repl',self.repl_s,'==&gt;',repl)
    return s1[:start] + repl + s1[end:]
</t>
<t tx="ekr.20160318141204.115">
def replace_regex(self, m, s):
    '''Do the replacement in s specified by m.'''
    s = self.repl_s
    for i in range(9):
        group = '\\%s' % i
        if s.find(group) &gt; -1:
            # g.trace(i, m.group(i))
            s = s.replace(group, m.group(i))
    return s


</t>
<t tx="ekr.20160318141204.116">

class ReduceTypes:
    '''
    A helper class for the top-level reduce_types function.
    
    This class reduces a list of type hints to a string containing the
    reduction of all types in the list.
    '''
    @others

</t>
<t tx="ekr.20160318141204.117">
def __init__(self, aList=None, name=None, trace=False):
    '''Ctor for ReduceTypes class.'''
    self.aList = aList
    self.name = name
    self.optional = False
    self.trace = trace
</t>
<t tx="ekr.20160318141204.118">
def is_known_type(self, s):
    '''
    Return True if s is nothing but a single known type.

    It suits the other methods of this class *not* to test inside inner
    brackets. This prevents unwanted Any types.
    '''
    trace = False
    s1 = s
    s = s.strip()
    table = (
        '', 'None', # Tricky.
        'complex', 'float', 'int', 'long', 'number',
        'dict', 'list', 'tuple',
        'bool', 'bytes', 'str', 'unicode',
    )
    for s2 in table:
        if s2 == s:
            return True
        elif Pattern(s2+'(*)', s).match_entire_string(s):
            return True
    if s.startswith('[') and s.endswith(']'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('(') and s.endswith(')'):
        inner = s[1:-1]
        return self.is_known_type(inner) if inner else True
    elif s.startswith('{') and s.endswith('}'):
        return True
        # inner = s[1:-1]
        # return self.is_known_type(inner) if inner else True
    table = (
        # Pep 484: https://www.python.org/dev/peps/pep-0484/
        # typing module: https://docs.python.org/3/library/typing.html
        # Test the most common types first.
        'Any', 'Dict', 'List', 'Optional', 'Tuple', 'Union', 
        # Not generated by this program, but could arise from patterns.
        'AbstractSet', 'AnyMeta', 'AnyStr',
        'BinaryIO', 'ByteString',
        'Callable', 'CallableMeta', 'Container',
        'Final', 'Generic', 'GenericMeta', 'Hashable',
        'IO', 'ItemsView', 'Iterable', 'Iterator',
        'KT', 'KeysView',
        'Mapping', 'MappingView', 'Match',
        'MutableMapping', 'MutableSequence', 'MutableSet',
        'NamedTuple', 'OptionalMeta',
        # 'POSIX', 'PY2', 'PY3',
        'Pattern', 'Reversible',
        'Sequence', 'Set', 'Sized',
        'SupportsAbs', 'SupportsFloat', 'SupportsInt', 'SupportsRound',
        'T', 'TextIO', 'TupleMeta', 'TypeVar', 'TypingMeta',
        'Undefined', 'UnionMeta',
        'VT', 'ValuesView', 'VarBinding',
    )
    for s2 in table:
        if s2 == s:
            return True
        else:
            # Don't look inside bracketss.
            pattern = Pattern(s2+'[*]', s)
            if pattern.match_entire_string(s):
                return True
    if trace: g.trace('Fail:', s1)
    return False
</t>
<t tx="ekr.20160318141204.119">
def reduce_collection(self, aList, kind):
    '''
    Reduce the inner parts of a collection for the given kind.
    Return a list with only collections of the given kind reduced.
    '''
    trace = False
    if trace: g.trace(kind, aList)
    assert isinstance(aList, list)
    assert None not in aList, aList
    pattern = Pattern('%s[*]' % kind)
    others, r1, r2 = [], [], []
    for s in sorted(set(aList)):
        if pattern.match_entire_string(s):
            r1.append(s)
        else:
            others.append(s)
    if trace: g.trace('1', others, r1)
    for s in sorted(set(r1)):
        parts = []
        s2 = s[len(kind)+1:-1]
        for s3 in s2.split(','):
            s3 = s3.strip()
            if trace: g.trace('*', self.is_known_type(s3), s3)
            parts.append(s3 if self.is_known_type(s3) else 'Any')
        r2.append('%s[%s]' % (kind, ', '.join(parts)))
    if trace: g.trace('2', r2)
    result = others
    result.extend(r2)
    result = sorted(set(result))
    if trace: g.trace('3', result)
    return result
</t>
<t tx="ekr.20160318141204.12">
def pdb(self):
    '''Invoke a debugger during unit testing.'''
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160318141204.120">
def reduce_numbers(self, aList):
    '''
    Return aList with all number types in aList replaced by the most
    general numeric type in aList.
    '''
    trace = False
    found = None
    numbers = ('number', 'complex', 'float', 'long', 'int')
    for kind in numbers:
        for z in aList:
            if z == kind:
                found = kind
                break
        if found:
            break
    if found:
        assert found in numbers, found
        aList = [z for z in aList if z not in numbers]
        aList.append(found)
    if trace: g.trace(aList)
    return aList
</t>
<t tx="ekr.20160318141204.121">
def reduce_types(self):
    '''
    self.aList consists of arbitrarily many types because this method is
    called from format_return_expressions.
    
    Return a *string* containing the reduction of all types in this list.
    Returning a string means that all traversers always return strings,
    never lists.
    '''
    trace = False
    if trace: g.trace('=====', self.aList)
    r = [('None' if z in ('', None) else z) for z in self.aList]
    assert None not in r
    self.optional = 'None' in r
        # self.show adds Optional if this flag is set.
    r = [z for z in r if z != 'None']
    if not r:
        self.optional = False
        return self.show('None')
    r = sorted(set(r))
    assert r
    assert None not in r
    r = self.reduce_numbers(r)
    for kind in ('Dict', 'List', 'Tuple',):
        r = self.reduce_collection(r, kind)
    r = self.reduce_unknowns(r)
    r = sorted(set(r))
    assert r
    assert 'None' not in r
    if len(r) == 1:
        return self.show(r[0])
    else:
        return self.show('Union[%s]' % (', '.join(sorted(r))))
</t>
<t tx="ekr.20160318141204.122">
def reduce_unknowns(self, aList):
    '''Replace all unknown types in aList with Any.'''
    return [z if self.is_known_type(z) else 'Any' for z in aList]
</t>
<t tx="ekr.20160318141204.123">
def show(self, s, known=True):
    '''Show the result of reduce_types.'''
    aList, name = self.aList, self.name
    trace = False or self.trace
    s = s.strip()
    if self.optional:
        s = 'Optional[%s]' % s
    if trace and (not known or len(aList) &gt; 1):
        if name:
            if name.find('.') &gt; -1:
                context = ''.join(name.split('.')[1:])
            else:
                context = name
        else:
            context = g.callers(3).split(',')[0].strip()
        context = truncate(context, 26)
        known = '' if known else '? '
        pattern = sorted(set([z.replace('\n',' ') for z in aList]))
        pattern = '[%s]' % truncate(', '.join(pattern), 53-2)
        print('reduce_types: %-26s %53s ==&gt; %s%s' % (context, pattern, known, s))
            # widths above match the corresponding indents in match_all and match.
    return s
</t>
<t tx="ekr.20160318141204.124">
def split_types(self, s):
    '''Split types on *outer level* commas.'''
    aList, i1, level = [], 0, 0
    for i, ch in enumerate(s):
        if ch == '[':
            level += 1
        elif ch == ']':
            level -= 1
        elif ch == ',' and level == 0:
            aList.append(s[i1:i])
            i1 = i+1
    aList.append(s[i1:].strip())
    return aList
</t>
<t tx="ekr.20160318141204.125">

class StandAloneMakeStubFile:
    '''
    A class to make Python stub (.pyi) files in the ~/stubs directory for
    every file mentioned in the [Source Files] section of
    ~/stubs/make_stub_files.cfg.
    '''
    @others
</t>
<t tx="ekr.20160318141204.126">
def __init__ (self):
    '''Ctor for StandAloneMakeStubFile class.'''
    self.options = {}
    # Ivars set on the command line...
    self.config_fn = None
        # self.finalize('~/stubs/make_stub_files.cfg')
    self.enable_unit_tests = False
    self.files = [] # May also be set in the config file.
    # Ivars set in the config file...
    self.output_fn = None
    self.output_directory = self.finalize('.')
        # self.finalize('~/stubs')
    self.overwrite = False
    self.prefix_lines = []
    self.trace_matches = False
    self.trace_patterns = False
    self.trace_reduce = False
    self.trace_visitors = False
    self.update_flag = False
    self.verbose = False # Trace config arguments.
    self.warn = False
    # Pattern lists, set by config sections...
    self.section_names = (
        'Global', 'Def Name Patterns', 'General Patterns')
    self.def_patterns = [] # [Def Name Patterns]
    self.general_patterns = [] # [General Patterns]
    self.names_dict = {}
    self.op_name_dict = self.make_op_name_dict()
    self.patterns_dict = {}
    self.regex_patterns = []
</t>
<t tx="ekr.20160318141204.127">
def finalize(self, fn):
    '''Finalize and regularize a filename.'''
    fn = os.path.expanduser(fn)
    fn = os.path.abspath(fn)
    fn = os.path.normpath(fn)
    return fn
</t>
<t tx="ekr.20160318141204.128">
def make_stub_file(self, fn):
    '''
    Make a stub file in ~/stubs for all source files mentioned in the
    [Source Files] section of ~/stubs/make_stub_files.cfg
    '''
    if not fn.endswith('.py'):
        print('not a python file', fn)
        return
    if not os.path.exists(fn):
        print('not found', fn)
        return
    base_fn = os.path.basename(fn)
    out_fn = os.path.join(self.output_directory, base_fn)
    out_fn = out_fn[:-3] + '.pyi'
    self.output_fn = os.path.normpath(out_fn)
    s = open(fn).read()
    node = ast.parse(s,filename=fn,mode='exec')
    StubTraverser(controller=self).run(node)
</t>
<t tx="ekr.20160318141204.129">
def run(self):
    '''
    Make stub files for all files.
    Do nothing if the output directory does not exist.
    '''
    if self.enable_unit_tests:
        self.run_all_unit_tests()
    if self.files:
        dir_ = self.output_directory
        if dir_:
            if os.path.exists(dir_):
                for fn in self.files:
                    self.make_stub_file(fn)
            else:
                print('output directory not found: %s' % dir_)
        else:
            print('no output directory')
    elif not self.enable_unit_tests:
        print('no input files')
</t>
<t tx="ekr.20160318141204.13">
def truncate(s, n):
    '''Return s truncated to n characters.'''
    return s if len(s) &lt;= n else s[:n-3] + '...'
</t>
<t tx="ekr.20160318141204.130">
def run_all_unit_tests(self):
    '''Run all unit tests in the make_stub_files/test directory.'''
    import unittest
    loader = unittest.TestLoader()
    suite = loader.discover(os.path.abspath('.'),
                            pattern='test*.py',
                            top_level_dir=None)
    unittest.TextTestRunner(verbosity=1).run(suite)
</t>
<t tx="ekr.20160318141204.131">
def scan_command_line(self):
    '''Set ivars from command-line arguments.'''
    # This automatically implements the --help option.
    usage = "usage: make_stub_files.py [options] file1, file2, ..."
    parser = optparse.OptionParser(usage=usage)
    add = parser.add_option
    add('-c', '--config', dest='fn',
        help='full path to configuration file')
    add('-d', '--dir', dest='dir',
        help='full path to the output directory')
    add('-o', '--overwrite', action='store_true', default=False,
        help='overwrite existing stub (.pyi) files')
    add('-t', '--test', action='store_true', default=False,
        help='run unit tests on startup')
    add('--trace-matches', action='store_true', default=False,
        help='trace Pattern.matches')
    add('--trace-patterns', action='store_true', default=False,
        help='trace pattern creation')
    add('--trace-reduce', action='store_true', default=False,
        help='trace st.reduce_types')
    add('--trace-visitors', action='store_true', default=False,
        help='trace visitor methods')
    add('-u', '--update', action='store_true', default=False,
        help='update stubs in existing stub file')
    add('-v', '--verbose', action='store_true', default=False,
        help='verbose output in .pyi file')
    add('-w', '--warn', action='store_true', default=False,
        help='warn about unannotated args')
    # Parse the options
    options, args = parser.parse_args()
    # Handle the options...
    self.enable_unit_tests=options.test
    self.overwrite = options.overwrite
    self.trace_matches = options.trace_matches
    self.trace_patterns = options.trace_patterns
    self.trace_reduce = options.trace_reduce
    self.trace_visitors = options.trace_visitors
    self.update_flag = options.update
    self.verbose = options.verbose
    self.warn = options.warn
    if options.fn:
        self.config_fn = options.fn
    if options.dir:
        dir_ = options.dir
        dir_ = self.finalize(dir_)
        if os.path.exists(dir_):
            self.output_directory = dir_
        else:
            print('--dir: directory does not exist: %s' % dir_)
            print('exiting')
            sys.exit(1)
    # If any files remain, set self.files.
    if args:
        args = [self.finalize(z) for z in args]
        if args:
            self.files = args
</t>
<t tx="ekr.20160318141204.132">
def scan_options(self):
    '''Set all configuration-related ivars.'''
    trace = False
    if not self.config_fn:
        return
    self.parser = parser = self.create_parser()
    s = self.get_config_string()
    self.init_parser(s)
    if self.files:
        files_source = 'command-line'
        files = self.files
    elif parser.has_section('Global'):
        files_source = 'config file'
        files = parser.get('Global', 'files')
        files = [z.strip() for z in files.split('\n') if z.strip()]
    else:
        return
    files2 = []
    for z in files:
        files2.extend(glob.glob(self.finalize(z)))
    self.files = [z for z in files2 if z and os.path.exists(z)]
    if trace:
        print('Files (from %s)...\n' % files_source)
        for z in self.files:
            print(z)
        print('')
    if 'output_directory' in parser.options('Global'):
        s = parser.get('Global', 'output_directory')
        output_dir = self.finalize(s)
        if os.path.exists(output_dir):
            self.output_directory = output_dir
            if self.verbose:
                print('output directory: %s\n' % output_dir)
        else:
            print('output directory not found: %s\n' % output_dir)
            self.output_directory = None # inhibit run().
    if 'prefix_lines' in parser.options('Global'):
        prefix = parser.get('Global', 'prefix_lines')
        self.prefix_lines = prefix.split('\n')
            # The parser does not preserve leading whitespace.
        if trace:
            print('Prefix lines...\n')
            for z in self.prefix_lines:
                print(z)
            print('')
    self.def_patterns = self.scan_patterns('Def Name Patterns')
    self.general_patterns = self.scan_patterns('General Patterns')
    self.make_patterns_dict()
</t>
<t tx="ekr.20160318141204.133">
def make_op_name_dict(self):
    '''
    Make a dict whose keys are operators ('+', '+=', etc),
    and whose values are lists of values of ast.Node.__class__.__name__.
    '''
    d = {
        '.':   ['Attr',],
        '(*)': ['Call', 'Tuple',],
        '[*]': ['List', 'Subscript',],
        '{*}': ['???',],
        ### 'and': 'BoolOp',
        ### 'or':  'BoolOp',
    }
    for op in (
        '+', '-', '*', '/', '%', '**', '&lt;&lt;',
        '&gt;&gt;', '|', '^', '&amp;', '//',
    ):
        d[op] = ['BinOp',]
    for op in (
        '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=',
        'is', 'is not', 'in', 'not in',
    ):
        d[op] = ['Compare',]
    return d
</t>
<t tx="ekr.20160318141204.134">
def create_parser(self):
    '''Create a RawConfigParser and return it.'''
    parser = configparser.RawConfigParser(dict_type=OrderedDict)
        # Requires Python 2.7
    parser.optionxform = str
    return parser
</t>
<t tx="ekr.20160318141204.135">
def find_pattern_ops(self, pattern):
    '''Return a list of operators in pattern.find_s.'''
    trace = False or self.trace_patterns
    if pattern.is_regex():
        # Add the pattern to the regex patterns list.
        g.trace(pattern)
        self.regex_patterns.append(pattern)
        return []
    d = self.op_name_dict
    keys1, keys2, keys3, keys9 = [], [], [], []
    for op in d:
        aList = d.get(op)
        if op.replace(' ','').isalnum():
            # an alpha op, like 'not, 'not in', etc.
            keys9.append(op)
        elif len(op) == 3:
            keys3.append(op)
        elif len(op) == 2:
            keys2.append(op)
        elif len(op) == 1:
            keys1.append(op)
        else:
            g.trace('bad op', op)
    ops = []
    s = s1 = pattern.find_s
    for aList in (keys3, keys2, keys1):
        for op in aList:
            # Must match word here!
            if s.find(op) &gt; -1:
                s = s.replace(op, '')
                ops.append(op)
    # Handle the keys9 list very carefully.
    for op in keys9:
        target = ' %s ' % op
        if s.find(target) &gt; -1:
            ops.append(op)
            break # Only one match allowed.
    if trace and ops: g.trace(s1, ops)
    return ops
</t>
<t tx="ekr.20160318141204.136">
def get_config_string(self):
    
    fn = self.finalize(self.config_fn)
    if os.path.exists(fn):
        if self.verbose:
            print('\nconfiguration file: %s\n' % fn)
        f = open(fn, 'r')
        s = f.read()
        f.close()
        return s
    else:
        print('\nconfiguration file not found: %s' % fn)
        return ''
    
</t>
<t tx="ekr.20160318141204.137">
def init_parser(self, s):
    '''Add double back-slashes to all patterns starting with '['.'''
    trace = False
    if not s: return
    aList = []
    for s in s.split('\n'):
        if self.is_section_name(s):
            aList.append(s)
        elif s.strip().startswith('['):
            aList.append(r'\\'+s[1:])
            if trace: g.trace('*** escaping:',s)
        else:
            aList.append(s)
    s = '\n'.join(aList)+'\n'
    if trace: g.trace(s)
    file_object = io.StringIO(s)
    # pylint: disable=deprecated-method
    self.parser.readfp(file_object)
</t>
<t tx="ekr.20160318141204.138">
def is_section_name(self, s):
    
    def munge(s):
        return s.strip().lower().replace(' ','')
    
    s = s.strip()
    if s.startswith('[') and s.endswith(']'):
        s = munge(s[1:-1])
        for s2 in self.section_names:
            if s == munge(s2):
                return True
    return False
</t>
<t tx="ekr.20160318141204.139">
def make_patterns_dict(self):
    '''Assign all patterns to the appropriate ast.Node.'''
    trace = False or self.trace_patterns
    for pattern in self.general_patterns:
        ops = self.find_pattern_ops(pattern)
        if ops:
            for op in ops:
                # Add the pattern to op's list.
                op_names = self.op_name_dict.get(op)
                for op_name in op_names:
                    aList = self.patterns_dict.get(op_name, [])
                    aList.append(pattern)
                    self.patterns_dict[op_name] = aList
        else:
            # Enter the name in self.names_dict.
            name = pattern.find_s
            # Special case for 'number'
            if name == 'number':
                aList = self.patterns_dict.get('Num', [])
                aList.append(pattern)
                self.patterns_dict['Num'] = aList
            elif name in self.names_dict:
                g.trace('duplicate pattern', pattern)
            else:
                self.names_dict [name] = pattern.repl_s
    if 0:
        g.trace('names_dict...')
        for z in sorted(self.names_dict):
            print('  %s: %s' % (z, self.names_dict.get(z)))
    if 0:
        g.trace('patterns_dict...')
        for z in sorted(self.patterns_dict):
            aList = self.patterns_dict.get(z)
            print(z)
            for pattern in sorted(aList):
                print('  '+repr(pattern))
    # Note: retain self.general_patterns for use in argument lists.
</t>
<t tx="ekr.20160318141204.14">

class AstFormatter:
    '''
    A class to recreate source code from an AST.
    
    This does not have to be perfect, but it should be close.
    '''
    # pylint: disable=consider-using-enumerate
    @others
</t>
<t tx="ekr.20160318141204.140">
def scan_patterns(self, section_name):
    '''Parse the config section into a list of patterns, preserving order.'''
    trace = False or self.trace_patterns
    parser = self.parser
    aList = []
    if parser.has_section(section_name):
        seen = set()
        for key in parser.options(section_name):
            value = parser.get(section_name, key)
            # A kludge: strip leading \\ from patterns.
            if key.startswith(r'\\'):
                key = '[' + key[2:]
                if trace: g.trace('removing escapes', key)
            if key in seen:
                g.trace('duplicate key', key)
            else:
                seen.add(key)
                aList.append(Pattern(key, value))
        if trace:
            g.trace('%s...\n' % section_name)
            for z in aList:
                print(z)
            print('')
    # elif trace:
        # print('no section: %s' % section_name)
        # print(parser.sections())
        # print('')
    return aList
</t>
<t tx="ekr.20160318141204.141">

class Stub(object):
    '''
    A class representing all the generated stub for a class or def.
    stub.full_name should represent the complete context of a def.
    '''
    @others
</t>
<t tx="ekr.20160318141204.142">
def __init__(self, kind, name, parent=None, stack=None):
    '''Stub ctor. Equality depends only on full_name and kind.'''
    self.children = []
    self.full_name = '%s.%s' % ('.'.join(stack), name) if stack else name
    self.kind = kind
    self.name = name
    self.out_list = []
    self.parent = parent
    self.stack = stack # StubTraverser.context_stack.
    if stack:
        assert stack[-1] == parent.name, (stack[-1], parent.name)
    if parent:
        assert isinstance(parent, Stub)
        parent.children.append(self)
</t>
<t tx="ekr.20160318141204.143">
def __eq__(self, obj):
    '''
    Stub.__eq__. Return whether two stubs refer to the same method.
    Do *not* test parent links. That would interfere with --update logic.
    '''
    if isinstance(obj, Stub):
        return self.full_name == obj.full_name and self.kind == obj.kind
    else:
        return NotImplemented

def __ne__(self, obj):
    """Stub.__ne__"""
    return not self.__eq__(obj)
</t>
<t tx="ekr.20160318141204.144">
def __hash__(self):
    '''Stub.__hash__. Equality depends *only* on full_name and kind.'''
    return len(self.kind) + sum([ord(z) for z in self.full_name])
</t>
<t tx="ekr.20160318141204.145">
def __repr__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s %s' % (id(self), self.full_name)
    
def __str__(self):
    '''Stub.__repr__.'''
    return 'Stub: %s' % self.full_name
</t>
<t tx="ekr.20160318141204.146">
def level(self):
    '''Return the number of parents.'''
    return len(self.parents())
    
def parents(self):
    '''Return a list of this stub's parents.'''
    return self.full_name.split('.')[:-1]
</t>
<t tx="ekr.20160318141204.147">

class StubFormatter (AstFormatter):
    '''
    Formats an ast.Node and its descendants,
    making pattern substitutions in Name and operator nodes.
    '''
    @others
</t>
<t tx="ekr.20160318141204.148">
def __init__(self, controller, traverser):
    '''Ctor for StubFormatter class.'''
    self.controller = x = controller
    self.traverser = traverser
        # 2016/02/07: to give the formatter access to the class_stack.
    self.def_patterns = x.def_patterns
    self.general_patterns = x.general_patterns
    self.names_dict = x.names_dict
    self.patterns_dict = x.patterns_dict
    self.raw_format = AstFormatter().format
    self.regex_patterns = x.regex_patterns
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
</t>
<t tx="ekr.20160318141204.149">
matched_d = {}

def match_all(self, node, s, trace=False):
    '''Match all the patterns for the given node.'''
    trace = False or trace or self.trace_matches
    # verbose = True
    d = self.matched_d
    name = node.__class__.__name__
    s1 = truncate(s, 40)
    caller = g.callers(2).split(',')[1].strip()
        # The direct caller of match_all.
    patterns = self.patterns_dict.get(name, []) + self.regex_patterns
    for pattern in patterns:
        found, s = pattern.match(s,trace=False)
        if found:
            if trace:
                aList = d.get(name, [])
                if pattern not in aList:
                    aList.append(pattern)
                    d [name] = aList
                    print('match_all:    %-12s %26s %40s ==&gt; %s' % (caller, pattern, s1, s))
            break
    return s
</t>
<t tx="ekr.20160318141204.15">
# Entries...
</t>
<t tx="ekr.20160318141204.150">
def visit(self, node):
    '''StubFormatter.visit: supports --verbose tracing.'''
    s = AstFormatter.visit(self, node)
    # g.trace('%12s %s' % (node.__class__.__name__,s))
    return s
</t>
<t tx="ekr.20160318141204.151">
def trace_visitor(self, node, op, s):
    '''Trace node's visitor.'''
    if self.trace_visitors:
        caller = g.callers(2).split(',')[1]
        s1 = AstFormatter().format(node).strip()
        print('%12s op %-6s: %s ==&gt; %s' % (caller, op.strip(), s1, s))
</t>
<t tx="ekr.20160318141204.152">
# StubFormatter visitors for operands...
</t>
<t tx="ekr.20160318141204.153">
# Attribute(expr value, identifier attr, expr_context ctx)

attrs_seen = []

def do_Attribute(self, node):
    '''StubFormatter.do_Attribute.'''
    trace = False
    s = '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.
    s2 = self.names_dict.get(s)
    if trace and s2 and s2 not in self.attrs_seen:
        self.attrs_seen.append(s2)
        g.trace(s, '==&gt;', s2)
    return s2 or s
</t>
<t tx="ekr.20160318141204.154">
# Return generic markers to allow better pattern matches.

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Num(self, node):
    # make_patterns_dict treats 'number' as a special case.
    # return self.names_dict.get('number', 'number')
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160318141204.155">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    # return ''.join(result)
    return 'Dict[%s]' % ''.join(result)
</t>
<t tx="ekr.20160318141204.156">
def do_List(self, node):
    '''StubFormatter.List.'''
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    # g.trace('=====',elts)
    return 'List[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160318141204.157">
seen_names = []

def do_Name(self, node):
    '''StubFormatter ast.Name visitor.'''
    trace = False
    d = self.names_dict
    name = d.get(node.id, node.id)
    s = 'bool' if name in ('True', 'False') else name
    if trace and node.id not in self.seen_names:
        self.seen_names.append(node.id)
        if d.get(node.id):
            g.trace(node.id, '==&gt;', d.get(node.id))
        elif node.id == 'aList':
            g.trace('**not found**', node.id)
    return s
</t>
<t tx="ekr.20160318141204.158">
def do_Tuple(self, node):
    '''StubFormatter.Tuple.'''
    elts = [self.visit(z) for z in node.elts]
    if 1:
        return 'Tuple[%s]' % ', '.join(elts)
    else:
        s = '(%s)' % ', '.join(elts)
        return self.match_all(node, s)
    # return 'Tuple[%s]' % ', '.join(elts)
</t>
<t tx="ekr.20160318141204.159">
# StubFormatter visitors for operators...
</t>
<t tx="ekr.20160318141204.160">
# BinOp(expr left, operator op, expr right)

def do_BinOp(self, node):
    '''StubFormatter.BinOp visitor.'''
    trace = False or self.trace_reduce ; verbose = False
    numbers = ['number', 'complex', 'float', 'long', 'int',]
    op = self.op_name(node.op)
    lhs = self.visit(node.left)
    rhs = self.visit(node.right)
    if op.strip() in ('is', 'is not', 'in', 'not in'):
        s = 'bool'
    elif lhs == rhs:
        s = lhs
            # Perhaps not always right,
            # but it is correct for Tuple, List, Dict.
    elif lhs in numbers and rhs in numbers:
        s = reduce_types([lhs, rhs], trace=trace)
            # reduce_numbers would be wrong: it returns a list.
    elif lhs == 'str' and op in '%+*':
        # str + any implies any is a string.
        s = 'str'
    else:
        if trace and verbose and lhs == 'str':
            g.trace('***** unknown string op', lhs, op, rhs)
        # Fall back to the base-class behavior.
        s = '%s%s%s' % (
            self.visit(node.left),
            op,
            self.visit(node.right))
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160318141204.161">
# BoolOp(boolop op, expr* values)

def do_BoolOp(self, node): # Python 2.x only.
    '''StubFormatter.BoolOp visitor for 'and' and 'or'.'''
    trace = False or self.trace_reduce
    op = self.op_name(node.op)
    values = [self.visit(z).strip() for z in node.values]
    s = reduce_types(values, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, op, s)
    return s
</t>
<t tx="ekr.20160318141204.162">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    '''StubFormatter.Call visitor.'''
    trace = False
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    # Explicit pattern:
    if func in ('dict', 'list', 'set', 'tuple',):
        s = '%s[%s]' % (func.capitalize(), ', '.join(args))
    else:
        s = '%s(%s)' % (func, ', '.join(args))
    s = self.match_all(node, s, trace=trace)
    self.trace_visitor(node, 'call', s)
    return s
</t>
<t tx="ekr.20160318141204.163">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)
</t>
<t tx="ekr.20160318141204.164">
# Compare(expr left, cmpop* ops, expr* comparators)

def do_Compare(self, node):
    '''
    StubFormatter ast.Compare visitor for these ops:
    '==', '!=', '&lt;', '&lt;=', '&gt;', '&gt;=', 'is', 'is not', 'in', 'not in',
    '''
    s = 'bool' # Correct regardless of arguments.
    ops = ','.join([self.op_name(z) for z in node.ops])
    self.trace_visitor(node, ops, s)
    return s
</t>
<t tx="ekr.20160318141204.165">
# If(expr test, stmt* body, stmt* orelse)

def do_IfExp(self, node):
    '''StubFormatterIfExp (ternary operator).'''
    trace = False or self.trace_reduce
    aList = [
        self.match_all(node, self.visit(node.body)),
        self.match_all(node, self.visit(node.orelse)),
    ]
    s = reduce_types(aList, trace=trace)
    s = self.match_all(node, s)
    self.trace_visitor(node, 'if', s)
    return s
</t>
<t tx="ekr.20160318141204.166">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    '''StubFormatter.Subscript.'''
    s = '%s[%s]' % (
        self.visit(node.value),
        self.visit(node.slice))
    s = self.match_all(node, s)
    self.trace_visitor(node, '[]', s)
    return s
</t>
<t tx="ekr.20160318141204.167">
# UnaryOp(unaryop op, expr operand)

def do_UnaryOp(self, node):
    '''StubFormatter.UnaryOp for unary +, -, ~ and 'not' operators.'''
    op = self.op_name(node.op)
    # g.trace(op.strip(), self.raw_format(node.operand))
    if op.strip() == 'not':
        return 'bool'
    else:
        s = self.visit(node.operand)
        s = self.match_all(node, s)
        self.trace_visitor(node, op, s)
        return s
</t>
<t tx="ekr.20160318141204.168">
def do_Return(self, node):
    '''
    StubFormatter ast.Return vsitor.
    Return only the return expression itself.
    '''
    s = AstFormatter.do_Return(self, node)
    assert s.startswith('return'), repr(s)
    return s[len('return'):].strip()
</t>
<t tx="ekr.20160318141204.169">

class StubTraverser (ast.NodeVisitor):
    '''
    An ast.Node traverser class that outputs a stub for each class or def.
    Names of visitors must start with visit_. The order of traversal does
    not matter, because so few visitors do anything.
    '''
    @others
</t>
<t tx="ekr.20160318141204.17">
def format(self, node):
    '''Format the node (or list of nodes) and its descendants.'''
    self.level = 0
    val = self.visit(node)
    return val and val.strip() or ''
</t>
<t tx="ekr.20160318141204.170">
def __init__(self, controller):
    '''Ctor for StubTraverser class.'''
    self.controller = x = controller
        # A StandAloneMakeStubFile instance.
    # Internal state ivars...
    self.class_name_stack = []
    self.context_stack = []
    sf = StubFormatter(controller=controller,traverser=self)
    self.format = sf.format
    self.arg_format = AstArgFormatter().format
    self.level = 0
    self.output_file = None
    self.parent_stub = None
    self.raw_format = AstFormatter().format
    self.returns = []
    self.stubs_dict = {}
        # Keys are stub.full_name's.  Values are stubs.
    self.warn_list = []
    # Copies of controller ivars...
    self.output_fn = x.output_fn
    self.overwrite = x.overwrite
    self.prefix_lines = x.prefix_lines
    self.regex_patterns = x.regex_patterns
    self.update_flag = x.update_flag
    self.trace_matches = x.trace_matches
    self.trace_patterns = x.trace_patterns
    self.trace_reduce = x.trace_reduce
    self.trace_visitors = x.trace_visitors
    self.verbose = x.verbose
    self.warn = x.warn
    # Copies of controller patterns...
    self.def_patterns = x.def_patterns
    self.names_dict = x.names_dict
    self.general_patterns = x.general_patterns
    self.patterns_dict = x.patterns_dict
    
</t>
<t tx="ekr.20160318141204.171">
def add_stub(self, d, stub):
    '''Add the stub to d, checking that it does not exist.'''
    trace = False ; verbose = False
    key = stub.full_name
    assert key
    if key in d:
        caller = g.callers(2).split(',')[1]
        g.trace('Ignoring duplicate entry for %s in %s' % (stub, caller))
    else:
        d [key] = stub
        if trace and verbose:
            caller = g.callers(2).split(',')[1]
            g.trace('%17s %s' % (caller, stub.full_name))
        elif trace:
            g.trace(stub.full_name)
</t>
<t tx="ekr.20160318141204.172">
def indent(self, s):
    '''Return s, properly indented.'''
    # This version of indent *is* used.
    return '%s%s' % (' ' * 4 * self.level, s)

def out(self, s):
    '''Output the string to the console or the file.'''
    s = self.indent(s)
    if self.parent_stub:
        self.parent_stub.out_list.append(s)
    elif self.output_file:
        self.output_file.write(s+'\n')
    else:
        print(s)
</t>
<t tx="ekr.20160318141204.173">
def run(self, node):
    '''StubTraverser.run: write the stubs in node's tree to self.output_fn.'''
    fn = self.output_fn
    dir_ = os.path.dirname(fn)
    if os.path.exists(fn) and not self.overwrite:
        print('file exists: %s' % fn)
    elif not dir_ or os.path.exists(dir_):
        t1 = time.clock()
        # Delayed output allows sorting.
        self.parent_stub = Stub(kind='root', name='&lt;new-stubs&gt;')
        for z in self.prefix_lines or []:
            self.parent_stub.out_list.append(z)
        self.visit(node)
            # Creates parent_stub.out_list.
        if self.update_flag:
            self.parent_stub = self.update(fn, new_root=self.parent_stub)
        if 1:
            self.output_file = open(fn, 'w')
            self.output_time_stamp()
            self.output_stubs(self.parent_stub)
            self.output_file.close()
            self.output_file = None
            self.parent_stub = None
        t2 = time.clock()
        print('wrote: %s in %4.2f sec' % (fn, t2 - t1))
    else:
        print('output directory not not found: %s' % dir_)
</t>
<t tx="ekr.20160318141204.174">
def output_stubs(self, stub):
    '''Output this stub and all its descendants.'''
    for s in stub.out_list or []:
        # Indentation must be present when an item is added to stub.out_list.
        if self.output_file:
            self.output_file.write(s.rstrip()+'\n')
        else:
            print(s)
    # Recursively print all children.
    for child in stub.children:
        self.output_stubs(child)
</t>
<t tx="ekr.20160318141204.175">
def output_time_stamp(self):
    '''Put a time-stamp in the output file.'''
    if self.output_file:
        self.output_file.write('# make_stub_files: %s\n' %
            time.strftime("%a %d %b %Y at %H:%M:%S"))
</t>
<t tx="ekr.20160318141204.176">
def update(self, fn, new_root):
    '''
    Merge the new_root tree with the old_root tree in fn (a .pyi file).

    new_root is the root of the stub tree from the .py file.
    old_root (read below) is the root of stub tree from the .pyi file.
    
    Return old_root, or new_root if there are any errors.
    '''
    trace = False ; verbose = False
    s = self.get_stub_file(fn)
    if not s or not s.strip():
        return new_root
    if '\t' in s:
        # Tabs in stub files make it impossible to parse them reliably.
        g.trace('Can not update stub files containing tabs.')
        return new_root
    # Read old_root from the .pyi file.
    old_d, old_root = self.parse_stub_file(s, root_name='&lt;old-stubs&gt;')
    if old_root:
        # Merge new stubs into the old tree.
        if trace and verbose:
            print(self.trace_stubs(old_root, header='old_root'))
            print(self.trace_stubs(new_root, header='new_root'))
        print('***** updating stubs from %s *****' % fn)
        self.merge_stubs(self.stubs_dict.values(), old_root, new_root)
        if trace:
            print(self.trace_stubs(old_root, header='updated_root'))
        return old_root
    else:
        return new_root
</t>
<t tx="ekr.20160318141204.177">
def get_stub_file(self, fn):
    '''Read the stub file into s.'''
    if os.path.exists(fn):
        try:
            s = open(fn, 'r').read()
        except Exception:
            print('--update: error reading %s' % fn)
            s = None
        return s
    else:
        print('--update: not found: %s' % fn)
        return None
</t>
<t tx="ekr.20160318141204.178">
def parse_stub_file(self, s, root_name):
    '''
    Parse s, the contents of a stub file, into a tree of Stubs.
    
    Parse by hand, so that --update can be run with Python 2.
    '''
    trace = False
    assert '\t' not in s
    d = {}
    root = Stub(kind='root', name=root_name)
    indent_stack = [-1] # To prevent the root from being popped.
    stub_stack = [root]
    lines = []
    pat = re.compile(r'^([ ]*)(def|class)\s+([a-zA-Z_]+)(.*)')
    for line in g.splitLines(s):
        m = pat.match(line)
        if m:
            indent, kind, name, rest = (
                len(m.group(1)), m.group(2), m.group(3), m.group(4))
            old_indent = indent_stack[-1]
            # Terminate any previous lines.
            old_stub = stub_stack[-1]
            old_stub.out_list.extend(lines)
            if trace:
                for s in lines:
                    g.trace('  '+s.rstrip())
            lines = [line]
            # Adjust the stacks.
            if indent == old_indent:
                stub_stack.pop()
            elif indent &gt; old_indent:
                indent_stack.append(indent)
            else: # indent &lt; old_indent
                # The indent_stack can't underflow because
                # indent &gt;= 0 and indent_stack[0] &lt; 0
                assert indent &gt;= 0
                while indent &lt;= indent_stack[-1]:
                    indent_stack.pop()
                    old_stub = stub_stack.pop()
                    assert old_stub != root
                indent_stack.append(indent)
            # Create and push the new stub *after* adjusting the stacks.
            assert stub_stack
            parent = stub_stack[-1]
            stack = [z.name for z in stub_stack[1:]]
            parent = stub_stack[-1]
            stub = Stub(kind, name, parent, stack)
            self.add_stub(d, stub)
            stub_stack.append(stub)
            if trace:
                g.trace('%s%5s %s %s' % (' '*indent, kind, name, rest))
        else:
            parent = stub_stack[-1]
            lines.append(line)
    # Terminate the last stub.
    old_stub = stub_stack[-1]
    old_stub.out_list.extend(lines)
    if trace:
        for s in lines:
            g.trace('  '+s.rstrip())
    return d, root
</t>
<t tx="ekr.20160318141204.179">
def merge_stubs(self, new_stubs, old_root, new_root, trace=False):
    '''
    Merge the new_stubs *list* into the old_root *tree*.
    - new_stubs is a list of Stubs from the .py file.
    - old_root is the root of the stubs from the .pyi file.
    - new_root is the root of the stubs from the .py file.
    '''
    trace = False or trace ; verbose = False
    # Part 1: Delete old stubs do *not* exist in the *new* tree.
    aList = self.check_delete(new_stubs,
                              old_root,
                              new_root,
                              trace and verbose)
        # Checks that all ancestors of deleted nodes will be deleted.
    aList = list(reversed(self.sort_stubs_by_hierarchy(aList)))
        # Sort old stubs so that children are deleted before parents.
    if trace and verbose:
        dump_list('ordered delete list', aList)
    for stub in aList:
        if trace: g.trace('deleting  %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.remove(stub)
        assert not self.find_stub(stub, old_root), stub
    # Part 2: Insert new stubs that *not* exist in the *old* tree.
    aList = [z for z in new_stubs if not self.find_stub(z, old_root)]
    aList = self.sort_stubs_by_hierarchy(aList)
        # Sort new stubs so that parents are created before children.
    for stub in aList:
        if trace: g.trace('inserting %s' % stub)
        parent = self.find_parent_stub(stub, old_root) or old_root
        parent.children.append(stub)
        assert self.find_stub(stub, old_root), stub
</t>
<t tx="ekr.20160318141204.18">
def visit(self, node):
    '''Return the formatted version of an Ast node, or list of Ast nodes.'''
    if isinstance(node, (list, tuple)):
        return ','.join([self.visit(z) for z in node])
    elif node is None:
        return 'None'
    else:
        assert isinstance(node, ast.AST), node.__class__.__name__
        method_name = 'do_' + node.__class__.__name__
        method = getattr(self, method_name)
        s = method(node)
        # assert type(s) == type('abc'), (node, type(s))
        assert g.isString(s), type(s)
        return s
</t>
<t tx="ekr.20160318141204.180">
def check_delete(self, new_stubs, old_root, new_root, trace):
    '''Return a list of nodes that can be deleted.'''
    old_stubs = self.flatten_stubs(old_root)
    old_stubs.remove(old_root)
    aList = [z for z in old_stubs if z not in new_stubs]
    if trace:
        dump_list('old_stubs', old_stubs)
        dump_list('new_stubs', new_stubs)
        dump_list('to-be-deleted stubs', aList)
    delete_list = []
    # Check that all parents of to-be-delete nodes will be deleted.
    for z in aList:
        z1 = z
        for i in range(20):
            z = z.parent
            if not z:
                g.trace('can not append: new root not found', z)
                break
            elif z == old_root:
                # if trace: g.trace('can delete', z1)
                delete_list.append(z1)
                break
            elif z not in aList:
                g.trace("can not delete %s because of %s" % (z1, z))
                break
        else:
            g.trace('can not happen: parent loop')
    if trace:
        dump_list('delete_list', delete_list)
    return delete_list
</t>
<t tx="ekr.20160318141204.181">
def flatten_stubs(self, root):
    '''Return a flattened list of all stubs in root's tree.'''
    aList = [root]
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
    return aList
        
def flatten_stubs_helper(self, root, aList):
    '''Append all stubs in root's tree to aList.'''
    aList.append(root)
    for child in root.children:
        self.flatten_stubs_helper(child, aList)
</t>
<t tx="ekr.20160318141204.182">
def find_parent_stub(self, stub, root):
    '''Return stub's parent **in root's tree**.'''
    return self.find_stub(stub.parent, root) if stub.parent else None
</t>
<t tx="ekr.20160318141204.183">
def find_stub(self, stub, root):
    '''Return the stub **in root's tree** that matches stub.'''
    if stub == root: # Must use Stub.__eq__!
        return root # not stub!
    for child in root.children:
        stub2 = self.find_stub(stub, child)
        if stub2: return stub2
    return None
</t>
<t tx="ekr.20160318141204.184">
def sort_stubs_by_hierarchy(self, stubs1):
    '''
    Sort the list of Stubs so that parents appear before all their
    descendants.
    '''
    stubs, result = stubs1[:], []
    for i in range(50):
        if stubs:
            # Add all stubs with i parents to the results.
            found = [z for z in stubs if z.level() == i]
            result.extend(found)
            for z in found:
                stubs.remove(z)
        else:
            return result
    g.trace('can not happen: unbounded stub levels.')
    return [] # Abort the merge.
</t>
<t tx="ekr.20160318141204.185">
def trace_stubs(self, stub, aList=None, header=None, level=-1):
    '''Return a trace of the given stub and all its descendants.'''
    indent = ' '*4*max(0,level)
    if level == -1:
        aList = ['===== %s...\n' % (header) if header else '']
    for s in stub.out_list:
        aList.append('%s%s' % (indent, s.rstrip()))
    for child in stub.children:
        self.trace_stubs(child, level=level+1, aList=aList)
    if level == -1:
        return '\n'.join(aList) + '\n'
</t>
<t tx="ekr.20160318141204.186">
# 2: ClassDef(identifier name, expr* bases,
#             stmt* body, expr* decorator_list)
# 3: ClassDef(identifier name, expr* bases,
#             keyword* keywords, expr? starargs, expr? kwargs
#             stmt* body, expr* decorator_list)
#
# keyword arguments supplied to call (NULL identifier for **kwargs)
# keyword = (identifier? arg, expr value)

def visit_ClassDef(self, node):
    
    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('class', node.name,old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.class_name_stack.append(node.name)
    self.context_stack.append(node.name)
    if self.trace_matches or self.trace_reduce:
        print('\nclass %s\n' % node.name)
    # Format...
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if getattr(node, 'keywords', None): # Python 3
        for keyword in node.keywords:
            bases.append('%s=%s' % (keyword.arg, self.visit(keyword.value)))
    if getattr(node, 'starargs', None): # Python 3
        bases.append('*%s', self.visit(node.starargs))
    if getattr(node, 'kwargs', None): # Python 3
        bases.append('*%s', self.visit(node.kwargs))
    if not node.name.startswith('_'):
        if node.bases:
            s = '(%s)' % ', '.join([self.format(z) for z in node.bases])
        else:
            s = ''
        self.out('class %s%s:' % (node.name, s))
    # Visit...
    self.level += 1
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.class_name_stack.pop()
    self.level -= 1
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160318141204.187">
# 2: FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)
# 3: FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list,
#                expr? returns)


def visit_FunctionDef(self, node):

    # Create the stub in the old context.
    old_stub = self.parent_stub
    self.parent_stub = Stub('def', node.name, old_stub, self.context_stack)
    self.add_stub(self.stubs_dict, self.parent_stub)
    # Enter the new context.
    self.returns = []
    self.level += 1
    self.context_stack.append(node.name)
    for z in node.body:
        self.visit(z)
    self.context_stack.pop()
    self.level -= 1
    # Format *after* traversing
    # if self.trace_matches or self.trace_reduce:
        # if not self.class_name_stack:
            # print('def %s\n' % node.name)
    self.out('def %s(%s) -&gt; %s' % (
        node.name,
        self.format_arguments(node.args),
        self.format_returns(node)))
    self.parent_stub = old_stub
</t>
<t tx="ekr.20160318141204.188">
# arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)

def format_arguments(self, node):
    '''
    Format the arguments node.
    Similar to AstFormat.do_arguments, but it is not a visitor!
    '''
    assert isinstance(node,ast.arguments), node
    args = [self.raw_format(z) for z in node.args]
    defaults = [self.raw_format(z) for z in node.defaults]
    # Assign default values to the last args.
    result = []
    n_plain = len(args) - len(defaults)
    # pylint: disable=consider-using-enumerate
    for i in range(len(args)):
        s = self.munge_arg(args[i])
        if i &lt; n_plain:
            result.append(s)
        else:
            result.append('%s=%s' % (s, defaults[i - n_plain]))
    # Now add the vararg and kwarg args.
    name = getattr(node, 'vararg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('*' + name)
    name = getattr(node, 'kwarg', None)
    if name:
        if hasattr(ast, 'arg'): # python 3:
            name = self.raw_format(name)
        result.append('**' + name)
    return ', '.join(result)
</t>
<t tx="ekr.20160318141204.189">
def munge_arg(self, s):
    '''Add an annotation for s if possible.'''
    if s == 'self':
        return s
    for pattern in self.general_patterns:
        if pattern.match_entire_string(s):
            return '%s: %s' % (s, pattern.repl_s)
    if self.warn and s not in self.warn_list:
        self.warn_list.append(s)
        print('no annotation for %s' % s)
    return s + ': Any'
</t>
<t tx="ekr.20160318141204.19">
# Contexts...

</t>
<t tx="ekr.20160318141204.190">
def format_returns(self, node):
    '''
    Calculate the return type:
    - Return None if there are no return statements.
    - Patterns in [Def Name Patterns] override all other patterns.
    - Otherwise, return a list of return values.
    '''
    trace = False
    name = self.get_def_name(node)
    raw = [self.raw_format(z) for z in self.returns]
    r = [self.format(z) for z in self.returns]
        # Allow StubFormatter.do_Return to do the hack.
    # Step 1: Return None if there are no return statements.
    if trace and self.returns:
        g.trace('name: %s r:\n%s' % (name, r))
    if not [z for z in self.returns if z.value != None]:
        return 'None: ...'
    # Step 2: [Def Name Patterns] override all other patterns.
    for pattern in self.def_patterns:
        found, s = pattern.match(name)
        if found:
            if trace:
                g.trace('*name pattern %s: %s -&gt; %s' % (
                    pattern.find_s, name, s))
            return s + ': ...'
    # Step 3: remove recursive calls.
    raw, r = self.remove_recursive_calls(name, raw, r)
    # Step 4: Calculate return types.
    return self.format_return_expressions(name, raw, r)
</t>
<t tx="ekr.20160318141204.191">
def format_return_expressions(self, name, raw_returns, reduced_returns):
    '''
    aList is a list of maximally reduced return expressions.
    For each expression e in Alist:
    - If e is a single known type, add e to the result.
    - Otherwise, add Any # e to the result.
    Return the properly indented result.
    '''
    assert len(raw_returns) == len(reduced_returns)
    lws =  '\n' + ' '*4
    n = len(raw_returns)
    known = all([is_known_type(e) for e in reduced_returns])
    # g.trace(reduced_returns)
    if not known or self.verbose:
        # First, generate the return lines.
        aList = []
        for i in range(n):
            e, raw = reduced_returns[i], raw_returns[i]
            known = ' ' if is_known_type(e) else '?'
            aList.append('# %s %s: %s' % (' ', i, raw))
            aList.append('# %s %s: return %s' % (known, i, e))
        results = ''.join([lws + self.indent(z) for z in aList])
        # Put the return lines in their proper places.
        if known:
            s = reduce_types(reduced_returns,
                             name=name,
                             trace=self.trace_reduce)
            return s + ': ...' + results
        else:
            return 'Any: ...' + results
    else:
        s = reduce_types(reduced_returns,
                         name=name,
                         trace=self.trace_reduce) 
        return s + ': ...'
</t>
<t tx="ekr.20160318141204.192">
def get_def_name(self, node):
    '''Return the representaion of a function or method name.'''
    if self.class_name_stack:
        name = '%s.%s' % (self.class_name_stack[-1], node.name)
        # All ctors should return None
        if node.name == '__init__':
            name = 'None'
    else:
        name = node.name
    return name
</t>
<t tx="ekr.20160318141204.193">
def remove_recursive_calls(self, name, raw, reduced):
    '''Remove any recursive calls to name from both lists.'''
    # At present, this works *only* if the return is nothing but the recursive call.
    trace = False
    assert len(raw) == len(reduced)
    pattern = Pattern('%s(*)' % name)
    n = len(reduced)
    raw_result, reduced_result = [], []
    for i in range(n):
        if pattern.match_entire_string(reduced[i]):
            if trace:
                g.trace('****', name, pattern, reduced[i])
        else:
            raw_result.append(raw[i])
            reduced_result.append(reduced[i])
    return raw_result, reduced_result
</t>
<t tx="ekr.20160318141204.194">
def visit_Return(self, node):

    self.returns.append(node)
        # New: return the entire node, not node.value.
</t>
<t tx="ekr.20160318141204.195">

class TestClass:
    '''
    A class containing constructs that have caused difficulties.
    This is in the make_stub_files directory, not the test directory.
    '''
    # pylint: disable=no-member
    # pylint: disable=undefined-variable
    # pylint: disable=no-self-argument
    # pylint: disable=no-method-argument
    # pylint: disable=unsubscriptable-object
    @others
</t>
<t tx="ekr.20160318141204.196">
def parse_group(group):
    if len(group) &gt;= 3 and group[-2] == 'as':
        del group[-2:]
    ndots = 0
    i = 0
    while len(group) &gt; i and group[i].startswith('.'):
        ndots += len(group[i])
        i += 1
    assert ''.join(group[:i]) == '.'*ndots, group
    del group[:i]
    assert all(g == '.' for g in group[1::2]), group
    return ndots, os.sep.join(group[::2])
</t>
<t tx="ekr.20160318141204.197">
def return_all(self):
    return all([is_known_type(z) for z in s3.split(',')])
    # return all(['abc'])
</t>
<t tx="ekr.20160318141204.198">
def return_array():
    return f(s[1:-1])
</t>
<t tx="ekr.20160318141204.199">
def return_list(self, a):
    return [a]
</t>
<t tx="ekr.20160318141204.2">import ast
from collections import OrderedDict
    # Requires Python 2.7 or above. Without OrderedDict
    # the configparser will give random order for patterns.
try:
    import ConfigParser as configparser # Python 2
except ImportError:
    import configparser # Python 3
import glob
import optparse
import os
import re
import sys
import time
import types
try:
    import StringIO as io # Python 2
except ImportError:
    import io # Python 3

</t>
<t tx="ekr.20160318141204.20">
# 2: ClassDef(identifier name, expr* bases,
#             stmt* body, expr* decorator_list)
# 3: ClassDef(identifier name, expr* bases,
#             keyword* keywords, expr? starargs, expr? kwargs
#             stmt* body, expr* decorator_list)
#
# keyword arguments supplied to call (NULL identifier for **kwargs)
# keyword = (identifier? arg, expr value)

def do_ClassDef(self, node):
    result = []
    name = node.name # Only a plain string is valid.
    bases = [self.visit(z) for z in node.bases] if node.bases else []
    if getattr(node, 'keywords', None): # Python 3
        for keyword in node.keywords:
            bases.append('%s=%s' % (keyword.arg, self.visit(keyword.value)))
    if getattr(node, 'starargs', None): # Python 3
        bases.append('*%s', self.visit(node.starargs))
    if getattr(node, 'kwargs', None): # Python 3
        bases.append('*%s', self.visit(node.kwargs))
    if bases:
        result.append(self.indent('class %s(%s):\n' % (name, ','.join(bases))))
    else:
        result.append(self.indent('class %s:\n' % name))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.200">
def return_two_lists(s):
    if 1:
        return aList
    else:
        return list(self.regex.finditer(s))
</t>
<t tx="ekr.20160318141204.21">
# 2: FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list)
# 3: FunctionDef(identifier name, arguments args, stmt* body, expr* decorator_list,
#                expr? returns)

def do_FunctionDef(self, node):
    '''Format a FunctionDef node.'''
    result = []
    if node.decorator_list:
        for z in node.decorator_list:
            result.append('@%s\n' % self.visit(z))
    name = node.name # Only a plain string is valid.
    args = self.visit(node.args) if node.args else ''
    if getattr(node, 'returns', None): # Python 3.
        returns = self.visit(node.returns)
        result.append(self.indent('def %s(%s): -&gt; %s\n' % (name, args, returns)))
    else:
        result.append(self.indent('def %s(%s):\n' % (name, args)))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.22">
def do_Interactive(self, node):
    for z in node.body:
        self.visit(z)

</t>
<t tx="ekr.20160318141204.23">
def do_Module(self, node):
    assert 'body' in node._fields
    result = ''.join([self.visit(z) for z in node.body])
    return result # 'module:\n%s' % (result)

</t>
<t tx="ekr.20160318141204.24">
def do_Lambda(self, node):
    return self.indent('lambda %s: %s' % (
        self.visit(node.args),
        self.visit(node.body)))
</t>
<t tx="ekr.20160318141204.25">
# Expressions...

</t>
<t tx="ekr.20160318141204.26">
def do_Expr(self, node):
    '''An outer expression: must be indented.'''
    return self.indent('%s\n' % self.visit(node.value))

</t>
<t tx="ekr.20160318141204.27">
def do_Expression(self, node):
    '''An inner expression: do not indent.'''
    return '%s\n' % self.visit(node.body)

</t>
<t tx="ekr.20160318141204.28">
def do_GeneratorExp(self, node):
    elt = self.visit(node.elt) or ''
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '&lt;gen %s for %s&gt;' % (elt, ','.join(gens))

</t>
<t tx="ekr.20160318141204.29">
def do_AugLoad(self, node):
    return 'AugLoad'

def do_Del(self, node):
    return 'Del'

def do_Load(self, node):
    return 'Load'

def do_Param(self, node):
    return 'Param'

def do_Store(self, node):
    return 'Store'
</t>
<t tx="ekr.20160318141204.3"></t>
<t tx="ekr.20160318141204.30">
# Operands...

</t>
<t tx="ekr.20160318141204.31">
# 2: arguments = (expr* args, identifier? vararg, identifier? kwarg, expr* defaults)
# 3: arguments = (arg*  args, arg? vararg,
#                arg* kwonlyargs, expr* kw_defaults,
#                arg? kwarg, expr* defaults)

def do_arguments(self, node):
    '''Format the arguments node.'''
    kind = self.kind(node)
    assert kind == 'arguments', kind
    args = [self.visit(z) for z in node.args]
    defaults = [self.visit(z) for z in node.defaults]
    # Assign default values to the last args.
    args2 = []
    n_plain = len(args) - len(defaults)
    for i in range(len(args)):
        if i &lt; n_plain:
            args2.append(args[i])
        else:
            args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
    if isPython3:
        args  = [self.visit(z) for z in node.kwonlyargs]
        defaults = [self.visit(z) for z in node.kw_defaults]
        n_plain = len(args) - len(defaults)
        for i in range(len(args)):
            if i &lt; n_plain:
                args2.append(args[i])
            else:
                args2.append('%s=%s' % (args[i], defaults[i - n_plain]))
        # Add the vararg and kwarg expressions.
        vararg = getattr(node, 'vararg', None)
        if vararg: args2.append('*' + self.visit(vararg))
        kwarg = getattr(node, 'kwarg', None)
        if kwarg: args2.append('**' + self.visit(kwarg))
    else:
        # Add the vararg and kwarg names.
        name = getattr(node, 'vararg', None)
        if name: args2.append('*' + name)
        name = getattr(node, 'kwarg', None)
        if name: args2.append('**' + name)
    return ','.join(args2)
</t>
<t tx="ekr.20160318141204.32">
# 3: arg = (identifier arg, expr? annotation)

def do_arg(self, node):
    if getattr(node, 'annotation', None):
        return '%s: %s' % (node.arg, self.visit(node.annotation))
    else:
        return node.arg
</t>
<t tx="ekr.20160318141204.33">
# Attribute(expr value, identifier attr, expr_context ctx)

def do_Attribute(self, node):
    return '%s.%s' % (
        self.visit(node.value),
        node.attr) # Don't visit node.attr: it is always a string.

</t>
<t tx="ekr.20160318141204.34">
def do_Bytes(self, node): # Python 3.x only.
    return str(node.s)

</t>
<t tx="ekr.20160318141204.35">
# Call(expr func, expr* args, keyword* keywords, expr? starargs, expr? kwargs)

def do_Call(self, node):
    func = self.visit(node.func)
    args = [self.visit(z) for z in node.args]
    for z in node.keywords:
        # Calls f.do_keyword.
        args.append(self.visit(z))
    if getattr(node, 'starargs', None):
        args.append('*%s' % (self.visit(node.starargs)))
    if getattr(node, 'kwargs', None):
        args.append('**%s' % (self.visit(node.kwargs)))
    args = [z for z in args if z] # Kludge: Defensive coding.
    return '%s(%s)' % (func, ','.join(args))

</t>
<t tx="ekr.20160318141204.36">
# keyword = (identifier arg, expr value)

def do_keyword(self, node):
    # node.arg is a string.
    value = self.visit(node.value)
    # This is a keyword *arg*, not a Python keyword!
    return '%s=%s' % (node.arg, value)

</t>
<t tx="ekr.20160318141204.37">
def do_comprehension(self, node):
    result = []
    name = self.visit(node.target) # A name.
    it = self.visit(node.iter) # An attribute.
    result.append('%s in %s' % (name, it))
    ifs = [self.visit(z) for z in node.ifs]
    if ifs:
        result.append(' if %s' % (''.join(ifs)))
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.38">
def do_Dict(self, node):
    result = []
    keys = [self.visit(z) for z in node.keys]
    values = [self.visit(z) for z in node.values]
    if len(keys) == len(values):
        # result.append('{\n' if keys else '{')
        result.append('{')
        items = []
        for i in range(len(keys)):
            items.append('%s:%s' % (keys[i], values[i]))
        result.append(', '.join(items))
        result.append('}')
        # result.append(',\n'.join(items))
        # result.append('\n}' if keys else '}')
    else:
        print('Error: f.Dict: len(keys) != len(values)\nkeys: %s\nvals: %s' % (
            repr(keys), repr(values)))
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.39">
def do_Ellipsis(self, node):
    return '...'

</t>
<t tx="ekr.20160318141204.4">
def is_known_type(s):
    '''
    Return True if s is nothing but a single known type.
    Recursively test inner types in square brackets.
    '''
    return ReduceTypes().is_known_type(s)

</t>
<t tx="ekr.20160318141204.40">
def do_ExtSlice(self, node):
    return ':'.join([self.visit(z) for z in node.dims])

</t>
<t tx="ekr.20160318141204.41">
def do_Index(self, node):
    return self.visit(node.value)

</t>
<t tx="ekr.20160318141204.42">
def do_List(self, node):
    # Not used: list context.
    # self.visit(node.ctx)
    elts = [self.visit(z) for z in node.elts]
    elst = [z for z in elts if z] # Defensive.
    return '[%s]' % ','.join(elts)

</t>
<t tx="ekr.20160318141204.43">
def do_ListComp(self, node):
    elt = self.visit(node.elt)
    gens = [self.visit(z) for z in node.generators]
    gens = [z if z else '&lt;**None**&gt;' for z in gens] # Kludge: probable bug.
    return '%s for %s' % (elt, ''.join(gens))

</t>
<t tx="ekr.20160318141204.44">
def do_Name(self, node):
    return node.id

def do_NameConstant(self, node): # Python 3 only.
    s = repr(node.value)
    return 'bool' if s in ('True', 'False') else s

</t>
<t tx="ekr.20160318141204.45">
def do_Num(self, node):
    return repr(node.n)

</t>
<t tx="ekr.20160318141204.46">
# Python 2.x only

def do_Repr(self, node):
    return 'repr(%s)' % self.visit(node.value)

</t>
<t tx="ekr.20160318141204.47">
def do_Slice(self, node):
    lower, upper, step = '', '', ''
    if getattr(node, 'lower', None) is not None:
        lower = self.visit(node.lower)
    if getattr(node, 'upper', None) is not None:
        upper = self.visit(node.upper)
    if getattr(node, 'step', None) is not None:
        step = self.visit(node.step)
    if step:
        return '%s:%s:%s' % (lower, upper, step)
    else:
        return '%s:%s' % (lower, upper)

</t>
<t tx="ekr.20160318141204.48">
def do_Str(self, node):
    '''This represents a string constant.'''
    return repr(node.s)

</t>
<t tx="ekr.20160318141204.49">
# Subscript(expr value, slice slice, expr_context ctx)

def do_Subscript(self, node):
    value = self.visit(node.value)
    the_slice = self.visit(node.slice)
    return '%s[%s]' % (value, the_slice)

</t>
<t tx="ekr.20160318141204.5">
def merge_types(a1, a2):
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
<t tx="ekr.20160318141204.50">
def do_Tuple(self, node):
    elts = [self.visit(z) for z in node.elts]
    return '(%s)' % ', '.join(elts)
</t>
<t tx="ekr.20160318141204.51">
# Operators...

</t>
<t tx="ekr.20160318141204.52">
def do_BinOp(self, node):
    return '%s%s%s' % (
        self.visit(node.left),
        self.op_name(node.op),
        self.visit(node.right))

</t>
<t tx="ekr.20160318141204.53">
def do_BoolOp(self, node):
    op_name = self.op_name(node.op)
    values = [self.visit(z) for z in node.values]
    return op_name.join(values)

</t>
<t tx="ekr.20160318141204.54">
def do_Compare(self, node):
    result = []
    lt = self.visit(node.left)
    ops = [self.op_name(z) for z in node.ops]
    comps = [self.visit(z) for z in node.comparators]
    result.append(lt)
    if len(ops) == len(comps):
        for i in range(len(ops)):
            result.append('%s%s' % (ops[i], comps[i]))
    else:
        print('can not happen: ops', repr(ops), 'comparators', repr(comps))
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.55">
def do_UnaryOp(self, node):
    return '%s%s' % (
        self.op_name(node.op),
        self.visit(node.operand))

</t>
<t tx="ekr.20160318141204.56">
def do_IfExp(self, node):
    return '%s if %s else %s ' % (
        self.visit(node.body),
        self.visit(node.test),
        self.visit(node.orelse))
</t>
<t tx="ekr.20160318141204.57">
# Statements...

</t>
<t tx="ekr.20160318141204.58">
def do_Assert(self, node):
    test = self.visit(node.test)
    if getattr(node, 'msg', None):
        message = self.visit(node.msg)
        return self.indent('assert %s, %s' % (test, message))
    else:
        return self.indent('assert %s' % test)

</t>
<t tx="ekr.20160318141204.59">
def do_Assign(self, node):
    return self.indent('%s=%s\n' % (
        '='.join([self.visit(z) for z in node.targets]),
        self.visit(node.value)))

</t>
<t tx="ekr.20160318141204.6">
def reduce_types(aList, name=None, trace=False):
    '''
    Return a string containing the reduction of all types in aList.
    The --trace-reduce command-line option sets trace=True.
    If present, name is the function name or class_name.method_name.
    '''
    return ReduceTypes(aList, name, trace).reduce_types()

</t>
<t tx="ekr.20160318141204.60">
def do_AugAssign(self, node):
    return self.indent('%s%s=%s\n' % (
        self.visit(node.target),
        self.op_name(node.op), # Bug fix: 2013/03/08.
        self.visit(node.value)))

</t>
<t tx="ekr.20160318141204.61">
def do_Break(self, node):
    return self.indent('break\n')

</t>
<t tx="ekr.20160318141204.62">
def do_Continue(self, node):
    return self.indent('continue\n')

</t>
<t tx="ekr.20160318141204.63">
def do_Delete(self, node):
    targets = [self.visit(z) for z in node.targets]
    return self.indent('del %s\n' % ','.join(targets))

</t>
<t tx="ekr.20160318141204.64">
def do_ExceptHandler(self, node):
    result = []
    result.append(self.indent('except'))
    if getattr(node, 'type', None):
        result.append(' %s' % self.visit(node.type))
    if getattr(node, 'name', None):
        if isinstance(node.name, ast.AST):
            result.append(' as %s' % self.visit(node.name))
        else:
            result.append(' as %s' % node.name) # Python 3.x.
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.65">
# Python 2.x only

def do_Exec(self, node):
    body = self.visit(node.body)
    args = [] # Globals before locals.
    if getattr(node, 'globals', None):
        args.append(self.visit(node.globals))
    if getattr(node, 'locals', None):
        args.append(self.visit(node.locals))
    if args:
        return self.indent('exec %s in %s\n' % (
            body, ','.join(args)))
    else:
        return self.indent('exec %s\n' % (body))

</t>
<t tx="ekr.20160318141204.66">
def do_For(self, node):
    result = []
    result.append(self.indent('for %s in %s:\n' % (
        self.visit(node.target),
        self.visit(node.iter))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.67">
def do_Global(self, node):
    return self.indent('global %s\n' % (
        ','.join(node.names)))

</t>
<t tx="ekr.20160318141204.68">
def do_If(self, node):
    result = []
    result.append(self.indent('if %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.69">
def do_Import(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('import %s\n' % (
        ','.join(names)))

</t>
<t tx="ekr.20160318141204.7"></t>
<t tx="ekr.20160318141204.70">
def get_import_names(self, node):
    '''Return a list of the the full file names in the import statement.'''
    result = []
    for ast2 in node.names:
        if self.kind(ast2) == 'alias':
            data = ast2.name, ast2.asname
            result.append(data)
        else:
            print('unsupported kind in Import.names list', self.kind(ast2))
    return result

</t>
<t tx="ekr.20160318141204.71">
def do_ImportFrom(self, node):
    names = []
    for fn, asname in self.get_import_names(node):
        if asname:
            names.append('%s as %s' % (fn, asname))
        else:
            names.append(fn)
    return self.indent('from %s import %s\n' % (
        node.module,
        ','.join(names)))
</t>
<t tx="ekr.20160318141204.72">
# Nonlocal(identifier* names)

def do_Nonlocal(self, node):
    
    return self.indent('nonlocal %s\n' % ', '.join(node.names))
</t>
<t tx="ekr.20160318141204.73">
def do_Pass(self, node):
    return self.indent('pass\n')

</t>
<t tx="ekr.20160318141204.74">
# Python 2.x only

def do_Print(self, node):
    vals = []
    for z in node.values:
        vals.append(self.visit(z))
    if getattr(node, 'dest', None):
        vals.append('dest=%s' % self.visit(node.dest))
    if getattr(node, 'nl', None):
        vals.append('nl=%s' % node.nl)
    return self.indent('print(%s)\n' % (
        ','.join(vals)))

</t>
<t tx="ekr.20160318141204.75">
def do_Raise(self, node):
    args = []
    for attr in ('type', 'inst', 'tback'):
        if getattr(node, attr, None) is not None:
            args.append(self.visit(getattr(node, attr)))
    if args:
        return self.indent('raise %s\n' % (
            ','.join(args)))
    else:
        return self.indent('raise\n')

</t>
<t tx="ekr.20160318141204.76">
def do_Return(self, node):
    if node.value:
        return self.indent('return %s\n' % (
            self.visit(node.value).strip()))
    else:
        return self.indent('return\n')

</t>
<t tx="ekr.20160318141204.77">
# Starred(expr value, expr_context ctx)

def do_Starred(self, node):

    return '*' + self.visit(node.value)</t>
<t tx="ekr.20160318141204.79">
# Try(stmt* body, excepthandler* handlers, stmt* orelse, stmt* finalbody)

def do_Try(self, node): # Python 3

    result = []
    self.append(self.indent('try:\n'))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.handlers:
        for z in node.handlers:
            result.append(self.visit(z))
    if node.orelse:
        result.append(self.indent('else:\n'))
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    if node.finalbody:
        result.append(self.indent('finally:\n'))
        for z in node.finalbody:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)
</t>
<t tx="ekr.20160318141204.8">
# Top-level functions

def dump(title, s=None):
    if s:
        print('===== %s...\n%s\n' % (title, s.rstrip()))
    else:
        print('===== %s...\n' % title)
</t>
<t tx="ekr.20160318141204.80">
def do_TryExcept(self, node):
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
<t tx="ekr.20160318141204.81">
def do_TryFinally(self, node):
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
<t tx="ekr.20160318141204.82">
def do_While(self, node):
    result = []
    result.append(self.indent('while %s:\n' % (
        self.visit(node.test))))
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    if node.orelse:
        result.append('else:\n')
        for z in node.orelse:
            self.level += 1
            result.append(self.visit(z))
            self.level -= 1
    return ''.join(result)

</t>
<t tx="ekr.20160318141204.83">
# 2:  With(expr context_expr, expr? optional_vars, 
#          stmt* body)
# 3:  With(withitem* items,
#          stmt* body)
# withitem = (expr context_expr, expr? optional_vars)

def do_With(self, node):
    result = []
    result.append(self.indent('with '))
    vars_list = []
    if getattr(node, 'context_expression', None):
        result.append(self.visit(node.context_expresssion))
    if getattr(node, 'optional_vars', None):
        try:
            for z in node.optional_vars:
                vars_list.append(self.visit(z))
        except TypeError: # Not iterable.
            vars_list.append(self.visit(node.optional_vars))
    if getattr(node, 'items', None): # Python 3.
        for item in node.items:
            result.append(self.visit(item.context_expr))
            if getattr(item, 'optional_vars', None):
                try:
                    for z in item.optional_vars:
                        vars_list.append(self.visit(z))
                except TypeError: # Not iterable.
                    vars_list.append(self.visit(item.optional_vars))
    result.append(','.join(vars_list))
    result.append(':\n')
    for z in node.body:
        self.level += 1
        result.append(self.visit(z))
        self.level -= 1
    result.append('\n')
    return ''.join(result)
</t>
<t tx="ekr.20160318141204.84">
def do_Yield(self, node):
    if getattr(node, 'value', None):
        return self.indent('yield %s\n' % (
            self.visit(node.value)))
    else:
        return self.indent('yield\n')
</t>
<t tx="ekr.20160318141204.85">
# YieldFrom(expr value)

def do_YieldFrom(self, node):
    
    return self.indent('yield from %s\n' % (
        self.visit(node.value)))
</t>
<t tx="ekr.20160318141204.86">
# Utils...

</t>
<t tx="ekr.20160318141204.87">
def kind(self, node):
    '''Return the name of node's class.'''
    return node.__class__.__name__
</t>
<t tx="ekr.20160318141204.88">
def indent(self, s):
    return '%s%s' % (' ' * 4 * self.level, s)
</t>
<t tx="ekr.20160318141204.89">
@nobeautify

def op_name (self,node,strict=True):
    '''Return the print name of an operator node.'''
    d = {
        # Binary operators. 
        'Add':       '+',
        'BitAnd':    '&amp;',
        'BitOr':     '|',
        'BitXor':    '^',
        'Div':       '/',
        'FloorDiv':  '//',
        'LShift':    '&lt;&lt;',
        'Mod':       '%',
        'Mult':      '*',
        'Pow':       '**',
        'RShift':    '&gt;&gt;',
        'Sub':       '-',
        # Boolean operators.
        'And':   ' and ',
        'Or':    ' or ',
        # Comparison operators
        'Eq':    '==',
        'Gt':    '&gt;',
        'GtE':   '&gt;=',
        'In':    ' in ',
        'Is':    ' is ',
        'IsNot': ' is not ',
        'Lt':    '&lt;',
        'LtE':   '&lt;=',
        'NotEq': '!=',
        'NotIn': ' not in ',
        # Context operators.
        'AugLoad':  '&lt;AugLoad&gt;',
        'AugStore': '&lt;AugStore&gt;',
        'Del':      '&lt;Del&gt;',
        'Load':     '&lt;Load&gt;',
        'Param':    '&lt;Param&gt;',
        'Store':    '&lt;Store&gt;',
        # Unary operators.
        'Invert':   '~',
        'Not':      ' not ',
        'UAdd':     '+',
        'USub':     '-',
    }
    name = d.get(self.kind(node),'&lt;%s&gt;' % node.__class__.__name__)
    if strict: assert name,self.kind(node)
    return name
</t>
<t tx="ekr.20160318141204.9">
def dump_dict(title, d):
    '''Dump a dictionary with a header.'''
    dump(title)
    for z in sorted(d):
        print('%30s %s' % (z, d.get(z)))
    print('')

</t>
<t tx="ekr.20160318141204.90">

class AstArgFormatter (AstFormatter):
    '''
    Just like the AstFormatter class, except it prints the class
    names of constants instead of actual values.
    '''
    @others
</t>
<t tx="ekr.20160318141204.91">
# Return generic markers to allow better pattern matches.

def do_BoolOp(self, node): # Python 2.x only.
    return 'bool'

def do_Bytes(self, node): # Python 3.x only.
    return 'bytes' # return str(node.s)

def do_Name(self, node):
    return 'bool' if node.id in ('True', 'False') else node.id

def do_Num(self, node):
    return 'number' # return repr(node.n)

def do_Str(self, node):
    '''This represents a string constant.'''
    return 'str' # return repr(node.s)
</t>
<t tx="ekr.20160318141204.92">

class LeoGlobals:
    '''A class supporting g.pdb and g.trace for compatibility with Leo.'''
    @others
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
<t tx="ekr.20160318141204.94">
def _callerName(self, n=1, files=False):
    # print('_callerName: %s %s' % (n,files))
    try: # get the function name from the call stack.
        f1 = sys._getframe(n) # The stack frame, n levels up.
        code1 = f1.f_code # The code object
        name = code1.co_name
        if name == '__init__':
            name = '__init__(%s,line %s)' % (
                self.shortFileName(code1.co_filename), code1.co_firstlineno)
        if files:
            return '%s:%s' % (self.shortFileName(code1.co_filename), name)
        else:
            return name # The code name
    except ValueError:
        # print('g._callerName: ValueError',n)
        return '' # The stack is not deep enough.
    except Exception:
        # es_exception()
        return '' # "&lt;no caller name&gt;"
</t>
<t tx="ekr.20160318141204.95">
def callers(self, n=4, count=0, excludeCaller=True, files=False):
    '''Return a list containing the callers of the function that called g.callerList.

    If the excludeCaller keyword is True (the default), g.callers is not on the list.

    If the files keyword argument is True, filenames are included in the list.
    '''
    # sys._getframe throws ValueError in both cpython and jython if there are less than i entries.
    # The jython stack often has less than 8 entries,
    # so we must be careful to call g._callerName with smaller values of i first.
    result = []
    i = 3 if excludeCaller else 2
    while 1:
        s = self._callerName(i, files=files)
        # print(i,s)
        if s:
            result.append(s)
        if not s or len(result) &gt;= n: break
        i += 1
    result.reverse()
    if count &gt; 0: result = result[: count]
    sep = '\n' if files else ','
    return sep.join(result)
</t>
<t tx="ekr.20160318141204.96">
def cls(self):
    '''Clear the screen.'''
    if sys.platform.lower().startswith('win'):
        os.system('cls')
</t>
<t tx="ekr.20160318141204.97">
def isString(self, s):
    '''Return True if s is any string, but not bytes.'''
    # pylint: disable=no-member
    if isPython3:
        return isinstance(s, str)
    else:
        return isinstance(s, types.StringTypes)

def isUnicode(self, s):
    '''Return True if s is a unicode string.'''
    # pylint: disable=no-member
    if isPython3:
        return isinstance(s, str)
    else:
        return isinstance(s, types.UnicodeType)
</t>
<t tx="ekr.20160318141204.98">
def pdb(self):
    try:
        import leo.core.leoGlobals as leo_g
        leo_g.pdb()
    except ImportError:
        import pdb
        pdb.set_trace()
</t>
<t tx="ekr.20160318141204.99">
def shortFileName(self,fileName, n=None):
    if n is None or n &lt; 1:
        return os.path.basename(fileName)
    else:
        return '/'.join(fileName.replace('\\', '/').split('/')[-n:])
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
</tnodes>
</leo_file>
