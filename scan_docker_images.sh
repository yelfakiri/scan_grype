#!/bin/bash

# Créer un dossier pour sauvegarder les résultats des scans
mkdir -p scan_results

# Récupérer la liste des images Docker locales
images=$(docker images --format "{{.Repository}}:{{.Tag}}")

# Vérifier s'il y a des images locales
if [ -z "$images" ]; then
    echo "Aucune image Docker trouvée."
    exit 1
fi

# Scanner chaque image avec Grype
for image in $images; do
    echo "Scanning image: $image..."
    
    # Nettoyer le nom de l'image pour un nom de fichier valide
    safe_image_name=$(echo "$image" | sed 's/[^a-zA-Z0-9_.-]/_/g')
    output_file="scan_results/${safe_image_name}.txt"

    # Effectuer le scan
    grype $image > "$output_file"
    
    if [ $? -eq 0 ]; then
        echo "Scan terminé pour $image. Résultat sauvegardé dans $output_file"
    else
        echo "Erreur lors du scan de $image."
    fi
done

echo "Tous les scans sont terminés. Résultats dans le dossier scan_results."