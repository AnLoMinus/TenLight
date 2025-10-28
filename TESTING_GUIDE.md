# 🧪 מדריך בדיקות - TenLight

מדריך זה מפרט את כל השלבים הנדרשים לבדיקת הפרויקט TenLight.

## 🎯 מטרת המדריך

מדריך זה מפרט את כל השלבים הנדרשים לבדיקת הפרויקט TenLight.

## 📋 סוגי בדיקות

### בדיקות יחידה (Unit Tests)
- **בדיקות יחידה** - בדיקות יחידה של קוד
- **בדיקות יחידה** - בדיקות יחידה של פונקציות
- **בדיקות יחידה** - בדיקות יחידה של מחלקות
- **בדיקות יחידה** - בדיקות יחידה של מודולים

### בדיקות אינטגרציה (Integration Tests)
- **בדיקות אינטגרציה** - בדיקות אינטגרציה של קוד
- **בדיקות אינטגרציה** - בדיקות אינטגרציה של פונקציות
- **בדיקות אינטגרציה** - בדיקות אינטגרציה של מחלקות
- **בדיקות אינטגרציה** - בדיקות אינטגרציה של מודולים

### בדיקות קצה לקצה (E2E Tests)
- **בדיקות קצה לקצה** - בדיקות קצה לקצה של קוד
- **בדיקות קצה לקצה** - בדיקות קצה לקצה של פונקציות
- **בדיקות קצה לקצה** - בדיקות קצה לקצה של מחלקות
- **בדיקות קצה לקצה** - בדיקות קצה לקצה של מודולים

## 🚀 הפעלת בדיקות

### הפעלת בדיקות יחידה

```bash
# הפעלת בדיקות יחידה עם Jest
npm test

# הפעלת בדיקות יחידה עם Mocha
npm run test:unit

# הפעלת בדיקות יחידה עם Jasmine
npm run test:jasmine
```

### הפעלת בדיקות אינטגרציה

```bash
# הפעלת בדיקות אינטגרציה
npm run test:integration

# הפעלת בדיקות אינטגרציה עם Supertest
npm run test:supertest

# הפעלת בדיקות אינטגרציה עם Chai
npm run test:chai
```

### הפעלת בדיקות קצה לקצה

```bash
# הפעלת בדיקות קצה לקצה עם Cypress
npm run test:e2e

# הפעלת בדיקות קצה לקצה עם Playwright
npm run test:playwright

# הפעלת בדיקות קצה לקצה עם Selenium
npm run test:selenium
```

## 🔧 הגדרת בדיקות

### הגדרת Jest

```javascript
// jest.config.js
module.exports = {
  testEnvironment: 'node',
  testMatch: ['**/__tests__/**/*.js', '**/?(*.)+(spec|test).js'],
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['text', 'lcov', 'html']
};
```

### הגדרת Mocha

```javascript
// .mocharc.js
module.exports = {
  timeout: 5000,
  reporter: 'spec',
  require: ['chai/register-expect'],
  recursive: true
};
```

### הגדרת Cypress

```javascript
// cypress.config.js
module.exports = {
  e2e: {
    baseUrl: 'http://localhost:3000',
    supportFile: 'cypress/support/e2e.js',
    specPattern: 'cypress/e2e/**/*.cy.js'
  }
};
```

## 📊 דוחות כיסוי

### דוח כיסוי Jest

```bash
# יצירת דוח כיסוי
npm run test:coverage

# הצגת דוח כיסוי
open coverage/lcov-report/index.html
```

### דוח כיסוי Mocha

```bash
# יצירת דוח כיסוי
npm run test:coverage:mocha

# הצגת דוח כיסוי
open coverage/mocha/index.html
```

### דוח כיסוי Cypress

```bash
# יצירת דוח כיסוי
npm run test:coverage:cypress

# הצגת דוח כיסוי
open coverage/cypress/index.html
```

## 🐛 דיבוג

### דיבוג עם Node.js

```bash
# הפעלת דיבוג
node --inspect src/main.js

# הפעלת דיבוג עם Chrome
node --inspect-brk src/main.js
```

### דיבוג עם VS Code

```json
// .vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug TenLight",
      "type": "node",
      "request": "launch",
      "program": "${workspaceFolder}/src/main.js",
      "console": "integratedTerminal"
    }
  ]
}
```

### דיבוג עם Chrome DevTools

```bash
# הפעלת דיבוג
node --inspect src/main.js

# פתיחת Chrome DevTools
chrome://inspect
```

## 📚 משאבים נוספים

### תיעוד
- **Jest**: [jestjs.io/docs](https://jestjs.io/docs)
- **Mocha**: [mochajs.org](https://mochajs.org)
- **Cypress**: [docs.cypress.io](https://docs.cypress.io)
- **Playwright**: [playwright.dev](https://playwright.dev)

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

*בדיקות הן זכות וחובה של כל מפתח.*

---

**עדכון אחרון**: 29 באוקטובר 2025  
**גרסה**: 1.0.0  
**מחבר**: צוות TenLight
