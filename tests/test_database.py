import cygroonga as grn
import os
import pytest
import shutil
import tempfile

def test_create_database():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                db = ctx.create_database(db_path)
                assert db.path() == db_path
                assert os.path.isfile(db_path)
    finally:
        shutil.rmtree(work_dir)

def test_create_existing_database():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                ctx.create_database(db_path)
                with pytest.raises(grn.GroongaException) as excinfo:
                    ctx.create_database(db_path)
                assert excinfo.value.rc == grn.FILE_EXISTS
    finally:
        shutil.rmtree(work_dir)

def test_open_database():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                db = ctx.create_database(db_path)
                assert os.path.isfile(db_path)

                db.close()
                assert os.path.isfile(db_path)

                db = ctx.open_database(db_path)
                assert db.path() == db_path
    finally:
        shutil.rmtree(work_dir)

def test_remove_database():
    work_dir = tempfile.mkdtemp()
    try:
        with grn.Groonga():
            with grn.Context() as ctx:
                db_path = os.path.join(work_dir, "test.db")
                db = ctx.create_database(db_path)
                assert os.path.isfile(db_path)

                db.remove()
                assert not os.path.isfile(db_path)
    finally:
        shutil.rmtree(work_dir)
