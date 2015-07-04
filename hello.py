import cygroonga as grn

with grn.Groonga():
    with grn.Context() as ctx:
        db = ctx.open_or_create_database("test.db")
        table1 = ctx.open_or_create_table("table1",
                grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
        print("table1 path: %s" % table1.path())
        print("table1 name: %s" % table1.name())
        column1 = table1.open_or_create_column("column1",
                grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                ctx.at(grn.DB_TEXT))
        print("column1 path: %s" % column1.path())
        print("column1 name: %s" % column1.name())
        id, added = table1.add_record("foo")
        print("id=%d, added=%d" % (id, added))
        #column1.remove()
        #table1.remove()
        #db.remove()
