# 📦 מדריך התקנה - TenLight

מדריך זה מפרט את כל השלבים הנדרשים להתקנת הפרויקט TenLight.

## 🎯 מטרת המדריך

מדריך זה מפרט את כל השלבים הנדרשים להתקנת הפרויקט TenLight.

## 📋 דרישות מוקדמות

### דרישות חומרה
- **מעבד**: Intel Core i5 או AMD Ryzen 5 ומעלה
- **זיכרון**: 8GB RAM לפחות
- **אחסון**: 10GB שטח פנוי לפחות
- **רשת**: חיבור אינטרנט יציב

### דרישות תוכנה
- **מערכת הפעלה**: Windows 10/11, macOS 10.15+, או Linux
- **Git**: גרסה 2.30.0 ומעלה
- **Node.js**: גרסה 18.0.0 ומעלה
- **Python**: גרסה 3.8.0 ומעלה
- **npm**: גרסה 8.0.0 ומעלה
- **pip**: גרסה 21.0.0 ומעלה

## 🚀 התקנה מהירה

### 1. שכפול המאגר

```bash
# שכפול המאגר
git clone https://github.com/tenlight/tenlight.git
cd tenlight

# בדיקת גרסת Git
git --version

# בדיקת גרסת Node.js
node --version

# בדיקת גרסת Python
python --version
```

### 2. התקנת תלויות

```bash
# התקנת תלויות Node.js
npm install

# התקנת תלויות Python
pip install -r requirements.txt

# התקנת תלויות נוספות
pip install -r requirements-dev.txt
```

### 3. הגדרת משתני סביבה

```bash
# יצירת קובץ .env
cp .env.example .env

# עריכת קובץ .env
nano .env
```

### 4. הפעלת הפרויקט

```bash
# הפעלת הפרויקט
npm run dev

# או הפעלה עם Python
python src/main.py
```

## 🔧 התקנה מפורטת

### התקנת Git

#### Windows
```bash
# התקנה עם Chocolatey
choco install git

# התקנה עם Scoop
scoop install git

# התקנה עם Winget
winget install Git.Git
```

#### macOS
```bash
# התקנה עם Homebrew
brew install git

# התקנה עם MacPorts
sudo port install git
```

#### Linux
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install git

# CentOS/RHEL
sudo yum install git

# Fedora
sudo dnf install git
```

### התקנת Node.js

#### Windows
```bash
# התקנה עם Chocolatey
choco install nodejs

# התקנה עם Scoop
scoop install nodejs

# התקנה עם Winget
winget install OpenJS.NodeJS
```

#### macOS
```bash
# התקנה עם Homebrew
brew install node

# התקנה עם MacPorts
sudo port install nodejs18
```

#### Linux
```bash
# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# CentOS/RHEL
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Fedora
sudo dnf install nodejs npm
```

### התקנת Python

#### Windows
```bash
# התקנה עם Chocolatey
choco install python

# התקנה עם Scoop
scoop install python

# התקנה עם Winget
winget install Python.Python.3.11
```

#### macOS
```bash
# התקנה עם Homebrew
brew install python

# התקנה עם MacPorts
sudo port install python311
```

#### Linux
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install python3 python3-pip

# CentOS/RHEL
sudo yum install python3 python3-pip

# Fedora
sudo dnf install python3 python3-pip
```

## 🧪 בדיקת ההתקנה

### בדיקת Git

```bash
# בדיקת גרסת Git
git --version

# בדיקת הגדרות Git
git config --list

# בדיקת חיבור ל-GitHub
ssh -T git@github.com
```

### בדיקת Node.js

```bash
# בדיקת גרסת Node.js
node --version

# בדיקת גרסת npm
npm --version

# בדיקת התקנת חבילות
npm list
```

### בדיקת Python

```bash
# בדיקת גרסת Python
python --version

# בדיקת גרסת pip
pip --version

# בדיקת התקנת חבילות
pip list
```

## 🔍 פתרון בעיות נפוצות

### בעיות Git

```bash
# בעיה: Git לא מוגדר
# פתרון: הגדרת Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# בעיה: חיבור ל-GitHub נכשל
# פתרון: בדיקת מפתח SSH
ssh -T git@github.com
```

### בעיות Node.js

```bash
# בעיה: Node.js לא מותקן
# פתרון: התקנת Node.js
brew install node  # macOS
sudo apt install nodejs npm  # Linux

# בעיה: npm לא עובד
# פתרון: עדכון npm
npm install -g npm@latest
```

### בעיות Python

```bash
# בעיה: Python לא מותקן
# פתרון: התקנת Python
brew install python  # macOS
sudo apt install python3 python3-pip  # Linux

# בעיה: pip לא עובד
# פתרון: עדכון pip
python -m pip install --upgrade pip
```

## 📚 משאבים נוספים

### תיעוד
- **Git**: [git-scm.com/doc](https://git-scm.com/doc)
- **Node.js**: [nodejs.org/docs](https://nodejs.org/docs)
- **Python**: [docs.python.org](https://docs.python.org)
- **npm**: [docs.npmjs.com](https://docs.npmjs.com)

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

*התקנה היא זכות וחובה של כל מפתח.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
