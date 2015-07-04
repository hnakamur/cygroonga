cimport ccygroonga as cgrn
from libc.stdlib cimport malloc, free
import datetime, time

# obj constants
OBJ_TABLE_TYPE_MASK = cgrn.GRN_OBJ_TABLE_TYPE_MASK
OBJ_TABLE_HASH_KEY = cgrn.GRN_OBJ_TABLE_HASH_KEY
OBJ_TABLE_PAT_KEY = cgrn.GRN_OBJ_TABLE_PAT_KEY
OBJ_TABLE_DAT_KEY = cgrn.GRN_OBJ_TABLE_DAT_KEY
OBJ_TABLE_NO_KEY = cgrn.GRN_OBJ_TABLE_NO_KEY

OBJ_KEY_MASK = cgrn.GRN_OBJ_KEY_MASK
OBJ_KEY_UINT = cgrn.GRN_OBJ_KEY_UINT
OBJ_KEY_INT = cgrn.GRN_OBJ_KEY_INT
OBJ_KEY_FLOAT = cgrn.GRN_OBJ_KEY_FLOAT
OBJ_KEY_GEO_POINT = cgrn.GRN_OBJ_KEY_GEO_POINT

OBJ_KEY_WITH_SIS = cgrn.GRN_OBJ_KEY_WITH_SIS
OBJ_KEY_NORMALIZE = cgrn.GRN_OBJ_KEY_NORMALIZE

OBJ_COLUMN_TYPE_MASK = cgrn.GRN_OBJ_COLUMN_TYPE_MASK
OBJ_COLUMN_SCALAR = cgrn.GRN_OBJ_COLUMN_SCALAR
OBJ_COLUMN_VECTOR = cgrn.GRN_OBJ_COLUMN_VECTOR
OBJ_COLUMN_INDEX = cgrn.GRN_OBJ_COLUMN_INDEX

OBJ_COMPRESS_MASK = cgrn.GRN_OBJ_COMPRESS_MASK
OBJ_COMPRESS_NONE = cgrn.GRN_OBJ_COMPRESS_NONE
OBJ_COMPRESS_ZLIB = cgrn.GRN_OBJ_COMPRESS_ZLIB
OBJ_COMPRESS_LZ4 = cgrn.GRN_OBJ_COMPRESS_LZ4

OBJ_WITH_SECTION = cgrn.GRN_OBJ_WITH_SECTION
OBJ_WITH_WEIGHT = cgrn.GRN_OBJ_WITH_WEIGHT
OBJ_WITH_POSITION = cgrn.GRN_OBJ_WITH_POSITION
OBJ_RING_BUFFER = cgrn.GRN_OBJ_RING_BUFFER

OBJ_UNIT_MASK = cgrn.GRN_OBJ_UNIT_MASK
OBJ_UNIT_DOCUMENT_NONE = cgrn.GRN_OBJ_UNIT_DOCUMENT_NONE
OBJ_UNIT_DOCUMENT_SECTION = cgrn.GRN_OBJ_UNIT_DOCUMENT_SECTION
OBJ_UNIT_DOCUMENT_POSITION = cgrn.GRN_OBJ_UNIT_DOCUMENT_POSITION
OBJ_UNIT_SECTION_NONE = cgrn.GRN_OBJ_UNIT_SECTION_NONE
OBJ_UNIT_SECTION_POSITION = cgrn.GRN_OBJ_UNIT_SECTION_POSITION
OBJ_UNIT_POSITION_NONE = cgrn.GRN_OBJ_UNIT_POSITION_NONE
OBJ_UNIT_USERDEF_DOCUMENT = cgrn.GRN_OBJ_UNIT_USERDEF_DOCUMENT
OBJ_UNIT_USERDEF_SECTION = cgrn.GRN_OBJ_UNIT_USERDEF_SECTION
OBJ_UNIT_USERDEF_POSITION = cgrn.GRN_OBJ_UNIT_USERDEF_POSITION

OBJ_NO_SUBREC = cgrn.GRN_OBJ_NO_SUBREC
OBJ_WITH_SUBREC = cgrn.GRN_OBJ_WITH_SUBREC

OBJ_KEY_VAR_SIZE = cgrn.GRN_OBJ_KEY_VAR_SIZE

OBJ_TEMPORARY = cgrn.GRN_OBJ_TEMPORARY
OBJ_PERSISTENT = cgrn.GRN_OBJ_PERSISTENT

# obj types
VOID = cgrn.GRN_VOID
BULK = cgrn.GRN_BULK
PTR = cgrn.GRN_PTR
UVECTOR = cgrn.GRN_UVECTOR
PVECTOR = cgrn.GRN_PVECTOR
VECTOR = cgrn.GRN_VECTOR
MSG = cgrn.GRN_MSG
QUERY = cgrn.GRN_QUERY
ACCESSOR = cgrn.GRN_ACCESSOR
SNIP = cgrn.GRN_SNIP
PATSNIP = cgrn.GRN_PATSNIP
STRING = cgrn.GRN_STRING
CURSOR_TABLE_HASH_KEY = cgrn.GRN_CURSOR_TABLE_HASH_KEY
CURSOR_TABLE_PAT_KEY = cgrn.GRN_CURSOR_TABLE_PAT_KEY
CURSOR_TABLE_DAT_KEY = cgrn.GRN_CURSOR_TABLE_DAT_KEY
CURSOR_TABLE_NO_KEY = cgrn.GRN_CURSOR_TABLE_NO_KEY
CURSOR_COLUMN_INDEX = cgrn.GRN_CURSOR_COLUMN_INDEX
CURSOR_COLUMN_GEO_INDEX = cgrn.GRN_CURSOR_COLUMN_GEO_INDEX
TYPE = cgrn.GRN_TYPE
PROC = cgrn.GRN_PROC
EXPR = cgrn.GRN_EXPR
TABLE_HASH_KEY = cgrn.GRN_TABLE_HASH_KEY
TABLE_PAT_KEY = cgrn.GRN_TABLE_PAT_KEY
TABLE_DAT_KEY = cgrn.GRN_TABLE_DAT_KEY
TABLE_NO_KEY = cgrn.GRN_TABLE_NO_KEY
DB = cgrn.GRN_DB
COLUMN_FIX_SIZE = cgrn.GRN_COLUMN_FIX_SIZE
COLUMN_VAR_SIZE = cgrn.GRN_COLUMN_VAR_SIZE
COLUMN_INDEX = cgrn.GRN_COLUMN_INDEX

# builtin types
DB_VOID = cgrn.GRN_DB_VOID
DB_DB = cgrn.GRN_DB_DB
DB_OBJECT = cgrn.GRN_DB_OBJECT
DB_BOOL = cgrn.GRN_DB_BOOL
DB_INT8 = cgrn.GRN_DB_INT8
DB_UINT8 = cgrn.GRN_DB_UINT8
DB_INT16 = cgrn.GRN_DB_INT16
DB_UINT16 = cgrn.GRN_DB_UINT16
DB_INT32 = cgrn.GRN_DB_INT32
DB_UINT32 = cgrn.GRN_DB_UINT32
DB_INT64 = cgrn.GRN_DB_INT64
DB_UINT64 = cgrn.GRN_DB_UINT64
DB_FLOAT = cgrn.GRN_DB_FLOAT
DB_TIME = cgrn.GRN_DB_TIME
DB_SHORT_TEXT = cgrn.GRN_DB_SHORT_TEXT
DB_TEXT = cgrn.GRN_DB_TEXT
DB_LONG_TEXT = cgrn.GRN_DB_LONG_TEXT
DB_TOKYO_GEO_POINT = cgrn.GRN_DB_TOKYO_GEO_POINT
DB_WGS84_GEO_POINT = cgrn.GRN_DB_WGS84_GEO_POINT

cdef class Groonga:
    def __enter__(self):
        _check_rc(cgrn.grn_init())

    def __exit__(self, exc_type, exc_value, traceback):
        _check_rc(cgrn.grn_fin())

class GroongaException(Exception):
    def __init__(self, rc, message=None):
        self.rc = rc
        self.message = message
    def __str__(self):
        return "error in groonga. rc=%s, message=%s" % (self.rc, self.message)

cdef _check_rc(rc, cgrn.grn_ctx* c_ctx=NULL):
    if rc != cgrn.GRN_SUCCESS:
        if c_ctx == NULL:
            raise GroongaException(rc)
        else:
            raise GroongaException(rc, c_ctx.errbuf.decode('UTF-8'))

cdef class Context:
    cdef cgrn.grn_ctx* _c_ctx

    def __cinit__(self):
        self._c_ctx = cgrn.grn_ctx_open(0)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def close(self):
        c_ctx = self._c_ctx
        if c_ctx != NULL:
            _check_rc(cgrn.grn_ctx_fin(c_ctx), c_ctx)
            self._c_ctx = NULL

    def create_database(self, path):
        c_path = path.encode('UTF-8')
        c_db = cgrn.grn_db_create(self._c_ctx, c_path, NULL)
        return _new_database(self, c_db)

    def open_database(self, path):
        c_path = path.encode('UTF-8')
        c_db = cgrn.grn_db_open(self._c_ctx, c_path)
        return _new_database(self, c_db)

    def open_or_create_database(self, path):
        db = self.open_database(path)
        if db is None:
            db = self.create_database(path)
        return db

    def create_table(self, name, flags, Object key_type, Object value_type=None, path=None):
        py_name = name.encode('UTF-8')
        cdef const char* c_name = py_name

        cdef const char* c_path
        if path is None:
            c_path = NULL
        else:
            py_path = path.encode('UTF-8')
            c_path = py_path

        cdef cgrn.grn_obj* c_value_type
        if value_type is None:
            c_value_type = NULL
        else:
            c_value_type = value_type._c_obj

        c_table = cgrn.grn_table_create(self._c_ctx,
                c_name, len(c_name), c_path, flags, key_type._c_obj,
                c_value_type)
        return _new_table(self, c_table)

    def open_table(self, name):
        py_name = name.encode('UTF-8')
        cdef const char* c_name = py_name

        c_table = cgrn.grn_ctx_get(self._c_ctx, c_name, len(c_name))
        return _new_table(self, c_table)

    def open_or_create_table(self, name, flags, Object key_type, Object value_type=None, path=None):
        table = self.open_table(name)
        if table is None:
            table = self.create_table(name, flags, key_type, value_type, path)
        return table

    def at(self, cgrn.grn_id id):
        return _new_object(self, cgrn.grn_ctx_at(self._c_ctx, id))

cdef class Object:
    cdef Context context
    cdef cgrn.grn_obj* _c_obj

    def __init__(self, context):
        self.context = context

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def close(self):
        if self._c_obj != NULL:
            c_ctx = self.context._c_ctx
            _check_rc(cgrn.grn_obj_unlink(c_ctx, self._c_obj), c_ctx)
            self._c_obj = NULL

    def remove(self):
        c_ctx = self.context._c_ctx
        c_obj = self._c_obj
        _check_rc(cgrn.grn_obj_remove(c_ctx, c_obj), c_ctx)

    def path(self):
        c_ctx = self.context._c_ctx
        c_obj = self._c_obj
        return cgrn.grn_obj_path(c_ctx, c_obj).decode('UTF-8')

    def name(self):
        c_ctx = self.context._c_ctx
        c_obj = self._c_obj
        cdef int length = cgrn.grn_obj_name(c_ctx, c_obj, NULL, 0)
        if length == 0:
            return ""
        cdef char* buf = <char*>malloc(sizeof(char) * length)
        try:
            cgrn.grn_obj_name(c_ctx, c_obj, buf, length)
            return buf.decode('UTF-8')
        finally:
            free(buf)

cdef _new_object(Context context, cgrn.grn_obj* c_obj):
    if c_obj == NULL:
        return None
    else:
        obj = Object(context)
        obj._c_obj = c_obj
        return obj


cdef class Database(Object):
    pass

cdef _new_database(Context context, cgrn.grn_obj* c_db):
    if c_db == NULL:
        return None
    else:
        db = Database(context)
        db._c_obj = c_db
        return db


cdef class Records(Object):
    def column(self, name):
        py_name = name.encode('UTF-8')
        cdef const char* c_name = py_name
        c_ctx = self.context._c_ctx
        c_column = cgrn.grn_obj_column(c_ctx, self._c_obj, c_name, len(c_name))
        return _new_column(self.context, c_column)

cdef _new_records(Context context, cgrn.grn_obj* c_records):
    if c_records == NULL:
        return None
    else:
        records = Records(context)
        records._c_obj = c_records
        return records


cdef class Table(Records):
    def create_column(self, name, flags, Object column_type, path=None):
        py_name = name.encode('UTF-8')
        cdef const char* c_name = py_name

        cdef const char* c_path
        if path is None:
            c_path = NULL
        else:
            py_path = path.encode('UTF-8')
            c_path = py_path

        cdef cgrn.grn_obj* c_column_type
        if column_type is None:
            c_column_type = NULL
        else:
            c_column_type = column_type._c_obj

        c_ctx = self.context._c_ctx
        c_column = cgrn.grn_column_create(c_ctx, self._c_obj,
                c_name, len(c_name), c_path, flags, c_column_type)
        return _new_column(self.context, c_column)

    def open_or_create_column(self, name, flags, Object column_type, path=None):
        column = self.column(name)
        if column is None:
            column = self.create_column(name, flags, column_type, path)
        return column

    def add_record(self, key=None):
        cdef const char* c_key
        if key is None:
            c_key = NULL
        else:
            py_key = key.encode('UTF-8')
            c_key = py_key

        c_ctx = self.context._c_ctx
        cdef bint c_added
        c_id = cgrn.grn_table_add(c_ctx, self._c_obj,
                c_key, len(c_key), &c_added)
        return (c_id, c_added)


cdef _new_table(Context context, cgrn.grn_obj* c_table):
    if c_table == NULL:
        return None
    else:
        table = Table(context)
        table._c_obj = c_table
        return table


cdef class Column(Object):
    def set_string(self, record_id, s):
        cdef const char* c_s
        if s is None:
            c_s = NULL
        else:
            py_s = s.encode('UTF-8')
            c_s = py_s
        c_ctx = self.context._c_ctx
        cdef cgrn.grn_obj buf
        cgrn.GRN_TEXT_INIT(&buf, 0)
        cgrn.GRN_TEXT_PUT(c_ctx, &buf, c_s, len(c_s))
        _check_rc(cgrn.grn_obj_set_value(c_ctx, self._c_obj, record_id, &buf, cgrn.GRN_OBJ_SET), c_ctx)

    def get_string(self, record_id):
        c_ctx = self.context._c_ctx
        cdef cgrn.grn_obj buf
        cgrn.GRN_TEXT_INIT(&buf, 0)
        cgrn.grn_obj_get_value(c_ctx, self._c_obj, record_id, &buf)
        return cgrn.GRN_TEXT_VALUE(&buf)[:cgrn.GRN_TEXT_LEN(&buf)].decode('UTF-8')

    def set_time(self, record_id, dt):
        c_ctx = self.context._c_ctx
        cdef cgrn.grn_obj buf
        cgrn.GRN_TIME_INIT(&buf, 0)
        cdef long long int micro_sec = time.mktime(dt.timetuple()) * 1e6
        cgrn.GRN_TIME_SET(c_ctx, &buf, micro_sec)
        _check_rc(cgrn.grn_obj_set_value(c_ctx, self._c_obj, record_id, &buf, cgrn.GRN_OBJ_SET), c_ctx)

    def get_time(self, record_id):
        c_ctx = self.context._c_ctx
        cdef cgrn.grn_obj buf
        cgrn.GRN_TIME_INIT(&buf, 0)
        cgrn.grn_obj_get_value(c_ctx, self._c_obj, record_id, &buf)
        cdef long long int micro_sec = 0
        if cgrn.GRN_BULK_VSIZE(&buf) != 0:
            micro_sec = cgrn.GRN_TIME_VALUE(&buf)
        return datetime.datetime.fromtimestamp(micro_sec / 1e6)

cdef _new_column(Context context, cgrn.grn_obj* c_column):
    if c_column == NULL:
        return None
    else:
        column = Column(context)
        column._c_obj = c_column
        return column
