# Grype Scan Automation 🛡️

**Ce projet utilise [Grype](https://github.com/anchore/grype) pour analyser les vulnérabilités dans vos images Docker.**

## 📥 Installation de Grype
Pour installer Grype, consultez le [GitHub officiel](https://github.com/anchore/grype) et suivez les instructions pour votre système d'exploitation :
- Windows
- macOS
- Linux

## 🗂️ Structure du projet
- **`scan_docker_images.sh`** : Un script Bash qui scanne automatiquement toutes vos images Docker locales.
- **`scan_results/`** : Un répertoire où les résultats des scans sont sauvegardés sous forme de fichiers texte, un fichier par image scannée.

**📝 Note** : Assurez-vous de placer ce projet au même niveau que votre fichier `docker-compose.yml`. Cela permettra au script de créer le dossier `scan_results` dans le répertoire du projet.

## 🚀 Utilisation
1. Clonez ce dépôt :
   ```bash
   git clone https://github.com/votre-utilisateur/Scan_docker_images.git
   cd Scan_docker_images
   ```
2. Lancez le script pour scanner vos images Docker :
    ```bash
    ./scan_docker_images.sh
    ```
3. Consultez les résultats dans le dossier
    ```bash
    scan_results/.
    ```
