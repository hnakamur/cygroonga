cimport ccygroonga

def init():
    return ccygroonga.grn_init()

cdef class Database:
    cdef ccygroonga.grn_ctx* _c_ctx
    cdef ccygroonga.grn_obj* _c_cb

    def __cinit__(self, ccygroonga.grn_ctx* c_ctx, ccygroonga.grn_obj* c_db):
        self._c_ctx = c_ctx
        self._c_db = c_db

cdef class Context:
    cdef ccygroonga.grn_ctx* _c_ctx
    cdef ccygroonga.grn_obj* _c_cb

    def __cinit__(self):
        self._c_ctx = ccygroonga.grn_ctx_open(0)

    def db_create(self, path):
        c_path = path.encode('UTF-8')
        c_db = ccygroonga.grn_db_create(self._c_ctx, c_path, NULL)
        return Database(self._c_ctx, c_db)

    def fin(self):
        return ccygroonga.grn_ctx_fin(self._c_ctx)

def fin():
    return ccygroonga.grn_fin()
