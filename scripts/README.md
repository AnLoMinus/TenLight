# TenLight - סקריפטים וכלי CLI

זהו מדריך לסקריפטים וכלי CLI בפרויקט TenLight.

## 🛠️ כלי CLI זמינים

### בניית הפרויקט
```bash
# בניית הפרויקט
npm run build
python scripts/build.py

# בנייה לפיתוח
npm run build:dev
python scripts/build.py --dev

# בנייה לייצור
npm run build:prod
python scripts/build.py --prod
```

### בדיקות
```bash
# הרצת כל הבדיקות
npm run test
python scripts/test.py

# בדיקות יחידה
npm run test:unit
python scripts/test.py --unit

# בדיקות אינטגרציה
npm run test:integration
python scripts/test.py --integration

# בדיקות E2E
npm run test:e2e
python scripts/test.py --e2e
```

### פיתוח
```bash
# הפעלת שרת פיתוח
npm run dev
python scripts/dev.py

# הפעלת שרת פיתוח עם hot reload
npm run dev:watch
python scripts/dev.py --watch

# הפעלת שרת פיתוח על פורט מותאם
npm run dev -- --port 3001
python scripts/dev.py --port 3001
```

### דיפלוי
```bash
# דיפלוי לסטייג'ינג
npm run deploy:staging
python scripts/deploy.py --env staging

# דיפלוי לייצור
npm run deploy:prod
python scripts/deploy.py --env production

# דיפלוי עם אישור
npm run deploy:prod -- --confirm
python scripts/deploy.py --env production --confirm
```

## 📁 מבנה הסקריפטים

```
scripts/
├── build/                    # סקריפטי בנייה
│   ├── build.js              # בנייה JavaScript
│   ├── build.py              # בנייה Python
│   └── build.sh              # בנייה Shell
├── dev/                      # סקריפטי פיתוח
│   ├── dev.js                # שרת פיתוח JavaScript
│   ├── dev.py                # שרת פיתוח Python
│   └── dev.sh                # שרת פיתוח Shell
├── test/                     # סקריפטי בדיקות
│   ├── test.js                # בדיקות JavaScript
│   ├── test.py                # בדיקות Python
│   └── test.sh                # בדיקות Shell
├── deploy/                    # סקריפטי דיפלוי
│   ├── deploy.js              # דיפלוי JavaScript
│   ├── deploy.py              # דיפלוי Python
│   └── deploy.sh              # דיפלוי Shell
├── utils/                     # כלי עזר
│   ├── data-generator.js      # יצירת נתונים
│   ├── data-generator.py      # יצירת נתונים
│   └── cleanup.sh             # ניקוי קבצים
└── cli/                       # כלי CLI
    ├── tenlight.js            # CLI ראשי
    ├── tenlight.py            # CLI ראשי
    └── tenlight.sh            # CLI ראשי
```

## 🚀 כלי CLI ראשי

### TenLight CLI
```bash
# התקנה
npm install -g tenlight-cli
pip install tenlight-cli

# שימוש
tenlight --help
tenlight init
tenlight build
tenlight test
tenlight deploy
```

### פקודות זמינות
```bash
# אתחול פרויקט חדש
tenlight init [project-name]

# בניית הפרויקט
tenlight build [options]

# הרצת בדיקות
tenlight test [options]

# דיפלוי
tenlight deploy [environment]

# יצירת רכיב חדש
tenlight generate component [name]

# יצירת עמוד חדש
tenlight generate page [name]

# יצירת API endpoint
tenlight generate api [name]

# ניתוח קוד
tenlight analyze

# ניקוי קבצים
tenlight clean

# עדכון תלויות
tenlight update

# הצגת מידע על הפרויקט
tenlight info

# הצגת סטטיסטיקות
tenlight stats
```

## 🔧 סקריפטי בנייה

### JavaScript/TypeScript
```javascript
// scripts/build/build.js
const { execSync } = require('child_process');
const path = require('path');

function buildProject(options = {}) {
  const { env = 'production', watch = false } = options;
  
  console.log(`🏗️ Building project for ${env}...`);
  
  try {
    // בניית TypeScript
    execSync('tsc --build', { stdio: 'inherit' });
    
    // בניית React
    execSync('npm run build:react', { stdio: 'inherit' });
    
    // בניית CSS
    execSync('npm run build:css', { stdio: 'inherit' });
    
    console.log('✅ Build completed successfully!');
  } catch (error) {
    console.error('❌ Build failed:', error.message);
    process.exit(1);
  }
}

module.exports = { buildProject };
```

### Python
```python
# scripts/build/build.py
import subprocess
import sys
import argparse

def build_project(env='production', watch=False):
    """Build the project for the specified environment."""
    print(f"🏗️ Building project for {env}...")
    
    try:
        # Build Python package
        subprocess.run(['python', '-m', 'build'], check=True)
        
        # Build documentation
        subprocess.run(['python', '-m', 'sphinx', 'docs/', 'docs/_build/'], check=True)
        
        print("✅ Build completed successfully!")
    except subprocess.CalledProcessError as e:
        print(f"❌ Build failed: {e}")
        sys.exit(1)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Build TenLight project')
    parser.add_argument('--env', default='production', help='Build environment')
    parser.add_argument('--watch', action='store_true', help='Watch for changes')
    
    args = parser.parse_args()
    build_project(args.env, args.watch)
```

## 🧪 סקריפטי בדיקות

### JavaScript/TypeScript
```javascript
// scripts/test/test.js
const { execSync } = require('child_process');

function runTests(options = {}) {
  const { type = 'all', coverage = false, watch = false } = options;
  
  console.log(`🧪 Running ${type} tests...`);
  
  try {
    let command = 'npm test';
    
    if (type === 'unit') {
      command = 'npm run test:unit';
    } else if (type === 'integration') {
      command = 'npm run test:integration';
    } else if (type === 'e2e') {
      command = 'npm run test:e2e';
    }
    
    if (coverage) {
      command += ' --coverage';
    }
    
    if (watch) {
      command += ' --watch';
    }
    
    execSync(command, { stdio: 'inherit' });
    console.log('✅ Tests completed successfully!');
  } catch (error) {
    console.error('❌ Tests failed:', error.message);
    process.exit(1);
  }
}

module.exports = { runTests };
```

### Python
```python
# scripts/test/test.py
import subprocess
import sys
import argparse

def run_tests(test_type='all', coverage=False, watch=False):
    """Run tests for the project."""
    print(f"🧪 Running {test_type} tests...")
    
    try:
        command = ['pytest']
        
        if test_type == 'unit':
            command.append('tests/unit/')
        elif test_type == 'integration':
            command.append('tests/integration/')
        elif test_type == 'e2e':
            command.append('tests/e2e/')
        else:
            command.append('tests/')
        
        if coverage:
            command.extend(['--cov=src', '--cov-report=html'])
        
        if watch:
            command.append('--watch')
        
        subprocess.run(command, check=True)
        print("✅ Tests completed successfully!")
    except subprocess.CalledProcessError as e:
        print(f"❌ Tests failed: {e}")
        sys.exit(1)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Run TenLight tests')
    parser.add_argument('--type', default='all', help='Test type')
    parser.add_argument('--coverage', action='store_true', help='Generate coverage report')
    parser.add_argument('--watch', action='store_true', help='Watch for changes')
    
    args = parser.parse_args()
    run_tests(args.type, args.coverage, args.watch)
```

## 🚀 סקריפטי דיפלוי

### JavaScript/TypeScript
```javascript
// scripts/deploy/deploy.js
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

function deployProject(environment, options = {}) {
  const { confirm = false, dryRun = false } = options;
  
  console.log(`🚀 Deploying to ${environment}...`);
  
  if (!confirm && !dryRun) {
    console.log('⚠️ Use --confirm flag to proceed with deployment');
    return;
  }
  
  try {
    // Build project
    execSync('npm run build', { stdio: 'inherit' });
    
    // Run tests
    execSync('npm test', { stdio: 'inherit' });
    
    if (dryRun) {
      console.log('🔍 Dry run completed - no actual deployment');
      return;
    }
    
    // Deploy based on environment
    if (environment === 'staging') {
      execSync('npm run deploy:staging', { stdio: 'inherit' });
    } else if (environment === 'production') {
      execSync('npm run deploy:prod', { stdio: 'inherit' });
    }
    
    console.log('✅ Deployment completed successfully!');
  } catch (error) {
    console.error('❌ Deployment failed:', error.message);
    process.exit(1);
  }
}

module.exports = { deployProject };
```

### Python
```python
# scripts/deploy/deploy.py
import subprocess
import sys
import argparse

def deploy_project(environment, confirm=False, dry_run=False):
    """Deploy the project to the specified environment."""
    print(f"🚀 Deploying to {environment}...")
    
    if not confirm and not dry_run:
        print("⚠️ Use --confirm flag to proceed with deployment")
        return
    
    try:
        # Build project
        subprocess.run(['python', '-m', 'build'], check=True)
        
        # Run tests
        subprocess.run(['pytest'], check=True)
        
        if dry_run:
            print("🔍 Dry run completed - no actual deployment")
            return
        
        # Deploy based on environment
        if environment == 'staging':
            subprocess.run(['python', '-m', 'deploy', '--env', 'staging'], check=True)
        elif environment == 'production':
            subprocess.run(['python', '-m', 'deploy', '--env', 'production'], check=True)
        
        print("✅ Deployment completed successfully!")
    except subprocess.CalledProcessError as e:
        print(f"❌ Deployment failed: {e}")
        sys.exit(1)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Deploy TenLight project')
    parser.add_argument('environment', help='Deployment environment')
    parser.add_argument('--confirm', action='store_true', help='Confirm deployment')
    parser.add_argument('--dry-run', action='store_true', help='Dry run deployment')
    
    args = parser.parse_args()
    deploy_project(args.environment, args.confirm, args.dry_run)
```

## 🔧 כלי עזר

### יצירת נתונים
```javascript
// scripts/utils/data-generator.js
const fs = require('fs');
const path = require('path');

function generateTestData() {
  const commandments = [
    {
      number: 1,
      text: 'אָנֹכִי ה׳ אֱלֹקֶיךָ אֲשֶׁר הוֹצֵאתִיךָ מֵאֶרֶץ מִצְרַיִם מִבֵּית עֲבָדִים',
      category: 'between-man-and-god',
      sefira: 'keter'
    },
    // ... שאר הדיברות
  ];
  
  const outputPath = path.join(__dirname, '../../tests/fixtures/data/commandments.json');
  fs.writeFileSync(outputPath, JSON.stringify(commandments, null, 2));
  
  console.log('✅ Test data generated successfully!');
}

module.exports = { generateTestData };
```

### ניקוי קבצים
```bash
#!/bin/bash
# scripts/utils/cleanup.sh

echo "🧹 Cleaning up project files..."

# Remove build artifacts
rm -rf build/
rm -rf dist/
rm -rf out/

# Remove test coverage
rm -rf coverage/
rm -rf .nyc_output/

# Remove node modules
rm -rf node_modules/

# Remove Python cache
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type f -name "*.pyc" -delete

# Remove temporary files
find . -name "*.tmp" -delete
find . -name "*.temp" -delete

echo "✅ Cleanup completed!"
```

## 📚 משאבים נוספים

- [Node.js Child Process](https://nodejs.org/api/child_process.html)
- [Python Subprocess](https://docs.python.org/3/library/subprocess.html)
- [Shell Scripting Guide](https://www.shellscript.sh/)

---

> "וְהָיָה כִּי יִקְרָא אֶתְכֶם מֹשֶׁה, וְנִגַּשׁ אֲלֵיכֶם כָּל אֲשֶׁר נְדָבוֹ רוּחוֹ" — שמות ל״ה:כ״א
> 
> *כלים טובים עוזרים לכל אחד לתרום לפרויקט.*
