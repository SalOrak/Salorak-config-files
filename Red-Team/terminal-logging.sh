# smart_script will continuously log the input and output of the terminal into a logfile located in ~/Terminal_typescript/raw/


smart_script(){
    # if there's no SCRIPT_LOG_FILE exported yet
    if [ -z "$SCRIPT_LOG_FILE" ]; then
        # make folder paths
        logdirparent=~/Terminal_typescripts
        logdirraw=raw/$(date +%F)
        logdir=$logdirparent/$logdirraw
        logfile=$logdir/$(date +%F_%T).$$.rawlog
                                txtfile=$logdir/$(date +%F_%T).$$.txt
        # if no folder exist - make one
        if [ ! -d $logdir ]; then
            mkdir -p $logdir
        fi
        export SCRIPT_LOG_FILE=$logfile
        export SCRIPT_LOG_PARENT_FOLDER=$logdirparent
        export TXTFILE=$txtfile


        # quiet output if no args are passed
        if [ ! -z "$1" ]; then
            script -f $logfile
            cat $logfile| perl -pe 's/\\e([^\\[\\]]|\\[.*?[a-zA-Z]|\\].*?\\a)//g' | col -b > $txtfile
        else
            script -f -q $logfile
            cat $logfile | perl -pe 's/\\e([^\\[\\]]|\\[.*?[a-zA-Z]|\\].*?\\a)//g' | col -b > $txtfile
        fi
        exit
    fi
}
# Start logging into new file
alias startnewlog='unset SCRIPT_LOG_FILE && smart_script -v'


# savelog manually saves the current terminal in/out into a logfile: 
# Example: $ savelog logname
savelog(){
    # make folder path
    manualdir=$SCRIPT_LOG_PARENT_FOLDER/manual
    # if no folder exists - make one
    if [ ! -d $manualdir ]; then
        mkdir -p $manualdir
    fi
    # make log name
    logname=${SCRIPT_LOG_FILE##*/}
    logname=${logname%.*}
    # add user logname if passed as argument
    if [ ! -z $1 ]; then
        logname=$logname'_'$1
    fi
    # make filepaths
    txtfile=$manualdir/$logname'.txt'
    rawfile=$manualdir/$logname'.rawlog'
    # make .rawlog readable and save it to .txt file
    cat $SCRIPT_LOG_FILE | perl -pe 's/\\e([^\\[\\]]|\\[.*?[a-zA-Z]|\\].*?\\a)//g' | col -b > $txtfile
    # copy corresponding .rawfile
    cp $SCRIPT_LOG_FILE $rawfile
    printf '[+] Saved logs'
    echo ""
    printf '  \\\\-> '$txtfile''
    echo ""
    printf '  \\\\-> '$rawfile''
}


# Run Smart Script at terminal initialization
smart_script
