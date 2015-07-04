import cygroonga as grn

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
        id, added = table1.add_record("foo")
        table1.column("column1").set_string(id, "foo1")
        print("id=%d, added=%d" % (id, added))
        db.remove()
