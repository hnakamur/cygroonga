cdef extern from "groonga/groonga.h":
    ctypedef unsigned int grn_id
    const int GRN_ID_NIL                     = (0x00)

    ctypedef enum grn_rc:
        GRN_SUCCESS = 0
        GRN_END_OF_DATA = 1
        GRN_UNKNOWN_ERROR = -1
        GRN_OPERATION_NOT_PERMITTED = -2
        GRN_NO_SUCH_FILE_OR_DIRECTORY = -3
        GRN_NO_SUCH_PROCESS = -4
        GRN_INTERRUPTED_FUNCTION_CALL = -5
        GRN_INPUT_OUTPUT_ERROR = -6
        GRN_NO_SUCH_DEVICE_OR_ADDRESS = -7
        GRN_ARG_LIST_TOO_LONG = -8
        GRN_EXEC_FORMAT_ERROR = -9
        GRN_BAD_FILE_DESCRIPTOR = -10
        GRN_NO_CHILD_PROCESSES = -11
        GRN_RESOURCE_TEMPORARILY_UNAVAILABLE = -12
        GRN_NOT_ENOUGH_SPACE = -13
        GRN_PERMISSION_DENIED = -14
        GRN_BAD_ADDRESS = -15
        GRN_RESOURCE_BUSY = -16
        GRN_FILE_EXISTS = -17
        GRN_IMPROPER_LINK = -18
        GRN_NO_SUCH_DEVICE = -19
        GRN_NOT_A_DIRECTORY = -20
        GRN_IS_A_DIRECTORY = -21
        GRN_INVALID_ARGUMENT = -22
        GRN_TOO_MANY_OPEN_FILES_IN_SYSTEM = -23
        GRN_TOO_MANY_OPEN_FILES = -24
        GRN_INAPPROPRIATE_I_O_CONTROL_OPERATION = -25
        GRN_FILE_TOO_LARGE = -26
        GRN_NO_SPACE_LEFT_ON_DEVICE = -27
        GRN_INVALID_SEEK = -28
        GRN_READ_ONLY_FILE_SYSTEM = -29
        GRN_TOO_MANY_LINKS = -30
        GRN_BROKEN_PIPE = -31
        GRN_DOMAIN_ERROR = -32
        GRN_RESULT_TOO_LARGE = -33
        GRN_RESOURCE_DEADLOCK_AVOIDED = -34
        GRN_NO_MEMORY_AVAILABLE = -35
        GRN_FILENAME_TOO_LONG = -36
        GRN_NO_LOCKS_AVAILABLE = -37
        GRN_FUNCTION_NOT_IMPLEMENTED = -38
        GRN_DIRECTORY_NOT_EMPTY = -39
        GRN_ILLEGAL_BYTE_SEQUENCE = -40
        GRN_SOCKET_NOT_INITIALIZED = -41
        GRN_OPERATION_WOULD_BLOCK = -42
        GRN_ADDRESS_IS_NOT_AVAILABLE = -43
        GRN_NETWORK_IS_DOWN = -44
        GRN_NO_BUFFER = -45
        GRN_SOCKET_IS_ALREADY_CONNECTED = -46
        GRN_SOCKET_IS_NOT_CONNECTED = -47
        GRN_SOCKET_IS_ALREADY_SHUTDOWNED = -48
        GRN_OPERATION_TIMEOUT = -49
        GRN_CONNECTION_REFUSED = -50
        GRN_RANGE_ERROR = -51
        GRN_TOKENIZER_ERROR = -52
        GRN_FILE_CORRUPT = -53
        GRN_INVALID_FORMAT = -54
        GRN_OBJECT_CORRUPT = -55
        GRN_TOO_MANY_SYMBOLIC_LINKS = -56
        GRN_NOT_SOCKET = -57
        GRN_OPERATION_NOT_SUPPORTED = -58
        GRN_ADDRESS_IS_IN_USE = -59
        GRN_ZLIB_ERROR = -60
        GRN_LZ4_ERROR = -61
        GRN_STACK_OVER_FLOW = -62
        GRN_SYNTAX_ERROR = -63
        GRN_RETRY_MAX = -64
        GRN_INCOMPATIBLE_FILE_FORMAT = -65
        GRN_UPDATE_NOT_ALLOWED = -66
        GRN_TOO_SMALL_OFFSET = -67
        GRN_TOO_LARGE_OFFSET = -68
        GRN_TOO_SMALL_LIMIT = -69
        GRN_CAS_ERROR = -70
        GRN_UNSUPPORTED_COMMAND_VERSION = -71
        GRN_NORMALIZER_ERROR = -72
        GRN_TOKEN_FILTER_ERROR = -73
        GRN_COMMAND_ERROR = -74
        GRN_PLUGIN_ERROR = -75
        GRN_SCORER_ERROR = -76

    # obj constants

    const int GRN_OBJ_TABLE_TYPE_MASK        = (0x07)
    const int GRN_OBJ_TABLE_HASH_KEY         = (0x00)
    const int GRN_OBJ_TABLE_PAT_KEY          = (0x01)
    const int GRN_OBJ_TABLE_DAT_KEY          = (0x02)
    const int GRN_OBJ_TABLE_NO_KEY           = (0x03)

    const int GRN_OBJ_KEY_MASK               = (0x07<<3)
    const int GRN_OBJ_KEY_UINT               = (0x00<<3)
    const int GRN_OBJ_KEY_INT                = (0x01<<3)
    const int GRN_OBJ_KEY_FLOAT              = (0x02<<3)
    const int GRN_OBJ_KEY_GEO_POINT          = (0x03<<3)

    const int GRN_OBJ_KEY_WITH_SIS           = (0x01<<6)
    const int GRN_OBJ_KEY_NORMALIZE          = (0x01<<7)

    const int GRN_OBJ_COLUMN_TYPE_MASK       = (0x07)
    const int GRN_OBJ_COLUMN_SCALAR          = (0x00)
    const int GRN_OBJ_COLUMN_VECTOR          = (0x01)
    const int GRN_OBJ_COLUMN_INDEX           = (0x02)

    const int GRN_OBJ_COMPRESS_MASK          = (0x07<<4)
    const int GRN_OBJ_COMPRESS_NONE          = (0x00<<4)
    const int GRN_OBJ_COMPRESS_ZLIB          = (0x01<<4)
    const int GRN_OBJ_COMPRESS_LZ4           = (0x02<<4)

    const int GRN_OBJ_WITH_SECTION           = (0x01<<7)
    const int GRN_OBJ_WITH_WEIGHT            = (0x01<<8)
    const int GRN_OBJ_WITH_POSITION          = (0x01<<9)
    const int GRN_OBJ_RING_BUFFER            = (0x01<<10)

    const int GRN_OBJ_UNIT_MASK              = (0x0f<<8)
    const int GRN_OBJ_UNIT_DOCUMENT_NONE     = (0x00<<8)
    const int GRN_OBJ_UNIT_DOCUMENT_SECTION  = (0x01<<8)
    const int GRN_OBJ_UNIT_DOCUMENT_POSITION = (0x02<<8)
    const int GRN_OBJ_UNIT_SECTION_NONE      = (0x03<<8)
    const int GRN_OBJ_UNIT_SECTION_POSITION  = (0x04<<8)
    const int GRN_OBJ_UNIT_POSITION_NONE     = (0x05<<8)
    const int GRN_OBJ_UNIT_USERDEF_DOCUMENT  = (0x06<<8)
    const int GRN_OBJ_UNIT_USERDEF_SECTION   = (0x07<<8)
    const int GRN_OBJ_UNIT_USERDEF_POSITION  = (0x08<<8)

    const int GRN_OBJ_NO_SUBREC              = (0x00<<13)
    const int GRN_OBJ_WITH_SUBREC            = (0x01<<13)

    const int GRN_OBJ_KEY_VAR_SIZE           = (0x01<<14)

    const int GRN_OBJ_TEMPORARY              = (0x00<<15)
    const int GRN_OBJ_PERSISTENT             = (0x01<<15)

    # obj types

    const int GRN_VOID                       = (0x00)
    const int GRN_BULK                       = (0x02)
    const int GRN_PTR                        = (0x03)
    const int GRN_UVECTOR                    = (0x04) # vector of fixed size data especially grn_id
    const int GRN_PVECTOR                    = (0x05) # vector of grn_obj*
    const int GRN_VECTOR                     = (0x06) # vector of arbitrary data
    const int GRN_MSG                        = (0x07)
    const int GRN_QUERY                      = (0x08)
    const int GRN_ACCESSOR                   = (0x09)
    const int GRN_SNIP                       = (0x0b)
    const int GRN_PATSNIP                    = (0x0c)
    const int GRN_STRING                     = (0x0d)
    const int GRN_CURSOR_TABLE_HASH_KEY      = (0x10)
    const int GRN_CURSOR_TABLE_PAT_KEY       = (0x11)
    const int GRN_CURSOR_TABLE_DAT_KEY       = (0x12)
    const int GRN_CURSOR_TABLE_NO_KEY        = (0x13)
    const int GRN_CURSOR_COLUMN_INDEX        = (0x18)
    const int GRN_CURSOR_COLUMN_GEO_INDEX    = (0x1a)
    const int GRN_TYPE                       = (0x20)
    const int GRN_PROC                       = (0x21)
    const int GRN_EXPR                       = (0x22)
    const int GRN_TABLE_HASH_KEY             = (0x30)
    const int GRN_TABLE_PAT_KEY              = (0x31)
    const int GRN_TABLE_DAT_KEY              = (0x32)
    const int GRN_TABLE_NO_KEY               = (0x33)
    const int GRN_DB                         = (0x37)
    const int GRN_COLUMN_FIX_SIZE            = (0x40)
    const int GRN_COLUMN_VAR_SIZE            = (0x41)
    const int GRN_COLUMN_INDEX               = (0x48)

    # obj set flags
    const int GRN_OBJ_SET_MASK               = (0x07)
    const int GRN_OBJ_SET                    = (0x01)
    const int GRN_OBJ_INCR                   = (0x02)
    const int GRN_OBJ_DECR                   = (0x03)
    const int GRN_OBJ_APPEND                 = (0x04)
    const int GRN_OBJ_PREPEND                = (0x05)
    const int GRN_OBJ_GET                    = (0x01<<4)
    const int GRN_OBJ_COMPARE                = (0x01<<5)
    const int GRN_OBJ_LOCK                   = (0x01<<6)
    const int GRN_OBJ_UNLOCK                 = (0x01<<7)

    ctypedef enum grn_builtin_type:
        GRN_DB_VOID = 0
        GRN_DB_DB
        GRN_DB_OBJECT
        GRN_DB_BOOL
        GRN_DB_INT8
        GRN_DB_UINT8
        GRN_DB_INT16
        GRN_DB_UINT16
        GRN_DB_INT32
        GRN_DB_UINT32
        GRN_DB_INT64
        GRN_DB_UINT64
        GRN_DB_FLOAT
        GRN_DB_TIME
        GRN_DB_SHORT_TEXT
        GRN_DB_TEXT
        GRN_DB_LONG_TEXT
        GRN_DB_TOKYO_GEO_POINT
        GRN_DB_WGS84_GEO_POINT

    ctypedef enum grn_encoding:
        GRN_ENC_DEFAULT = 0
        GRN_ENC_NONE
        GRN_ENC_EUC_JP
        GRN_ENC_UTF8
        GRN_ENC_SJIS
        GRN_ENC_LATIN1
        GRN_ENC_KOI8R

    ctypedef enum grn_info_type:
        GRN_INFO_ENCODING = 0
        GRN_INFO_SOURCE
        GRN_INFO_DEFAULT_TOKENIZER
        GRN_INFO_ELEMENT_SIZE
        GRN_INFO_CURR_MAX
        GRN_INFO_MAX_ELEMENT_SIZE
        GRN_INFO_SEG_SIZE
        GRN_INFO_CHUNK_SIZE
        GRN_INFO_MAX_SECTION
        GRN_INFO_HOOK_LOCAL_DATA
        GRN_INFO_ELEMENT_A
        GRN_INFO_ELEMENT_CHUNK
        GRN_INFO_ELEMENT_CHUNK_SIZE
        GRN_INFO_ELEMENT_BUFFER_FREE
        GRN_INFO_ELEMENT_NTERMS
        GRN_INFO_ELEMENT_NTERMS_VOID
        GRN_INFO_ELEMENT_SIZE_IN_CHUNK
        GRN_INFO_ELEMENT_POS_IN_CHUNK
        GRN_INFO_ELEMENT_SIZE_IN_BUFFER
        GRN_INFO_ELEMENT_POS_IN_BUFFER
        GRN_INFO_ELEMENT_ESTIMATE_SIZE
        GRN_INFO_NGRAM_UNIT_SIZE
        GRN_INFO_PARTIAL_MATCH_THRESHOLD
        GRN_INFO_II_SPLIT_THRESHOLD
        GRN_INFO_SUPPORT_ZLIB
        GRN_INFO_SUPPORT_LZ4
        GRN_INFO_NORMALIZER
        GRN_INFO_TOKEN_FILTERS

    ctypedef union grn_user_data:
        int int_value
        grn_id id
        void *ptr

    ctypedef struct grn_ctx_impl:
        pass

    DEF GRN_CTX_MSGSIZE = 0x80

    ctypedef struct grn_ctx:
        grn_rc rc
        int flags
        grn_encoding encoding
        unsigned char ntrace
        unsigned char errlvl
        unsigned char stat
        unsigned int seqno
        unsigned int subno
        unsigned int seqno2
        unsigned int errline
        grn_user_data user_data
        grn_ctx *prev
        grn_ctx *next
        const char *errfile
        const char *errfunc
        grn_ctx_impl *impl
        void *trace[16]
        char errbuf[GRN_CTX_MSGSIZE]

    grn_rc grn_init()
    grn_rc grn_fin()

    grn_rc grn_ctx_init(grn_ctx *ctx, int flags)
    grn_ctx *grn_ctx_open(int flags)
    grn_rc grn_ctx_fin(grn_ctx *ctx)
    grn_obj *grn_ctx_get(grn_ctx *ctx, const char *name, int name_size)
    grn_obj *grn_ctx_at(grn_ctx *ctx, grn_id id)

    ctypedef struct grn_section:
        unsigned int offset
        unsigned int length
        unsigned int weight
        grn_id domain

    ctypedef unsigned short int grn_obj_flags

    ctypedef struct grn_obj_header:
        unsigned char type
        unsigned char impl_flags
        grn_obj_flags flags
        grn_id domain

    ctypedef struct grn_obj_b:
        char *head
        char *curr
        char *tail

    ctypedef struct grn_obj_v:
        grn_obj *body
        grn_section *sections
        int n_sections

    ctypedef union grn_obj_u:
        grn_obj_b b
        grn_obj_v v

    ctypedef struct grn_obj:
        grn_obj_header header
        grn_obj_u u

    ctypedef struct grn_db_create_optarg:
        char **builtin_type_names
        int n_builtin_type_names


    grn_obj *grn_db_create(grn_ctx *ctx, const char *path, grn_db_create_optarg *optarg)
    grn_obj *grn_db_open(grn_ctx *ctx, const char *path)

    grn_id grn_table_add(grn_ctx *ctx, grn_obj *table,
                         const void *key, unsigned int key_size, bint *added)
    grn_obj *grn_table_create(grn_ctx *ctx,
                              const char *name, unsigned int name_size,
                              const char *path, grn_obj_flags flags,
                              grn_obj *key_type, grn_obj *value_type)
    grn_id grn_table_get(grn_ctx *ctx, grn_obj *table,
                         const void *key, unsigned int key_size)
    grn_obj *grn_table_select(grn_ctx *ctx, grn_obj *table, grn_obj *expr,
                              grn_obj *res, grn_operator op)
    unsigned int grn_table_size(grn_ctx *ctx, grn_obj *table)

    grn_obj *grn_column_create(grn_ctx *ctx, grn_obj *table,
                               const char *name, unsigned int name_size,
                               const char *path, grn_obj_flags flags, grn_obj *type)

    grn_obj *grn_obj_column(grn_ctx *ctx, grn_obj *table,
                            const char *name, unsigned int name_size)
    grn_obj *grn_obj_get_value(grn_ctx *ctx, grn_obj *obj, grn_id id, grn_obj *value)
    grn_id grn_obj_id(grn_ctx *ctx, grn_obj *obj)
    int grn_obj_name(grn_ctx *ctx, grn_obj *obj, char *namebuf, int buf_size)
    const char *grn_obj_path(grn_ctx *ctx, grn_obj *obj)
    grn_rc grn_obj_remove(grn_ctx *ctx, grn_obj *obj)
    grn_rc grn_obj_set_info(grn_ctx *ctx, grn_obj *obj, grn_info_type type, grn_obj *value)
    grn_rc grn_obj_set_value(grn_ctx *ctx, grn_obj *obj, grn_id id, grn_obj *value, int flags)
    void grn_obj_unlink(grn_ctx *ctx, grn_obj *obj)

    const int GRN_OBJ_VECTOR                 = (0x01<<7)

    int GRN_BULK_VSIZE(grn_obj* bulk)
    void GRN_RECORD_INIT(grn_obj* obj, unsigned char impl_flags, grn_id domain)
    void GRN_TEXT_INIT(grn_obj* obj, unsigned char impl_flag)
    void GRN_TEXT_PUT(grn_ctx* ctx, grn_obj* obj, const char* s, unsigned int len)
    void GRN_TIME_INIT(grn_obj* obj, unsigned char impl_flag)
    void GRN_TIME_SET(grn_ctx* ctx, grn_obj* obj, long long int unix_usec)
    char* GRN_TEXT_VALUE(grn_obj* obj)
    int GRN_TEXT_LEN(grn_obj* obj)
    long long int GRN_TIME_VALUE(grn_obj* obj)
    void GRN_UINT32_INIT(grn_obj* obj, unsigned char impl_flag)
    void GRN_UINT32_PUT(grn_ctx* ctx, grn_obj* obj, unsigned int val)

    ctypedef enum grn_operator:
        GRN_OP_PUSH
        GRN_OP_POP
        GRN_OP_NOP
        GRN_OP_CALL
        GRN_OP_INTERN
        GRN_OP_GET_REF
        GRN_OP_GET_VALUE
        GRN_OP_AND
        GRN_OP_AND_NOT
        GRN_OP_OR
        GRN_OP_ASSIGN
        GRN_OP_STAR_ASSIGN
        GRN_OP_SLASH_ASSIGN
        GRN_OP_MOD_ASSIGN
        GRN_OP_PLUS_ASSIGN
        GRN_OP_MINUS_ASSIGN
        GRN_OP_SHIFTL_ASSIGN
        GRN_OP_SHIFTR_ASSIGN
        GRN_OP_SHIFTRR_ASSIGN
        GRN_OP_AND_ASSIGN
        GRN_OP_XOR_ASSIGN
        GRN_OP_OR_ASSIGN
        GRN_OP_JUMP
        GRN_OP_CJUMP
        GRN_OP_COMMA
        GRN_OP_BITWISE_OR
        GRN_OP_BITWISE_XOR
        GRN_OP_BITWISE_AND
        GRN_OP_BITWISE_NOT
        GRN_OP_EQUAL
        GRN_OP_NOT_EQUAL
        GRN_OP_LESS
        GRN_OP_GREATER
        GRN_OP_LESS_EQUAL
        GRN_OP_GREATER_EQUAL
        GRN_OP_IN
        GRN_OP_MATCH
        GRN_OP_NEAR
        GRN_OP_NEAR2
        GRN_OP_SIMILAR
        GRN_OP_TERM_EXTRACT
        GRN_OP_SHIFTL
        GRN_OP_SHIFTR
        GRN_OP_SHIFTRR
        GRN_OP_PLUS
        GRN_OP_MINUS
        GRN_OP_STAR
        GRN_OP_SLASH
        GRN_OP_MOD
        GRN_OP_DELETE
        GRN_OP_INCR
        GRN_OP_DECR
        GRN_OP_INCR_POST
        GRN_OP_DECR_POST
        GRN_OP_NOT
        GRN_OP_ADJUST
        GRN_OP_EXACT
        GRN_OP_LCP
        GRN_OP_PARTIAL
        GRN_OP_UNSPLIT
        GRN_OP_PREFIX
        GRN_OP_SUFFIX
        GRN_OP_GEO_DISTANCE1
        GRN_OP_GEO_DISTANCE2
        GRN_OP_GEO_DISTANCE3
        GRN_OP_GEO_DISTANCE4
        GRN_OP_GEO_WITHINP5
        GRN_OP_GEO_WITHINP6
        GRN_OP_GEO_WITHINP8
        GRN_OP_OBJ_SEARCH
        GRN_OP_EXPR_GET_VAR
        GRN_OP_TABLE_CREATE
        GRN_OP_TABLE_SELECT
        GRN_OP_TABLE_SORT
        GRN_OP_TABLE_GROUP
        GRN_OP_JSON_PUT
        GRN_OP_GET_MEMBER
        GRN_OP_REGEXP

    ctypedef unsigned int grn_expr_flags

    const int GRN_EXPR_SYNTAX_QUERY          = (0x00)
    const int GRN_EXPR_SYNTAX_SCRIPT         = (0x01)
    const int GRN_EXPR_SYNTAX_OUTPUT_COLUMNS = (0x20)
    const int GRN_EXPR_SYNTAX_ADJUSTER       = (0x40)
    const int GRN_EXPR_ALLOW_PRAGMA          = (0x02)
    const int GRN_EXPR_ALLOW_COLUMN          = (0x04)
    const int GRN_EXPR_ALLOW_UPDATE          = (0x08)
    const int GRN_EXPR_ALLOW_LEADING_NOT     = (0x10)

    grn_obj *grn_expr_add_var(grn_ctx *ctx, grn_obj *expr,
                              const char *name, unsigned int name_size)
    grn_rc grn_expr_append_op(grn_ctx *ctx, grn_obj *expr, grn_operator op, int nargs)
    grn_obj *grn_expr_create(grn_ctx *ctx, const char *name, unsigned int name_size)
    grn_rc grn_expr_parse(grn_ctx *ctx, grn_obj *expr,
                          const char *str, unsigned int str_size,
                          grn_obj *default_column, grn_operator default_mode,
                          grn_operator default_op, grn_expr_flags flags)

    ctypedef grn_obj grn_table_cursor

    const int GRN_CURSOR_ASCENDING           = (0x00<<0)
    const int GRN_CURSOR_DESCENDING          = (0x01<<0)
    const int GRN_CURSOR_GE                  = (0x00<<1)
    const int GRN_CURSOR_GT                  = (0x01<<1)
    const int GRN_CURSOR_LE                  = (0x00<<2)
    const int GRN_CURSOR_LT                  = (0x01<<2)
    const int GRN_CURSOR_BY_KEY              = (0x00<<3)
    const int GRN_CURSOR_BY_ID               = (0x01<<3)
    const int GRN_CURSOR_PREFIX              = (0x01<<4)
    const int GRN_CURSOR_SIZE_BY_BIT         = (0x01<<5)
    const int GRN_CURSOR_RK                  = (0x01<<6)

    grn_table_cursor *grn_table_cursor_open(grn_ctx *ctx, grn_obj *table,
                                            const void *min, unsigned int min_size,
                                            const void *max, unsigned int max_size,
                                            int offset, int limit, int flags)
    grn_rc grn_table_cursor_close(grn_ctx *ctx, grn_table_cursor *tc)
    grn_id grn_table_cursor_next(grn_ctx *ctx, grn_table_cursor *tc)

    ctypedef struct grn_snip_mapping:
        pass

    const int GRN_SNIP_NORMALIZE             = (0x01<<0)
    const int GRN_SNIP_COPY_TAG              = (0x01<<1)
    const int GRN_SNIP_SKIP_LEADING_SPACES   = (0x01<<2)

    const grn_snip_mapping* GRN_SNIP_MAPPING_HTML_ESCAPE   = (<grn_snip_mapping*>-1)

    grn_obj *grn_expr_snip(grn_ctx *ctx, grn_obj *expr, int flags,
                           unsigned int width, unsigned int max_results,
                           unsigned int n_tags,
                           const char **opentags, unsigned int *opentag_lens,
                           const char **closetags, unsigned int *closetag_lens,
                           grn_snip_mapping *mapping)
    grn_rc grn_snip_exec(grn_ctx *ctx, grn_obj *snip,
                         const char *string, unsigned int string_len,
                         unsigned int *nresults, unsigned int *max_tagged_len)
    grn_rc grn_snip_get_result(grn_ctx *ctx, grn_obj *snip, const unsigned int index,
                               char *result, unsigned int *result_len)
