import cygroonga

cygroonga.init()
ctx = cygroonga.Context()
ctx.db_create("test.db")
ctx.fin()
cygroonga.fin()
