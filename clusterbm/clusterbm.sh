# Pressing CTRL-C will stop the whole execution of the script
trap ctrl_c INT; 
function ctrl_c() { exit 5; }

# variables

CMD_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
CMD_NAME=$(basename "${BASH_SOURCE[0]}")
INFO=false
TREE_OPTIONS=()

while [ -n "${1}" ]; do
    case ${1} in
        -h|--help) 
            INFO=true
            ;;
        *)
            TREE_OPTIONS+=( $1 )
            shift
            continue
            ;;
        --)
            shift
            break
            ;;
    esac
    shift
done

SCRIPT_FILE="${CMD_DIR}/clusterbm/maketree.py"

export HOME_PATH=$CMD_DIR
if $INFO
then
    python3 "${SCRIPT_FILE}" --help
else
    python3 "${SCRIPT_FILE}" ${TREE_OPTIONS[@]}
fi
