### Installation

Cloner le projet et se placer dans le dossier counter_project
```bash
git clone https://github.com/PierreLapolla/projet-docker-kubernetes.git
cd projet-docker-kubernetes/counter_project
```

Vérifier que Docker est bien installé
```bash
docker --version
```

Vérifier que minikube est bien installé
```bash
minikube version
```

### Déploiement

Avec Docker
```bash
docker-compose up --build
```

Avec minikube (recommandé)
```bash
bash deploy.sh
```

### Optionnel : Nettoyage

Avec Docker
```bash
docker-compose down
```

Minikube
```bash
minikube stop
minikube delete
```