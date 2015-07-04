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

# operator
OP_PUSH = cgrn.GRN_OP_PUSH
OP_POP = cgrn.GRN_OP_POP
OP_NOP = cgrn.GRN_OP_NOP
OP_CALL = cgrn.GRN_OP_CALL
OP_INTERN = cgrn.GRN_OP_INTERN
OP_GET_REF = cgrn.GRN_OP_GET_REF
OP_GET_VALUE = cgrn.GRN_OP_GET_VALUE
OP_AND = cgrn.GRN_OP_AND
OP_AND_NOT = cgrn.GRN_OP_AND_NOT
OP_OR = cgrn.GRN_OP_OR
OP_ASSIGN = cgrn.GRN_OP_ASSIGN
OP_STAR_ASSIGN = cgrn.GRN_OP_STAR_ASSIGN
OP_SLASH_ASSIGN = cgrn.GRN_OP_SLASH_ASSIGN
OP_MOD_ASSIGN = cgrn.GRN_OP_MOD_ASSIGN
OP_PLUS_ASSIGN = cgrn.GRN_OP_PLUS_ASSIGN
OP_MINUS_ASSIGN = cgrn.GRN_OP_MINUS_ASSIGN
OP_SHIFTL_ASSIGN = cgrn.GRN_OP_SHIFTL_ASSIGN
OP_SHIFTR_ASSIGN = cgrn.GRN_OP_SHIFTR_ASSIGN
OP_SHIFTRR_ASSIGN = cgrn.GRN_OP_SHIFTRR_ASSIGN
OP_AND_ASSIGN = cgrn.GRN_OP_AND_ASSIGN
OP_XOR_ASSIGN = cgrn.GRN_OP_XOR_ASSIGN
OP_OR_ASSIGN = cgrn.GRN_OP_OR_ASSIGN
OP_JUMP = cgrn.GRN_OP_JUMP
OP_CJUMP = cgrn.GRN_OP_CJUMP
OP_COMMA = cgrn.GRN_OP_COMMA
OP_BITWISE_OR = cgrn.GRN_OP_BITWISE_OR
OP_BITWISE_XOR = cgrn.GRN_OP_BITWISE_XOR
OP_BITWISE_AND = cgrn.GRN_OP_BITWISE_AND
OP_BITWISE_NOT = cgrn.GRN_OP_BITWISE_NOT
OP_EQUAL = cgrn.GRN_OP_EQUAL
OP_NOT_EQUAL = cgrn.GRN_OP_NOT_EQUAL
OP_LESS = cgrn.GRN_OP_LESS
OP_GREATER = cgrn.GRN_OP_GREATER
OP_LESS_EQUAL = cgrn.GRN_OP_LESS_EQUAL
OP_GREATER_EQUAL = cgrn.GRN_OP_GREATER_EQUAL
OP_IN = cgrn.GRN_OP_IN
OP_MATCH = cgrn.GRN_OP_MATCH
OP_NEAR = cgrn.GRN_OP_NEAR
OP_NEAR2 = cgrn.GRN_OP_NEAR2
OP_SIMILAR = cgrn.GRN_OP_SIMILAR
OP_TERM_EXTRACT = cgrn.GRN_OP_TERM_EXTRACT
OP_SHIFTL = cgrn.GRN_OP_SHIFTL
OP_SHIFTR = cgrn.GRN_OP_SHIFTR
OP_SHIFTRR = cgrn.GRN_OP_SHIFTRR
OP_PLUS = cgrn.GRN_OP_PLUS
OP_MINUS = cgrn.GRN_OP_MINUS
OP_STAR = cgrn.GRN_OP_STAR
OP_SLASH = cgrn.GRN_OP_SLASH
OP_MOD = cgrn.GRN_OP_MOD
OP_DELETE = cgrn.GRN_OP_DELETE
OP_INCR = cgrn.GRN_OP_INCR
OP_DECR = cgrn.GRN_OP_DECR
OP_INCR_POST = cgrn.GRN_OP_INCR_POST
OP_DECR_POST = cgrn.GRN_OP_DECR_POST
OP_NOT = cgrn.GRN_OP_NOT
OP_ADJUST = cgrn.GRN_OP_ADJUST
OP_EXACT = cgrn.GRN_OP_EXACT
OP_LCP = cgrn.GRN_OP_LCP
OP_PARTIAL = cgrn.GRN_OP_PARTIAL
OP_UNSPLIT = cgrn.GRN_OP_UNSPLIT
OP_PREFIX = cgrn.GRN_OP_PREFIX
OP_SUFFIX = cgrn.GRN_OP_SUFFIX
OP_GEO_DISTANCE1 = cgrn.GRN_OP_GEO_DISTANCE1
OP_GEO_DISTANCE2 = cgrn.GRN_OP_GEO_DISTANCE2
OP_GEO_DISTANCE3 = cgrn.GRN_OP_GEO_DISTANCE3
OP_GEO_DISTANCE4 = cgrn.GRN_OP_GEO_DISTANCE4
OP_GEO_WITHINP5 = cgrn.GRN_OP_GEO_WITHINP5
OP_GEO_WITHINP6 = cgrn.GRN_OP_GEO_WITHINP6
OP_GEO_WITHINP8 = cgrn.GRN_OP_GEO_WITHINP8
OP_OBJ_SEARCH = cgrn.GRN_OP_OBJ_SEARCH
OP_EXPR_GET_VAR = cgrn.GRN_OP_EXPR_GET_VAR
OP_TABLE_CREATE = cgrn.GRN_OP_TABLE_CREATE
OP_TABLE_SELECT = cgrn.GRN_OP_TABLE_SELECT
OP_TABLE_SORT = cgrn.GRN_OP_TABLE_SORT
OP_TABLE_GROUP = cgrn.GRN_OP_TABLE_GROUP
OP_JSON_PUT = cgrn.GRN_OP_JSON_PUT
OP_GET_MEMBER = cgrn.GRN_OP_GET_MEMBER
OP_REGEXP = cgrn.GRN_OP_REGEXP

# expr_flags
EXPR_SYNTAX_QUERY = cgrn.GRN_EXPR_SYNTAX_QUERY
EXPR_SYNTAX_SCRIPT = cgrn.GRN_EXPR_SYNTAX_SCRIPT
EXPR_SYNTAX_OUTPUT_COLUMNS = cgrn.GRN_EXPR_SYNTAX_OUTPUT_COLUMNS
EXPR_SYNTAX_ADJUSTER = cgrn.GRN_EXPR_SYNTAX_ADJUSTER
EXPR_ALLOW_PRAGMA = cgrn.GRN_EXPR_ALLOW_PRAGMA
EXPR_ALLOW_COLUMN = cgrn.GRN_EXPR_ALLOW_COLUMN
EXPR_ALLOW_UPDATE = cgrn.GRN_EXPR_ALLOW_UPDATE
EXPR_ALLOW_LEADING_NOT = cgrn.GRN_EXPR_ALLOW_LEADING_NOT

# cursor flags
CURSOR_ASCENDING = cgrn.GRN_CURSOR_ASCENDING
CURSOR_DESCENDING = cgrn.GRN_CURSOR_DESCENDING
CURSOR_GE = cgrn.GRN_CURSOR_GE
CURSOR_GT = cgrn.GRN_CURSOR_GT
CURSOR_LE = cgrn.GRN_CURSOR_LE
CURSOR_LT = cgrn.GRN_CURSOR_LT
CURSOR_BY_KEY = cgrn.GRN_CURSOR_BY_KEY
CURSOR_BY_ID = cgrn.GRN_CURSOR_BY_ID
CURSOR_PREFIX = cgrn.GRN_CURSOR_PREFIX
CURSOR_SIZE_BY_BIT = cgrn.GRN_CURSOR_SIZE_BY_BIT
CURSOR_RK = cgrn.GRN_CURSOR_RK

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
            rc = cgrn.grn_ctx_fin(c_ctx)
            _check_rc(rc, c_ctx)
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

    cdef _obj_id(self, cgrn.grn_obj *c_obj):
        return cgrn.grn_obj_id(self._c_ctx, c_obj)

    def create_expression(self, name=None):
        cdef const char* c_name
        if name is None:
            c_name = NULL
            c_name_len = 0
        else:
            py_name = name.encode('UTF-8')
            c_name = py_name
            c_name_len = len(c_name)
        c_ctx = self._c_ctx
        c_expr = cgrn.grn_expr_create(c_ctx, c_name, c_name_len)
        if c_expr == NULL:
            _check_rc(c_ctx.rc, c_ctx)
        return _new_expression(self, c_expr)

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
            rc = cgrn.grn_obj_unlink(c_ctx, self._c_obj)
            _check_rc(rc, c_ctx)
            self._c_obj = NULL

    def remove(self):
        c_ctx = self.context._c_ctx
        c_obj = self._c_obj
        rc = cgrn.grn_obj_remove(c_ctx, c_obj)
        _check_rc(rc, c_ctx)

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

    def record_count(self):
        return cgrn.grn_table_size(self.context._c_ctx, self._c_obj)

    def get_record(self, key):
        cdef const char* c_key
        if key is None:
            c_key = NULL
        else:
            py_key = key.encode('UTF-8')
            c_key = py_key

        c_ctx = self.context._c_ctx
        record_id = cgrn.grn_table_get(c_ctx, self._c_obj, c_key, len(c_key))
        if record_id == cgrn.GRN_ID_NIL:
            return (0, False)
        else:
            return (record_id, True)

    def create_query(self, name=None):
        context = self.context
        expr = context.create_expression(name)
        cdef Variable v = expr.add_variable()
        cgrn.GRN_RECORD_INIT(v._c_obj, 0, context._obj_id(self._c_obj))
        return expr

    def select(self, Expression expr, Records records=None, cgrn.grn_operator op=OP_OR):
        c_ctx = self.context._c_ctx
        cdef cgrn.grn_obj* c_records = NULL
        if records is not None:
            c_records = records._c_obj
        c_records = cgrn.grn_table_select(c_ctx, self._c_obj, expr._c_obj,
                                          c_records, op)
        _check_rc(c_ctx.rc, c_ctx)
        return _new_records(self.context, c_records)

    def open_table_cursor(self, min=None, max=None, offset=0, limit=-1, flags=CURSOR_ASCENDING):
        cdef const char* c_min
        if min is None:
            c_min = NULL
            c_min_len = 0
        else:
            py_min = min.encode('UTF-8')
            c_min = py_min
            c_min_len = len(c_min)
        cdef const char* c_max
        if max is None:
            c_max = NULL
            c_max_len = 0
        else:
            py_max = max.encode('UTF-8')
            c_max = py_max
            c_max_len = len(c_max)
        c_ctx = self.context._c_ctx
        c_cursor = cgrn.grn_table_cursor_open(c_ctx, self._c_obj,
                                              c_min, c_min_len,
                                              c_max, c_max_len,
                                              offset, limit, flags)
        if c_cursor == NULL:
            _check_rc(c_ctx.rc, c_ctx)
        return _new_table_cursor(self.context, c_cursor)

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
        rc = cgrn.grn_obj_set_value(c_ctx, self._c_obj, record_id, &buf, cgrn.GRN_OBJ_SET)
        _check_rc(rc, c_ctx)

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
        rc = cgrn.grn_obj_set_value(c_ctx, self._c_obj, record_id, &buf, cgrn.GRN_OBJ_SET)
        _check_rc(rc, c_ctx)

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

cdef class Expression(Object):
    cdef list _variables

    def __cinit__(self):
        self._variables = list()

    def add_variable(self, name=None):
        cdef const char* c_name
        if name is None:
            c_name = NULL
            c_name_len = 0
        else:
            py_name = name.encode('UTF-8')
            c_name = py_name
            c_name_len = len(c_name)
        c_ctx = self.context._c_ctx
        c_expr = self._c_obj
        c_var = cgrn.grn_expr_add_var(c_ctx, c_expr, c_name, c_name_len)
        if c_var == NULL:
            _check_rc(c_ctx.rc, c_ctx)
        v = _new_variable(self.context, c_var)
        self._variables.append(v)
        return v

    def append_operator(self, op, nargs):
        c_ctx = self.context._c_ctx
        rc = cgrn.grn_expr_append_op(c_ctx, self._c_obj, op, nargs)
        _check_rc(rc, c_ctx)

    def parse(self, text, Expression default_column, default_mode, default_op, flags):
        cdef const char* c_text
        if text is None:
            c_text = NULL
        else:
            py_text = text.encode('UTF-8')
            c_text = py_text

        cdef cgrn.grn_obj* c_default_column = NULL
        if default_column is not None:
            c_default_column = default_column._c_obj
        c_ctx = self.context._c_ctx
        rc = cgrn.grn_expr_parse(c_ctx, self._c_obj,
                                 c_text, len(c_text),
                                 c_default_column, default_mode,
                                 default_op, flags)
        _check_rc(rc, c_ctx)

cdef _new_expression(Context context, cgrn.grn_obj* c_expression):
    if c_expression == NULL:
        return None
    else:
        expression = Expression(context)
        expression._c_obj = c_expression
        return expression

cdef class Variable(Object):
    pass

cdef _new_variable(Context context, cgrn.grn_obj* c_variable):
    if c_variable == NULL:
        return None
    else:
        variable = Variable(context)
        variable._c_obj = c_variable
        return variable

cdef class TableCursor(Object):
    def close(self):
        if self._c_obj != NULL:
            c_ctx = self.context._c_ctx
            rc = cgrn.grn_table_cursor_close(c_ctx, self._c_obj)
            _check_rc(rc, c_ctx)
            self._c_obj = NULL

    def next(self):
        c_ctx = self.context._c_ctx
        record_id = cgrn.grn_table_cursor_next(c_ctx, self._c_obj)
        if record_id == cgrn.GRN_ID_NIL:
            return (0, False)
        else:
            return (record_id, True)

cdef _new_table_cursor(Context context, cgrn.grn_table_cursor* c_table_cursor):
    if c_table_cursor == NULL:
        return None
    else:
        table_cursor = TableCursor(context)
        table_cursor._c_obj = c_table_cursor
        return table_cursor
