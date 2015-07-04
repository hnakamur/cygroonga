cimport ccygroonga

# obj constants
OBJ_TABLE_TYPE_MASK = ccygroonga.GRN_OBJ_TABLE_TYPE_MASK
OBJ_TABLE_HASH_KEY = ccygroonga.GRN_OBJ_TABLE_HASH_KEY
OBJ_TABLE_PAT_KEY = ccygroonga.GRN_OBJ_TABLE_PAT_KEY
OBJ_TABLE_DAT_KEY = ccygroonga.GRN_OBJ_TABLE_DAT_KEY
OBJ_TABLE_NO_KEY = ccygroonga.GRN_OBJ_TABLE_NO_KEY

OBJ_KEY_MASK = ccygroonga.GRN_OBJ_KEY_MASK
OBJ_KEY_UINT = ccygroonga.GRN_OBJ_KEY_UINT
OBJ_KEY_INT = ccygroonga.GRN_OBJ_KEY_INT
OBJ_KEY_FLOAT = ccygroonga.GRN_OBJ_KEY_FLOAT
OBJ_KEY_GEO_POINT = ccygroonga.GRN_OBJ_KEY_GEO_POINT

OBJ_KEY_WITH_SIS = ccygroonga.GRN_OBJ_KEY_WITH_SIS
OBJ_KEY_NORMALIZE = ccygroonga.GRN_OBJ_KEY_NORMALIZE

OBJ_COLUMN_TYPE_MASK = ccygroonga.GRN_OBJ_COLUMN_TYPE_MASK
OBJ_COLUMN_SCALAR = ccygroonga.GRN_OBJ_COLUMN_SCALAR
OBJ_COLUMN_VECTOR = ccygroonga.GRN_OBJ_COLUMN_VECTOR
OBJ_COLUMN_INDEX = ccygroonga.GRN_OBJ_COLUMN_INDEX

OBJ_COMPRESS_MASK = ccygroonga.GRN_OBJ_COMPRESS_MASK
OBJ_COMPRESS_NONE = ccygroonga.GRN_OBJ_COMPRESS_NONE
OBJ_COMPRESS_ZLIB = ccygroonga.GRN_OBJ_COMPRESS_ZLIB
OBJ_COMPRESS_LZ4 = ccygroonga.GRN_OBJ_COMPRESS_LZ4

OBJ_WITH_SECTION = ccygroonga.GRN_OBJ_WITH_SECTION
OBJ_WITH_WEIGHT = ccygroonga.GRN_OBJ_WITH_WEIGHT
OBJ_WITH_POSITION = ccygroonga.GRN_OBJ_WITH_POSITION
OBJ_RING_BUFFER = ccygroonga.GRN_OBJ_RING_BUFFER

OBJ_UNIT_MASK = ccygroonga.GRN_OBJ_UNIT_MASK
OBJ_UNIT_DOCUMENT_NONE = ccygroonga.GRN_OBJ_UNIT_DOCUMENT_NONE
OBJ_UNIT_DOCUMENT_SECTION = ccygroonga.GRN_OBJ_UNIT_DOCUMENT_SECTION
OBJ_UNIT_DOCUMENT_POSITION = ccygroonga.GRN_OBJ_UNIT_DOCUMENT_POSITION
OBJ_UNIT_SECTION_NONE = ccygroonga.GRN_OBJ_UNIT_SECTION_NONE
OBJ_UNIT_SECTION_POSITION = ccygroonga.GRN_OBJ_UNIT_SECTION_POSITION
OBJ_UNIT_POSITION_NONE = ccygroonga.GRN_OBJ_UNIT_POSITION_NONE
OBJ_UNIT_USERDEF_DOCUMENT = ccygroonga.GRN_OBJ_UNIT_USERDEF_DOCUMENT
OBJ_UNIT_USERDEF_SECTION = ccygroonga.GRN_OBJ_UNIT_USERDEF_SECTION
OBJ_UNIT_USERDEF_POSITION = ccygroonga.GRN_OBJ_UNIT_USERDEF_POSITION

OBJ_NO_SUBREC = ccygroonga.GRN_OBJ_NO_SUBREC
OBJ_WITH_SUBREC = ccygroonga.GRN_OBJ_WITH_SUBREC

OBJ_KEY_VAR_SIZE = ccygroonga.GRN_OBJ_KEY_VAR_SIZE

OBJ_TEMPORARY = ccygroonga.GRN_OBJ_TEMPORARY
OBJ_PERSISTENT = ccygroonga.GRN_OBJ_PERSISTENT

# obj types
VOID = ccygroonga.GRN_VOID
BULK = ccygroonga.GRN_BULK
PTR = ccygroonga.GRN_PTR
UVECTOR = ccygroonga.GRN_UVECTOR
PVECTOR = ccygroonga.GRN_PVECTOR
VECTOR = ccygroonga.GRN_VECTOR
MSG = ccygroonga.GRN_MSG
QUERY = ccygroonga.GRN_QUERY
ACCESSOR = ccygroonga.GRN_ACCESSOR
SNIP = ccygroonga.GRN_SNIP
PATSNIP = ccygroonga.GRN_PATSNIP
STRING = ccygroonga.GRN_STRING
CURSOR_TABLE_HASH_KEY = ccygroonga.GRN_CURSOR_TABLE_HASH_KEY
CURSOR_TABLE_PAT_KEY = ccygroonga.GRN_CURSOR_TABLE_PAT_KEY
CURSOR_TABLE_DAT_KEY = ccygroonga.GRN_CURSOR_TABLE_DAT_KEY
CURSOR_TABLE_NO_KEY = ccygroonga.GRN_CURSOR_TABLE_NO_KEY
CURSOR_COLUMN_INDEX = ccygroonga.GRN_CURSOR_COLUMN_INDEX
CURSOR_COLUMN_GEO_INDEX = ccygroonga.GRN_CURSOR_COLUMN_GEO_INDEX
TYPE = ccygroonga.GRN_TYPE
PROC = ccygroonga.GRN_PROC
EXPR = ccygroonga.GRN_EXPR
TABLE_HASH_KEY = ccygroonga.GRN_TABLE_HASH_KEY
TABLE_PAT_KEY = ccygroonga.GRN_TABLE_PAT_KEY
TABLE_DAT_KEY = ccygroonga.GRN_TABLE_DAT_KEY
TABLE_NO_KEY = ccygroonga.GRN_TABLE_NO_KEY
DB = ccygroonga.GRN_DB
COLUMN_FIX_SIZE = ccygroonga.GRN_COLUMN_FIX_SIZE
COLUMN_VAR_SIZE = ccygroonga.GRN_COLUMN_VAR_SIZE
COLUMN_INDEX = ccygroonga.GRN_COLUMN_INDEX

# builtin types
DB_VOID = ccygroonga.GRN_DB_VOID
DB_DB = ccygroonga.GRN_DB_DB
DB_OBJECT = ccygroonga.GRN_DB_OBJECT
DB_BOOL = ccygroonga.GRN_DB_BOOL
DB_INT8 = ccygroonga.GRN_DB_INT8
DB_UINT8 = ccygroonga.GRN_DB_UINT8
DB_INT16 = ccygroonga.GRN_DB_INT16
DB_UINT16 = ccygroonga.GRN_DB_UINT16
DB_INT32 = ccygroonga.GRN_DB_INT32
DB_UINT32 = ccygroonga.GRN_DB_UINT32
DB_INT64 = ccygroonga.GRN_DB_INT64
DB_UINT64 = ccygroonga.GRN_DB_UINT64
DB_FLOAT = ccygroonga.GRN_DB_FLOAT
DB_TIME = ccygroonga.GRN_DB_TIME
DB_SHORT_TEXT = ccygroonga.GRN_DB_SHORT_TEXT
DB_TEXT = ccygroonga.GRN_DB_TEXT
DB_LONG_TEXT = ccygroonga.GRN_DB_LONG_TEXT
DB_TOKYO_GEO_POINT = ccygroonga.GRN_DB_TOKYO_GEO_POINT
DB_WGS84_GEO_POINT = ccygroonga.GRN_DB_WGS84_GEO_POINT

cdef class Groonga:
    def __enter__(self):
        rc = ccygroonga.grn_init()
        if rc != ccygroonga.GRN_SUCCESS:
            raise GroongaException(rc)

    def __exit__(self, exc_type, exc_value, traceback):
        rc = ccygroonga.grn_fin()
        if rc != ccygroonga.GRN_SUCCESS:
            raise GroongaException(rc)

class GroongaException(Exception):
    def __init__(self, rc, message=None):
        self.rc = rc
        self.message = message
    def __str__(self):
        return "error in groonga. rc=%s, message=%s" % (self.rc, self.message)

cdef class Context:
    cdef ccygroonga.grn_ctx* _c_ctx

    def __cinit__(self):
        self._c_ctx = ccygroonga.grn_ctx_open(0)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def close(self):
        if self._c_ctx != NULL:
            rc = ccygroonga.grn_ctx_fin(self._c_ctx)
            if rc != ccygroonga.GRN_SUCCESS:
                raise GroongaException(rc, self._c_ctx.errbuf.decode('UTF-8'))
            self._c_ctx = NULL

    def create_database(self, path):
        c_path = path.encode('UTF-8')
        db = Database(self)
        db._c_db = ccygroonga.grn_db_create(self._c_ctx, c_path, NULL)
        return db

    def open_database(self, path):
        c_path = path.encode('UTF-8')
        c_db = ccygroonga.grn_db_open(self._c_ctx, c_path)
        if c_db == NULL:
            return None
        else:
            db = Database(self)
            db._c_db = c_db
            return db

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

        cdef ccygroonga.grn_obj* c_value_type
        if value_type is None:
            c_value_type = NULL
        else:
            c_value_type = value_type._c_obj

        c_table = ccygroonga.grn_table_create(self._c_ctx,
                c_name, len(c_name), c_path, flags, key_type._c_obj,
                c_value_type)
        return _new_table(c_table)

    def open_table(self, name):
        py_name = name.encode('UTF-8')
        cdef const char* c_name = py_name

        c_table = ccygroonga.grn_ctx_get(self._c_ctx, c_name, len(c_name))
        return _new_table(c_table)

    def open_or_create_table(self, name, flags, Object key_type, Object value_type=None, path=None):
        table = self.open_table(name)
        if table is None:
            table = self.create_table(name, flags, key_type, value_type, path)
        return table

    def at(self, ccygroonga.grn_id id):
        return _new_object(ccygroonga.grn_ctx_at(self._c_ctx, id))

cdef class Database:
    cdef Context context
    cdef ccygroonga.grn_obj* _c_db

    def __init__(self, context):
        self.context = context

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

    def close(self):
        if self._c_db != NULL:
            ccygroonga.grn_obj_unlink(self.context._c_ctx, self._c_db)
            self._c_db = NULL

cdef class Records:
    cdef ccygroonga.grn_obj* _c_records

cdef _new_records(ccygroonga.grn_obj* c_records):
    if c_records == NULL:
        return None
    else:
        records = Records()
        records._c_records = c_records
        return records

cdef class Table(Records):
    pass

cdef _new_table(ccygroonga.grn_obj* c_table):
    if c_table == NULL:
        return None
    else:
        table = Table()
        table._c_records = c_table
        return table

cdef class Object:
    cdef ccygroonga.grn_obj* _c_obj

cdef _new_object(ccygroonga.grn_obj* c_obj):
    if c_obj == NULL:
        return None
    else:
        obj = Object()
        obj._c_obj = c_obj
        return obj
