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
