import cygroonga as grn
import datetime
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

def test_open_non_existent_table():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_name = "Table1"
                table1 = ctx.open_table(table1_name)
                assert not table1
    finally:
        shutil.rmtree(work_dir)

def test_add_record():
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

                record_id, added = table1.add_record("key1")
                assert added
                assert table1.column("_key").get_string(record_id), "key1"
    finally:
        shutil.rmtree(work_dir)

def test_get_record():
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

                record_id, added = table1.add_record("key1")
                assert added
                assert table1.get_record("key1"), record_id
    finally:
        shutil.rmtree(work_dir)

def test_set_string():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1 = ctx.create_table("Table1",
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column = table1.create_column("content",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT))

                record_id, added = table1.add_record("key1")
                content1 = "foo bar baz"
                column.set_string(record_id, content1)
                assert column.get_string(record_id), content1
    finally:
        shutil.rmtree(work_dir)

def test_set_time():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1 = ctx.create_table("Table1",
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))

                column = table1.create_column("updated_at",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TIME))

                record_id, added = table1.add_record("key1")
                time1 = datetime.datetime(2015, 5, 24, 12, 34, 56, 789)
                column.set_time(record_id, time1)
                assert column.get_time(record_id), time1
    finally:
        shutil.rmtree(work_dir)

def test_set_default_tokenizer():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1_index = ctx.create_table("Table1Index",
                        grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                        grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))
                table1_index.set_default_tokenizer("TokenBigram")
    finally:
        shutil.rmtree(work_dir)
