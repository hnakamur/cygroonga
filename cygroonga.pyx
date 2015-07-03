cimport ccygroonga

def init():
    return ccygroonga.grn_init()

cdef class Context:
    cdef ccygroonga.grn_ctx* _c_ctx

    def __cinit__(self):
        self._c_ctx = ccygroonga.grn_ctx_open(0)

    def fin(self):
        return ccygroonga.grn_ctx_fin(self._c_ctx)

def fin():
    return ccygroonga.grn_fin()
