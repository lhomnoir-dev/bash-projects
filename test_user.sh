#!/bin/bash

get_username(){
   local username=$1
    
    # If entry is empty return the current username
    if [ -z "$username" ]; then
        echo "USERNAME=$(whoami)"

    else
        if grep "^$username:" /etc/passwd >/dev/null 2>&1; then
            echo "The user $username exists"
        else
            echo "Error: user $username does not exist"
        fi
    fi
}

get_uid(){
    local username=$1

    # If entry is empty display the id of current user
    if [ -z "$username" ]; then
        echo "UID=$(id -u)"
    
    else
        if grep "^$username:" /etc/passwd >/dev/null 2>&1; then
            echo "UID=$(id -u "$username")"
        else
            echo "Error: user does not exist"

        fi
    fi
}

main(){
    
    while true; do
        echo "1 - Vérifier l'existence d'un utilisateur"
        echo "2 - Connaître l'UID d'un utilisateur"
        echo "q - Quitter"

        echo -n "Option: "
        read -r option
        
        case "$option" in
            1)
                echo -n "username: "
                read -r username
                get_username "$username"
                ;;
            
            2)
                echo -n "username: "
                read -r username
                get_uid "$username"
                ;;
            
            q)
                echo "Merci! Au revoir"
                break
                ;;
            *)
                echo "Saisie invalide!"
                continue
                ;;
        esac

    done

}
main