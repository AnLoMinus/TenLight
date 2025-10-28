# 🏗️ ארכיטקטורה - TenLight

זהו מדריך מקיף לארכיטקטורה של פרויקט TenLight.

## 🎯 עקרונות ארכיטקטורה

### עקרונות יסוד
- **מודולריות** - רכיבים נפרדים ועצמאיים
- **סקלביליות** - יכולת הרחבה וצמיחה
- **נגישות** - נגיש לכל אדם וטכנולוגיה
- **ביצועים** - מהירות ויעילות
- **אבטחה** - הגנה על מידע ופרטיות
- **שמירות** - קל לתחזוקה ועדכון

### עקרונות רוחניים
- **אחדות** - כל הרכיבים פועלים בהרמוניה
- **שלמות** - כל חלק משלים את השלם
- **איזון** - איזון בין טכנולוגיה לרוחניות
- **שקיפות** - שקיפות מלאה בתהליכים

## 🏛️ מבנה כללי

```
TenLight Architecture
├── 🌐 Frontend Layer
│   ├── Web Application (React/Next.js)
│   ├── Mobile Application (React Native)
│   └── Desktop Application (Electron)
├── 🔌 API Layer
│   ├── REST API (Node.js/Express)
│   ├── GraphQL API (Node.js/Apollo)
│   └── WebSocket API (Node.js/Socket.io)
├── 🧠 Business Logic Layer
│   ├── Commandments Service
│   ├── Kabbalah Service
│   ├── Torah Analysis Service
│   └── Translation Service
├── 💾 Data Layer
│   ├── Primary Database (PostgreSQL)
│   ├── Cache Layer (Redis)
│   ├── Search Engine (Elasticsearch)
│   └── File Storage (AWS S3)
└── 🔧 Infrastructure Layer
    ├── Container Orchestration (Kubernetes)
    ├── CI/CD Pipeline (GitHub Actions)
    ├── Monitoring (Prometheus/Grafana)
    └── Logging (ELK Stack)
```

## 🌐 Frontend Layer

### Web Application
```typescript
// מבנה React Components
src/
├── components/           # רכיבים נפרדים
│   ├── CommandmentCard/  # כרטיס דיבר
│   ├── SefiraVisualization/ # ויזואליזציית ספירה
│   ├── SearchBox/       # תיבת חיפוש
│   └── Navigation/      # ניווט
├── pages/               # עמודים
│   ├── Commandments/    # עמוד דיברות
│   ├── Kabbalah/        # עמוד קבלה
│   ├── Torah/           # עמוד תורה
│   └── About/           # עמוד אודות
├── hooks/               # Custom Hooks
├── utils/               # פונקציות עזר
├── types/               # הגדרות TypeScript
└── styles/              # עיצוב
```

### Mobile Application
```typescript
// מבנה React Native
src/
├── screens/             # מסכים
├── components/          # רכיבים
├── navigation/          # ניווט
├── services/            # שירותים
└── utils/               # פונקציות עזר
```

### Desktop Application
```typescript
// מבנה Electron
src/
├── main/                # Main Process
├── renderer/            # Renderer Process
├── preload/             # Preload Scripts
└── shared/              # קוד משותף
```

## 🔌 API Layer

### REST API
```javascript
// מבנה Express.js
src/
├── routes/              # נתיבי API
│   ├── commandments/    # API דיברות
│   ├── kabbalah/        # API קבלה
│   ├── torah/           # API תורה
│   └── translations/    # API תרגומים
├── controllers/         # בקרים
├── middleware/          # Middleware
├── models/              # מודלים
└── services/            # שירותים
```

### GraphQL API
```javascript
// מבנה Apollo Server
src/
├── schema/              # Schema GraphQL
├── resolvers/           # Resolvers
├── types/               # Types
└── dataSources/        # Data Sources
```

### WebSocket API
```javascript
// מבנה Socket.io
src/
├── events/              # אירועים
├── rooms/               # חדרים
├── middleware/          # Middleware
└── handlers/            # Handlers
```

## 🧠 Business Logic Layer

### Commandments Service
```typescript
interface CommandmentService {
  getCommandment(id: number): Promise<Commandment>;
  getAllCommandments(): Promise<Commandment[]>;
  searchCommandments(query: string): Promise<Commandment[]>;
  getCommandmentBySefira(sefira: Sefira): Promise<Commandment>;
}

class CommandmentServiceImpl implements CommandmentService {
  // Implementation
}
```

### Kabbalah Service
```typescript
interface KabbalahService {
  getSefira(id: number): Promise<Sefira>;
  getAllSefirot(): Promise<Sefira[]>;
  getSefiraTree(): Promise<SefiraTree>;
  getSefiraConnections(sefira: Sefira): Promise<Connection[]>;
}

class KabbalahServiceImpl implements KabbalahService {
  // Implementation
}
```

### Torah Analysis Service
```typescript
interface TorahAnalysisService {
  analyzeText(text: string): Promise<AnalysisResult>;
  getCommentaries(verse: string): Promise<Commentary[]>;
  getTranslations(verse: string): Promise<Translation[]>;
  getContext(verse: string): Promise<Context>;
}

class TorahAnalysisServiceImpl implements TorahAnalysisService {
  // Implementation
}
```

## 💾 Data Layer

### Primary Database (PostgreSQL)
```sql
-- מבנה בסיס נתונים
CREATE TABLE commandments (
  id SERIAL PRIMARY KEY,
  number INTEGER NOT NULL,
  text_hebrew TEXT NOT NULL,
  text_english TEXT,
  text_arabic TEXT,
  category VARCHAR(50),
  sefira_id INTEGER,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE sefirot (
  id SERIAL PRIMARY KEY,
  name_hebrew VARCHAR(100) NOT NULL,
  name_english VARCHAR(100),
  name_arabic VARCHAR(100),
  description TEXT,
  color VARCHAR(7),
  position_x INTEGER,
  position_y INTEGER,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE connections (
  id SERIAL PRIMARY KEY,
  from_sefira_id INTEGER REFERENCES sefirot(id),
  to_sefira_id INTEGER REFERENCES sefirot(id),
  connection_type VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
```

### Cache Layer (Redis)
```javascript
// מבנה Cache
const cacheKeys = {
  commandment: (id) => `commandment:${id}`,
  sefira: (id) => `sefira:${id}`,
  search: (query) => `search:${query}`,
  translation: (text, lang) => `translation:${text}:${lang}`
};

class CacheService {
  async get(key) {
    return await redis.get(key);
  }
  
  async set(key, value, ttl = 3600) {
    return await redis.setex(key, ttl, JSON.stringify(value));
  }
  
  async invalidate(pattern) {
    const keys = await redis.keys(pattern);
    if (keys.length > 0) {
      return await redis.del(...keys);
    }
  }
}
```

### Search Engine (Elasticsearch)
```javascript
// מבנה Elasticsearch
const commandmentMapping = {
  mappings: {
    properties: {
      id: { type: 'integer' },
      number: { type: 'integer' },
      text_hebrew: { 
        type: 'text',
        analyzer: 'hebrew_analyzer'
      },
      text_english: { 
        type: 'text',
        analyzer: 'english_analyzer'
      },
      text_arabic: { 
        type: 'text',
        analyzer: 'arabic_analyzer'
      },
      category: { type: 'keyword' },
      sefira: { type: 'keyword' },
      created_at: { type: 'date' }
    }
  }
};
```

## 🔧 Infrastructure Layer

### Container Orchestration (Kubernetes)
```yaml
# מבנה Kubernetes
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tenlight-api
spec:
  replicas: 3
  selector:
    matchLabels:
      app: tenlight-api
  template:
    metadata:
      labels:
        app: tenlight-api
    spec:
      containers:
      - name: api
        image: tenlight/api:latest
        ports:
        - containerPort: 3000
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: database-secret
              key: url
```

### CI/CD Pipeline (GitHub Actions)
```yaml
# מבנה CI/CD
name: CI/CD Pipeline
on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    - name: Install dependencies
      run: npm ci
    - name: Run tests
      run: npm test
    - name: Run linting
      run: npm run lint
    - name: Build
      run: npm run build
```

## 🔒 אבטחה

### Authentication & Authorization
```typescript
// מבנה Auth
interface AuthService {
  login(credentials: LoginCredentials): Promise<AuthToken>;
  logout(token: AuthToken): Promise<void>;
  refreshToken(token: AuthToken): Promise<AuthToken>;
  validateToken(token: AuthToken): Promise<boolean>;
  getUserPermissions(userId: string): Promise<Permission[]>;
}

class JWTService implements AuthService {
  // Implementation
}
```

### Data Encryption
```typescript
// מבנה Encryption
class EncryptionService {
  encrypt(data: string, key: string): string {
    // AES encryption
  }
  
  decrypt(encryptedData: string, key: string): string {
    // AES decryption
  }
  
  hashPassword(password: string): string {
    // bcrypt hashing
  }
  
  verifyPassword(password: string, hash: string): boolean {
    // bcrypt verification
  }
}
```

## 📊 ניטור וביצועים

### Monitoring Stack
```yaml
# מבנה Monitoring
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
  
  grafana:
    image: grafana/grafana
    ports:
      - "3001:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin
  
  elasticsearch:
    image: elasticsearch:7.15.0
    environment:
      - discovery.type=single-node
  
  kibana:
    image: kibana:7.15.0
    ports:
      - "5601:5601"
```

### Performance Metrics
```typescript
// מבנה Metrics
interface MetricsService {
  recordRequest(method: string, path: string, duration: number): void;
  recordError(error: Error, context: any): void;
  recordUserAction(action: string, userId: string): void;
  getMetrics(timeRange: TimeRange): Promise<Metrics>;
}

class PrometheusMetricsService implements MetricsService {
  // Implementation
}
```

## 🚀 דיפלוי

### Environment Configuration
```typescript
// מבנה Environment
interface EnvironmentConfig {
  database: {
    host: string;
    port: number;
    name: string;
    username: string;
    password: string;
  };
  redis: {
    host: string;
    port: number;
    password: string;
  };
  elasticsearch: {
    host: string;
    port: number;
    username: string;
    password: string;
  };
  aws: {
    region: string;
    accessKeyId: string;
    secretAccessKey: string;
  };
}

class ConfigService {
  static getConfig(): EnvironmentConfig {
    // Load from environment variables
  }
}
```

### Deployment Strategy
```yaml
# מבנה Deployment
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: tenlight-app
spec:
  project: default
  source:
    repoURL: https://github.com/tenlight/tenlight
    targetRevision: HEAD
    path: k8s
  destination:
    server: https://kubernetes.default.svc
    namespace: tenlight
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## 🔄 תהליכי פיתוח

### Git Workflow
```bash
# מבנה Git
main                    # Production branch
├── develop            # Development branch
├── feature/commandment-card    # Feature branches
├── feature/kabbalah-viz        # Feature branches
├── bugfix/search-issue         # Bugfix branches
└── hotfix/critical-bug         # Hotfix branches
```

### Code Review Process
```typescript
// מבנה Code Review
interface CodeReview {
  id: string;
  author: string;
  reviewers: string[];
  status: 'pending' | 'approved' | 'rejected';
  comments: Comment[];
  changes: Change[];
  createdAt: Date;
  updatedAt: Date;
}

class CodeReviewService {
  createReview(pullRequest: PullRequest): Promise<CodeReview>;
  addComment(reviewId: string, comment: Comment): Promise<void>;
  approveReview(reviewId: string, reviewer: string): Promise<void>;
  rejectReview(reviewId: string, reviewer: string, reason: string): Promise<void>;
}
```

## 📚 משאבים נוספים

### כלי פיתוח
- [React](https://reactjs.org/)
- [Next.js](https://nextjs.org/)
- [TypeScript](https://www.typescriptlang.org/)
- [Node.js](https://nodejs.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)
- [Elasticsearch](https://www.elastic.co/)

### כלי DevOps
- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/)
- [GitHub Actions](https://github.com/features/actions)
- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)

---

## 🙏 תודה

תודה לכל המפתחים והארכיטקטים שתורמים לבניית הפרויקט הזה.

> "וְהָיָה כִּי יִקְרָא אֶתְכֶם מֹשֶׁה, וְנִגַּשׁ אֲלֵיכֶם כָּל אֲשֶׁר נְדָבוֹ רוּחוֹ" — שמות ל״ה:כ״א

*ארכיטקטורה טובה היא יסוד לבניין יציב ונצחי.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
