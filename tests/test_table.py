import cygroonga as grn
import os
import shutil
import tempfile

def test_create_table():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1_path = db_path + ".Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT),
                        path=table1_path)
                assert table1.name() == table1_name
                assert table1.path() == table1_path
                assert os.path.isfile(table1_path)
    finally:
        shutil.rmtree(work_dir)

def test_open_table():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1_path = db_path + ".Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT),
                        path=table1_path)
                assert table1.name() == table1_name
                assert table1.path() == table1_path
                assert os.path.isfile(table1_path)

                table1.close()
                assert os.path.isfile(table1_path)

                table1 = ctx.open_table(table1_name)
                assert table1.name() == table1_name
                assert table1.path() == table1_path
    finally:
        shutil.rmtree(work_dir)

def test_remove_table():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1_path = db_path + ".Table1"
                table1 = ctx.create_table(table1_name,
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT),
                        path=table1_path)
                assert table1.name() == table1_name
                assert table1.path() == table1_path
                assert os.path.isfile(table1_path)

                table1.remove()
                assert not os.path.isfile(table1_path)
    finally:
        shutil.rmtree(work_dir)

# I got a "Segmentation fault: 11" error
# def test_remove_closed_table():
#     work_dir = tempfile.mkdtemp()
#     try:
#         with grn.Groonga():
#             with grn.Context() as ctx:
#                 db_path = os.path.join(work_dir, "test.db")
#                 ctx.create_database(db_path)
#                 table1_name = "Table1"
#                 table1_path = db_path + ".Table1"
#                 table1 = ctx.create_table(table1_name,
#                         grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
#                         ctx.at(grn.DB_SHORT_TEXT),
#                         path=table1_path)
#                 assert table1.name() == table1_name
#                 assert table1.path() == table1_path
#                 assert os.path.isfile(table1_path)
#
#                 table1.close()
#                 assert os.path.isfile(table1_path)
#
#                 table1.remove()
#                 assert not os.path.isfile(table1_path)
#     finally:
#         shutil.rmtree(work_dir)
