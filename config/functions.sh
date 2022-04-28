print_step() {
    STEP=$1
    shift; # shift argumetens
    DESCRIPTION=$@
    echo -e "${BOLD_BLUE}[$STEP]${NC} - ${BOLD_BLUE}${DESCRIPTION}${NC}"
}

print_error() {
    DESCRIPTION=$1
    echo -e "${BOLD_RED}[Error]${NC} - ${BOLD_RED}${DESCRIPTION}${NC}"
}

print_message() {
    TOPIC=$1
    shift;
    DESCRIPTION=$@
    echo -e "${BOLD_GREEN}[Checked]${NC} - ${DESCRIPTION}"
}