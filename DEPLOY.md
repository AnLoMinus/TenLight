# 🚀 מדריך פריסה - TenLight

מדריך זה מפרט את כל השלבים הנדרשים לפריסת הפרויקט TenLight.

## 🎯 מטרת המדריך

מדריך זה מפרט את כל השלבים הנדרשים לפריסת הפרויקט TenLight.

## 📋 סוגי פריסה

### פריסה מקומית (Local Deployment)
- **פריסה מקומית** - פריסה מקומית של הפרויקט
- **פריסה מקומית** - פריסה מקומית של הקוד
- **פריסה מקומית** - פריסה מקומית של התמונות
- **פריסה מקומית** - פריסה מקומית של הטקסטים

### פריסה בפיתוח (Development Deployment)
- **פריסה בפיתוח** - פריסה בפיתוח של הפרויקט
- **פריסה בפיתוח** - פריסה בפיתוח של הקוד
- **פריסה בפיתוח** - פריסה בפיתוח של התמונות
- **פריסה בפיתוח** - פריסה בפיתוח של הטקסטים

### פריסה בייצור (Production Deployment)
- **פריסה בייצור** - פריסה בייצור של הפרויקט
- **פריסה בייצור** - פריסה בייצור של הקוד
- **פריסה בייצור** - פריסה בייצור של התמונות
- **פריסה בייצור** - פריסה בייצור של הטקסטים

## 🚀 פריסה מהירה

### פריסה עם Docker

```bash
# בניית Docker image
docker build -t tenlight .

# הפעלת Docker container
docker run -p 3000:3000 tenlight

# הפעלת Docker compose
docker-compose up -d
```

### פריסה עם Kubernetes

```bash
# פריסה עם kubectl
kubectl apply -f k8s/

# בדיקת סטטוס
kubectl get pods

# בדיקת שירותים
kubectl get services
```

### פריסה עם Heroku

```bash
# התקנת Heroku CLI
npm install -g heroku

# התחברות ל-Heroku
heroku login

# יצירת אפליקציה
heroku create tenlight

# פריסה
git push heroku main
```

## 🔧 הגדרת פריסה

### הגדרת Docker

```dockerfile
# Dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

### הגדרת Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  tenlight:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    volumes:
      - ./data:/app/data
```

### הגדרת Kubernetes

```yaml
# k8s/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tenlight
spec:
  replicas: 3
  selector:
    matchLabels:
      app: tenlight
  template:
    metadata:
      labels:
        app: tenlight
    spec:
      containers:
      - name: tenlight
        image: tenlight:latest
        ports:
        - containerPort: 3000
```

## 📊 מעקב וניטור

### מעקב עם Prometheus

```bash
# התקנת Prometheus
helm install prometheus prometheus-community/prometheus

# הגדרת Grafana
helm install grafana grafana/grafana
```

### מעקב עם ELK Stack

```bash
# התקנת Elasticsearch
helm install elasticsearch elastic/elasticsearch

# התקנת Logstash
helm install logstash elastic/logstash

# התקנת Kibana
helm install kibana elastic/kibana
```

### מעקב עם New Relic

```bash
# התקנת New Relic
npm install newrelic

# הגדרת New Relic
export NEW_RELIC_LICENSE_KEY=your_license_key
```

## 🔒 אבטחה

### אבטחה עם SSL

```bash
# יצירת SSL certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

# הגדרת HTTPS
export HTTPS=true
export SSL_CERT_FILE=cert.pem
export SSL_KEY_FILE=key.pem
```

### אבטחה עם Firewall

```bash
# הגדרת Firewall
ufw enable
ufw allow 22
ufw allow 80
ufw allow 443
ufw allow 3000
```

### אבטחה עם VPN

```bash
# התקנת OpenVPN
apt install openvpn

# הגדרת OpenVPN
openvpn --config client.ovpn
```

## 📚 משאבים נוספים

### תיעוד
- **Docker**: [docs.docker.com](https://docs.docker.com)
- **Kubernetes**: [kubernetes.io/docs](https://kubernetes.io/docs)
- **Heroku**: [devcenter.heroku.com](https://devcenter.heroku.com)
- **AWS**: [docs.aws.amazon.com](https://docs.aws.amazon.com)

### קהילה
- **GitHub**: [github.com/tenlight](https://github.com/tenlight)
- **Discord**: [discord.gg/tenlight](https://discord.gg/tenlight)
- **Reddit**: [reddit.com/r/tenlight](https://reddit.com/r/tenlight)
- **Twitter**: [twitter.com/tenlight](https://twitter.com/tenlight)

### תמיכה
- **תמיכה טכנית**: [support@tenlight.org](mailto:support@tenlight.org)
- **תמיכה קהילתית**: [community@tenlight.org](mailto:community@tenlight.org)
- **תמיכה כללית**: [help@tenlight.org](mailto:help@tenlight.org)

---

## 🙏 תודה

תודה על ההצטרפות לפרויקט TenLight!

> "וְהָיָה כִּי יִקְרָא אֶתְכֶם מֹשֶׁה, וְנִגַּשׁ אֲלֵיכֶם כָּל אֲשֶׁר נְדָבוֹ רוּחוֹ" — שמות ל״ה:כ״א

*פריסה היא זכות וחובה של כל מפתח.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
