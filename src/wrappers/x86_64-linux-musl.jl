# Autogenerated wrapper script for LZO_jll for x86_64-linux-musl
export liblzo2

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `liblzo2`
const liblzo2_splitpath = ["lib", "liblzo2.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblzo2_path = ""

# liblzo2-specific global declaration
# This will be filled out by __init__()
liblzo2_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblzo2 = "liblzo2.so.2"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"LZO")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global liblzo2_path = normpath(joinpath(artifact_dir, liblzo2_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblzo2_handle = dlopen(liblzo2_path)
    push!(LIBPATH_list, dirname(liblzo2_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

