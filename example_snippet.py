import cygroonga as grn
import datetime

with grn.Groonga():
    with grn.Context() as ctx:
        db = ctx.open_or_create_database("test.db")
        table1 = ctx.open_or_create_table("table1",
                grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        table1.open_or_create_column("content",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                ctx.at(grn.DB_TEXT))
        table1.open_or_create_column("content2",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                ctx.at(grn.DB_TEXT))

        index_table1 = ctx.open_or_create_table("table1_index",
                grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        index_table1.set_default_tokenizer("TokenBigram")
        print("before create_index_column")
        index_table1.create_index_column("table1_index",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_INDEX |
                grn.OBJ_WITH_POSITION | grn.OBJ_WITH_SECTION,
                "table1", ["_key", "content", "content2"])

        expr = table1.create_query()
        expr.parse("content:@and OR content:@to", None, grn.OP_MATCH, grn.OP_AND,
                grn.EXPR_SYNTAX_QUERY | grn.EXPR_ALLOW_PRAGMA |
                grn.EXPR_ALLOW_COLUMN)

        flags = grn.SNIP_COPY_TAG | grn.SNIP_SKIP_LEADING_SPACES
        text_max_len = 200
        snippet = expr.snippet(flags, text_max_len, 4, True,
                [["<b>", "</b>"], ["<em>", "</em>"]])
        content = """The MIT License (MIT)

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
"""
        snip_results = snippet.execute(content)
        for i, result in enumerate(snip_results):
            print("i=%d, result=%s" % (i, result))
