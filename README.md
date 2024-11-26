# Grype Scan Automation 🛡️

**Ce projet utilise [Grype](https://github.com/anchore/grype) pour analyser les vulnérabilités dans vos images Docker.**

---

## Méthode 1 : Installation de Grype sur une machine locale
### 📥 Installation de Grype

Pour installer Grype directement sur votre machine, consultez le [GitHub officiel](https://github.com/anchore/grype) et suivez les instructions adaptées à votre système d'exploitation :
- **Windows**
- **macOS**
- **Linux**

### 🚀 Utilisation avec le script Bash

1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/Scan_docker_images.git
   cd Scan_docker_images
    ```
2. Assurez-vous que Grype est installé et disponible via votre terminal.
3. Lancez le script pour scanner toutes vos images Docker locales :
   ```bash
   ./scan_docker_images.sh
    ```
4. Consultez les résultats :
   ```bash
   ls scan_results/
    ```
## Méthode 2 : Utilisation de Grype via Docker
### 🛠️ Construction de l’image Docker

1. Construisez l’image Docker avec Grype en utilisant le fichier Dockerfile fourni :
   ```bash
   docker build -t grype-container .
    ```
   
### 🚀 Lancer un scan avec Grype
2. Pour scanner une image spécifique, exécutez la commande suivante :
   ```bash
   docker run --rm -v /var/run/docker.sock:/var/run/docker.sock grype-container <nom_image>:<tag>
    ```
   **Exemple :**
   ```bash
   docker run --rm -v /var/run/docker.sock:/var/run/docker.sock grype-container nginx:latest
    ```
---

## ⚠️ Avertissement de la méthode 2 (Docker): Exposition du socket Docker

L'utilisation du **socket Docker** (`/var/run/docker.sock`) donne un accès direct au daemon Docker, ce qui permet de contrôler les conteneurs, les images, et potentiellement le système hôte. Cela peut représenter un **risque de sécurité majeur** si un conteneur est compromis. Par conséquent, **n'utilisez le socket Docker que dans des environnements de test ou des systèmes contrôlés.**

---

🗂️ Structure du projet

- **Dockerfile** : Permet de créer une image Docker contenant Grype.
- **scan_docker_images.sh** : Un script Bash qui scanne automatiquement toutes vos images Docker locales.
- **scan_results/** : Un répertoire où les résultats des scans sont sauvegardés sous forme de fichiers texte, un fichier par image scannée.

📝 Note importante : Si vous utilisez le script Bash, assurez-vous de placer ce projet au même niveau que votre fichier docker-compose.yml. Cela permettra au script de créer le dossier scan_results dans le répertoire du projet.

📚 Ressources supplémentaires

- **[Documentation officielle de Grype](https://github.com/anchore/grype)**
- **[Pourquoi l’exposition du socket Docker est risquée](https://blog.quarkslab.com/why-is-exposing-the-docker-socket-a-really-bad-idea.html)**
- **[Base officielle des CVE](https://cve.mitre.org/)**

