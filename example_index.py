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

        index_table1 = ctx.open_or_create_table("table1_index",
                grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        index_table1.set_default_tokenizer("TokenBigram")
        print("before create_index_column")
        index_table1.create_index_column("table1_index",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_INDEX |
                grn.OBJ_WITH_POSITION | grn.OBJ_WITH_SECTION,
                "table1", ["_key", "content"])
