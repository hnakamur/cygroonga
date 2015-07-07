import cygroonga as grn
import datetime
import os
import shutil
import tempfile

def test_table_cursor():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                table1 = ctx.create_table("Table1",
                        grn.OBJ_TABLE_HASH_KEY | grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))
                table1_index = ctx.create_table("Table1Index",
                        grn.OBJ_TABLE_PAT_KEY | grn.OBJ_KEY_NORMALIZE |
                        grn.OBJ_PERSISTENT,
                        ctx.at(grn.DB_SHORT_TEXT))
                table1_index.set_default_tokenizer("TokenBigram")
                content_column = table1.create_column("content",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TEXT))
                updated_at_column = table1.create_column("updated_at",
                        grn.OBJ_PERSISTENT | grn.OBJ_COLUMN_SCALAR,
                        ctx.at(grn.DB_TIME))

                record_id1, added = table1.add_record("key1")
                content_column.set_string(record_id1, "content1")
                time1 = datetime.datetime(2015, 5, 24, 12, 34, 56, 789)
                updated_at_column.set_time(record_id1, time1)
                assert table1.record_count() == 1

                record_id2, added = table1.add_record("key2")
                content_column.set_string(record_id2, "content2")
                time1 = datetime.datetime(2015, 5, 23, 10, 30, 50, 123)
                updated_at_column.set_time(record_id2, time1)
                assert table1.record_count() == 2

                record_id3, added = table1.add_record("key3")
                content_column.set_string(record_id3, "content3")
                time1 = datetime.datetime(2015, 5, 23, 10, 31, 50, 123)
                updated_at_column.set_time(record_id3, time1)
                assert table1.record_count() == 3

                expr = table1.create_query()
                expr.parse("_key:@key1 OR _key:@key2", None, grn.OP_MATCH, grn.OP_AND,
                        grn.EXPR_SYNTAX_QUERY | grn.EXPR_ALLOW_PRAGMA |
                        grn.EXPR_ALLOW_COLUMN)
                records = table1.select(expr, None, grn.OP_OR)
                assert records.record_count() == 2

                i = 0
                cursor = records.open_table_cursor()
                try:
                    while True:
                        record_id  = cursor.next()
                        if not record_id:
                            break

                        if i == 0:
                            assert record_id == record_id1
                        elif i == 1:
                            assert record_id == record_id2

                        i += 1
                finally:
                    cursor.close()
    finally:
        shutil.rmtree(work_dir)
