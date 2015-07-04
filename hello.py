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
        print("id=%d, added=%d" % (id, added))
        table1.column("column1").set_string(id, "foo1")
        print("column1 value=%s" % table1.column("column1").get_string(id))
        table1.column("created_at").set_time(id, datetime.datetime.now())
        print("created_at value=%s" % table1.column("created_at").get_time(id))
        #db.remove()
