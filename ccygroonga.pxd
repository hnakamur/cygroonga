cdef extern from "groonga/groonga.h":
    ctypedef unsigned int grn_id

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

    grn_obj *grn_table_create(grn_ctx *ctx,
                              const char *name, unsigned int name_size,
                              const char *path, grn_obj_flags flags,
                              grn_obj *key_type, grn_obj *value_type)
    grn_id grn_table_add(grn_ctx *ctx, grn_obj *table,
                         const void *key, unsigned int key_size, int *added)

    grn_obj *grn_column_create(grn_ctx *ctx, grn_obj *table,
                               const char *name, unsigned int name_size,
                               const char *path, grn_obj_flags flags, grn_obj *type)

    grn_obj *grn_obj_column(grn_ctx *ctx, grn_obj *table,
                            const char *name, unsigned int name_size)
    int grn_obj_name(grn_ctx *ctx, grn_obj *obj, char *namebuf, int buf_size)
    const char *grn_obj_path(grn_ctx *ctx, grn_obj *obj)
    grn_rc grn_obj_remove(grn_ctx *ctx, grn_obj *obj)
    void grn_obj_unlink(grn_ctx *ctx, grn_obj *obj)
