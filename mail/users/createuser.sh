#!/bin/bash

USER_FILE="/user.txt"

while read line; do
    username=$(echo "$line" | cut -d':' -f1)
    password=$(echo "$line" | cut -d':' -f2)

    # Si l'utilisateur existe déjà
    if id -u "$username" >/dev/null 2>&1; then
        echo "L'utilisateur $username existe déja"
    else
        # Ajouter l'utilisateur avec un mdp crypté
        test=$(id -u "$username")
        encrypted_password=$(openssl passwd -1 "$password")
        useradd -g vmail -m "$username" -p "$encrypted_password"
        if [ $? -eq 0 ]; then
            echo "L'utilisateur $username a été créer avec succès"
        else
            echo "Erreur: impossible de créer l'utilisateur $username."
            continue
        fi
    fi
done < "$USER_FILE"