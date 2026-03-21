#!/bin/bash

verify_user_entry(){
    if [ -z "$username" ]; then
        echo "Error: Username cannot be empty"
        return 1
    fi
}
verify_user() {
    local username=$1
    verify_user_entry "$username"
    
    if grep "^$username:" /etc/passwd &>/dev/null; then
        echo "The user '$username' exists"
    else
        echo "The user '$username' does not exist"
    fi
}

get_user_id() {
    local username=$1
    verify_user_entry "$username"
    
    if grep "^$username:" /etc/passwd &>/dev/null; then
        local uid=$(id -u "$username")
        echo "UID of '$username': $uid"
    else
        echo "Error: User '$username' does not exist"
    fi
}

entry_user() {
    echo -n "Entry username: "
    read username
    echo "$username"
}

stopped() {
    echo "Press ENTER to continue"
    read
}

main() {
    rep=1
    while [ "$rep" -eq 1 ]; do
        clear
        echo "----------- Menu ------------"
        echo -e "1. Verify the user's existence"
        echo -e "2. Get UID"
        echo -e "q. Close\n"
        echo -n "Option: "
        read option

        case "$option" in
            1) 
                username=$(entry_user)
                verify_user "$username"
                stopped
                ;;
            2) 
                username=$(entry_user)
                get_user_id "$username"
                stopped
                ;;
            q)
                echo "Goodbye!"
                rep=0
                ;;
            *)
                echo "Syntax error. Please try again!"
                stopped
                ;;
        esac
    done
}

main