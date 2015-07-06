import cygroonga as grn
import os
import shutil
import tempfile

def test_create_column():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column1_name = "column1"
                column1_path = db_path + "." + column1_name
                column1 = table1.create_column(column1_name,
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT),
                        path=column1_path)

                assert column1.name() == table1_name + "." + column1_name
                assert column1.path() == column1_path
                assert os.path.isfile(column1_path)
    finally:
        shutil.rmtree(work_dir)

def test_open_column():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column1_name = "column1"
                column1_path = db_path + "." + column1_name
                column1 = table1.create_column(column1_name,
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT),
                        path=column1_path)

                assert column1.name() == table1_name + "." + column1_name
                assert column1.path() == column1_path
                assert os.path.isfile(column1_path)

                column1.close()
                assert os.path.isfile(column1_path)

                column1 = table1.column(column1_name)
                assert column1.name() == table1_name + "." + column1_name
                assert column1.path() == column1_path
                assert os.path.isfile(column1_path)
    finally:
        shutil.rmtree(work_dir)

def test_remove_column():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column1_name = "column1"
                column1_path = db_path + "." + column1_name
                column1 = table1.create_column(column1_name,
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT),
                        path=column1_path)

                assert column1.name() == table1_name + "." + column1_name
                assert column1.path() == column1_path
                assert os.path.isfile(column1_path)

                column1.remove()
                assert not os.path.isfile(column1_path)
    finally:
        shutil.rmtree(work_dir)

def test_open_non_existent_column():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column1_name = "column1"

                column1 = table1.column(column1_name)
                assert not column1
    finally:
        shutil.rmtree(work_dir)

def test_create_index_column():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1 = ctx.create_table("Table1",
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))
                table1.create_column("content",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT))
                table1.create_column("updated_at",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TIME))

                table1_index = ctx.create_table("Table1Index",
                        grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                        grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))
                table1_index.set_default_tokenizer("TokenBigram")
                table1_index_column_path = db_path + ".table1_index"
                column = table1_index.create_index_column("table1_index",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_INDEX |
                        grn.OBJ_WITH_POSITION | grn.OBJ_WITH_SECTION,
                        "Table1",
                        ["_key", "content"])
                #assert column.name() == "table1_index"
                #assert column.path() == table1_index_column_path
                #assert os.path.isfile(table1_index_column_path)
    finally:
        shutil.rmtree(work_dir)
