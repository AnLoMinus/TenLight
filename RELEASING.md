# 🚀 מדריך שחרור גרסאות - TenLight

זהו מדריך מפורט לתהליך שחרור גרסאות חדשות של פרויקט TenLight.

## 📋 תהליך שחרור

### 1. הכנה לשחרור
- [ ] בדיקת כל הבדיקות עוברת
- [ ] עדכון CHANGELOG.md
- [ ] עדכון VERSION
- [ ] עדכון תיעוד
- [ ] בדיקת אבטחה

### 2. יצירת גרסה
- [ ] יצירת tag חדש
- [ ] יצירת Release ב-GitHub
- [ ] העלאת חבילות
- [ ] עדכון אתר

### 3. פרסום
- [ ] הודעה לקהילה
- [ ] עדכון מדיה חברתית
- [ ] שליחת Newsletter
- [ ] עדכון תיעוד

## 🏷️ מדיניות גרסאות

### Semantic Versioning
הפרויקט עוקב אחר [Semantic Versioning](https://semver.org/lang/he/):

- **MAJOR** (1.0.0) - שינויים לא תואמים
- **MINOR** (0.1.0) - תכונות חדשות תואמות
- **PATCH** (0.0.1) - תיקוני באגים תואמים

### דוגמאות
- `1.0.0` - גרסה ראשונה יציבה
- `1.1.0` - תכונה חדשה
- `1.1.1` - תיקון באג
- `2.0.0` - שינוי גדול לא תואם

## 🔄 תהליך מפורט

### שלב 1: הכנה
```bash
# עדכון גרסה
echo "1.1.0" > VERSION

# עדכון CHANGELOG
# הוספת רשימת שינויים

# עדכון תיעוד
# עדכון README אם נדרש
```

### שלב 2: בדיקות
```bash
# הרצת בדיקות
make test

# בדיקת איכות
make lint

# בדיקת אבטחה
make security-scan

# בדיקת ביצועים
make perf-test
```

### שלב 3: בנייה
```bash
# בנייה לייצור
make build-prod

# בדיקת בנייה
make test

# יצירת חבילות
make package
```

### שלב 4: שחרור
```bash
# יצירת tag
git tag -a v1.1.0 -m "Release version 1.1.0"

# שליחה ל-GitHub
git push origin v1.1.0

# יצירת Release
gh release create v1.1.0 --title "Release 1.1.0" --notes "Release notes"
```

### שלב 5: דיפלוי
```bash
# דיפלוי לייצור
make deploy-prod

# בדיקת דיפלוי
make test-prod

# עדכון אתר
make update-website
```

## 📝 תבנית CHANGELOG

### פורמט
```markdown
## [1.1.0] - 2025-11-15

### נוסף
- תכונה חדשה 1
- תכונה חדשה 2

### שונה
- שינוי 1
- שינוי 2

### תוקן
- תיקון 1
- תיקון 2

### הוסר
- הסרה 1
- הסרה 2
```

### קטגוריות
- **נוסף** - תכונות חדשות
- **שונה** - שינויים בתכונות קיימות
- **הודגש** - שינויים שיוצגו בהדגשה
- **תוקן** - תיקוני באגים
- **הוסר** - תכונות שהוסרו
- **אבטחה** - שינויים הקשורים לאבטחה

## 🏷️ יצירת Tags

### פקודות Git
```bash
# יצירת tag
git tag -a v1.1.0 -m "Release version 1.1.0"

# שליחה ל-GitHub
git push origin v1.1.0

# מחיקת tag (אם נדרש)
git tag -d v1.1.0
git push origin :refs/tags/v1.1.0
```

### GitHub CLI
```bash
# יצירת Release
gh release create v1.1.0 \
  --title "Release 1.1.0" \
  --notes "Release notes" \
  --draft

# פרסום Release
gh release edit v1.1.0 --draft=false
```

## 📦 יצירת חבילות

### Node.js
```bash
# יצירת חבילת npm
npm pack

# פרסום ל-npm
npm publish
```

### Python
```bash
# יצירת חבילת Python
python -m build

# פרסום ל-PyPI
python -m twine upload dist/*
```

### Docker
```bash
# יצירת Docker image
docker build -t tenlight:1.1.0 .

# העלאה ל-Docker Hub
docker push tenlight:1.1.0
```

## 🌐 עדכון אתר

### GitHub Pages
```bash
# בנייה לאתר
make build-website

# דיפלוי ל-GitHub Pages
make deploy-website
```

### אתר עצמאי
```bash
# בנייה לאתר
make build-website

# העלאה לשרת
make upload-website
```

## 📢 פרסום

### הודעות לקהילה
- **GitHub** - Release notes
- **Discord** - הודעה בקהילה
- **Twitter** - ציוץ על הגרסה
- **Newsletter** - שליחת עדכון

### תוכן הודעה
```markdown
🎉 TenLight v1.1.0 שוחרר!

תכונות חדשות:
- תכונה 1
- תכונה 2

תיקונים:
- תיקון 1
- תיקון 2

הורדה: https://github.com/tenlight/tenlight/releases/tag/v1.1.0
```

## 🔄 אוטומציה

### GitHub Actions
```yaml
# .github/workflows/release.yml
name: Release
on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Create Release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: ${{ github.ref_name }}
          release_name: Release ${{ github.ref_name }}
          body: |
            ## Changes
            - See CHANGELOG.md for details
          draft: false
          prerelease: false
```

### סקריפטים
```bash
#!/bin/bash
# scripts/release.sh

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# עדכון גרסה
echo "$VERSION" > VERSION

# עדכון CHANGELOG
# ... לוגיקה לעדכון CHANGELOG ...

# יצירת tag
git tag -a "v$VERSION" -m "Release version $VERSION"

# שליחה ל-GitHub
git push origin "v$VERSION"

# יצירת Release
gh release create "v$VERSION" \
  --title "Release $VERSION" \
  --notes "Release notes for $VERSION"

echo "Release $VERSION created successfully!"
```

## 🚨 טיפול בבעיות

### בעיות נפוצות
- **Tag כבר קיים** - מחיקת tag קיים
- **בנייה נכשלת** - בדיקת תלויות
- **דיפלוי נכשל** - בדיקת הגדרות
- **Release לא נוצר** - בדיקת הרשאות

### פתרונות
```bash
# מחיקת tag
git tag -d v1.1.0
git push origin :refs/tags/v1.1.0

# בדיקת תלויות
npm audit
pip check

# בדיקת הגדרות
make config-check

# בדיקת הרשאות
gh auth status
```

## 📊 מדדי הצלחה

### מדדים טכניים
- **זמן בנייה** - < 10 דקות
- **זמן דיפלוי** - < 5 דקות
- **זמן בדיקות** - < 5 דקות
- **זמן שחרור** - < 30 דקות

### מדדים קהילתיים
- **הורדות** - מספר הורדות
- **כוכבים** - מספר כוכבים ב-GitHub
- **תורמים** - מספר תורמים חדשים
- **Issues** - מספר Issues חדשים

## 🔄 תדירות שחרור

### גרסאות Major
- **תדירות**: שנתית
- **תכונות**: שינויים גדולים
- **תאימות**: לא תואמת

### גרסאות Minor
- **תדירות**: חודשית
- **תכונות**: תכונות חדשות
- **תאימות**: תואמת

### גרסאות Patch
- **תדירות**: שבועית
- **תכונות**: תיקוני באגים
- **תאימות**: תואמת

## 📚 משאבים נוספים

### כלים מומלצים
- [Semantic Versioning](https://semver.org/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Keep a Changelog](https://keepachangelog.com/)
- [GitHub CLI](https://cli.github.com/)

### מדריכים
- [GitHub Releases](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [npm Publishing](https://docs.npmjs.com/packages-and-modules/contributing-packages-to-the-registry)
- [Docker Publishing](https://docs.docker.com/docker-hub/publish/)

---

## 🙏 תודה

תודה לכל התורמים שמביאים את הפרויקט הזה לחיים.

> "וְהָיָה כִּי יִקְרָא אֶתְכֶם מֹשֶׁה, וְנִגַּשׁ אֲלֵיכֶם כָּל אֲשֶׁר נְדָבוֹ רוּחוֹ" — שמות ל״ה:כ״א

*כל שחרור מביא אור חדש לעולם.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
