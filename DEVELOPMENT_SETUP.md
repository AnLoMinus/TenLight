# 🛠️ הגדרת סביבת פיתוח - TenLight

מדריך זה יעזור לכם להגדיר את סביבת הפיתוח המקומית לפרויקט TenLight.

## 🎯 מטרת המדריך

מדריך זה מפרט את כל השלבים הנדרשים להגדרת סביבת פיתוח מקומית לפרויקט TenLight.

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

## 🚀 הגדרה מהירה

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

## 🔧 הגדרה מפורטת

### הגדרת Git

```bash
# הגדרת שם משתמש
git config --global user.name "Your Name"

# הגדרת כתובת email
git config --global user.email "your.email@example.com"

# הגדרת עורך ברירת מחדל
git config --global core.editor "nano"

# הגדרת branch ברירת מחדל
git config --global init.defaultBranch main
```

### הגדרת Node.js

```bash
# התקנת Node.js (macOS עם Homebrew)
brew install node

# התקנת Node.js (Ubuntu/Debian)
sudo apt update
sudo apt install nodejs npm

# התקנת Node.js (Windows עם Chocolatey)
choco install nodejs

# בדיקת התקנה
node --version
npm --version
```

### הגדרת Python

```bash
# התקנת Python (macOS עם Homebrew)
brew install python

# התקנת Python (Ubuntu/Debian)
sudo apt update
sudo apt install python3 python3-pip

# התקנת Python (Windows עם Chocolatey)
choco install python

# בדיקת התקנה
python --version
pip --version
```

### הגדרת סביבת פיתוח

```bash
# יצירת סביבת פיתוח וירטואלית
python -m venv venv

# הפעלת סביבת פיתוח
source venv/bin/activate  # Linux/macOS
# או
venv\Scripts\activate     # Windows

# התקנת תלויות בסביבה וירטואלית
pip install -r requirements.txt
```

## 🧪 בדיקת ההתקנה

### בדיקת Git

```bash
# בדיקת הגדרות Git
git config --list

# בדיקת חיבור ל-GitHub
ssh -T git@github.com
```

### בדיקת Node.js

```bash
# בדיקת Node.js
node --version

# בדיקת npm
npm --version

# בדיקת התקנת חבילות
npm list
```

### בדיקת Python

```bash
# בדיקת Python
python --version

# בדיקת pip
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
- **Git**: [git-scm.com](https://git-scm.com/doc)
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

*פיתוח הוא זכות וחובה של כל אדם.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
