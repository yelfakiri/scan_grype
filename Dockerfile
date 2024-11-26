# Utiliser une image légère
FROM debian:bullseye-slim

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Télécharger et installer Grype
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | bash

# Définir un répertoire de travail
WORKDIR /workspace

# Définir Grype comme commande par défaut
ENTRYPOINT ["grype"]