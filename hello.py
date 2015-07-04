import cygroonga as grn

with grn.Groonga():
    with grn.Context() as ctx:
        ctx.open_or_create_database("test.db")
        table = ctx.open_or_create_table("table1",
                grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                ctx.at(grn.DB_SHORT_TEXT))
