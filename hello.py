import cygroonga as grn
import datetime

with grn.Groonga():
    with grn.Context() as ctx:
        db = ctx.open_or_create_database("test.db")
        table1 = ctx.open_or_create_table("table1",
                grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        print("table1 path: %s" % table1.path())
        print("table1 name: %s" % table1.name())
        table1.open_or_create_column("column1",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                ctx.at(grn.DB_TEXT))
        table1.open_or_create_column("created_at",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                ctx.at(grn.DB_TIME))
        id, added = table1.add_record("foo")
        print("id=%d, added=%s" % (id, added))
        table1.column("column1").set_string(id, "foo1")
        table1.column("created_at").set_time(id, datetime.datetime.now())

        print("record count=%d" % table1.record_count())

        id = table1.get_record("foo")
        print("id=%d" % id)
        print("column1 value=%s" % table1.column("column1").get_string(id))
        print("created_at value=%s" % table1.column("created_at").get_time(id))

        index_table1 = ctx.open_or_create_table("table1_index",
                grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        index_table1.set_default_tokenizer("TokenBigram")
        index_table1.open_or_create_index_column("table1_index",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_INDEX |
                grn.OBJ_WITH_POSITION | grn.OBJ_WITH_SECTION,
                "table1", ["_key"])

        q = table1.create_query()
        print("after create_query")
        q.parse("_key:@foo", None, grn.OP_MATCH, grn.OP_AND,
                grn.EXPR_SYNTAX_QUERY | grn.EXPR_ALLOW_PRAGMA | grn.EXPR_ALLOW_COLUMN)
        print("after parse")
        records = table1.select(q)
        print("matched record count=%d" % records.record_count())
        with records.open_table_cursor() as c:
            while True:
                record_id = c.next()
                if not record_id:
                    break
                print("record_id=%d" % record_id)

        #db.remove()
