# TenLight - בדיקות

זהו מדריך לבדיקות בפרויקט TenLight.

## 🧪 סוגי בדיקות

### בדיקות יחידה (Unit Tests)
- בדיקת פונקציות בודדות
- בדיקת רכיבים נפרדים
- בדיקת לוגיקה עסקית

### בדיקות אינטגרציה (Integration Tests)
- בדיקת אינטגרציה בין רכיבים
- בדיקת API endpoints
- בדיקת מסדי נתונים

### בדיקות E2E (End-to-End Tests)
- בדיקת זרימות משתמש מלאות
- בדיקת ממשק משתמש
- בדיקת תכונות מלאות

## 🛠️ כלי בדיקה

### JavaScript/TypeScript
- **Jest** - מסגרת בדיקות ראשית
- **React Testing Library** - בדיקת רכיבי React
- **Cypress** - בדיקות E2E

### Python
- **Pytest** - מסגרת בדיקות ראשית
- **unittest** - בדיקות מובנות
- **coverage** - מדידת כיסוי

## 📁 מבנה בדיקות

```
tests/
├── unit/                    # בדיקות יחידה
│   ├── components/         # בדיקות רכיבים
│   ├── utils/              # בדיקות פונקציות עזר
│   └── data/               # בדיקות נתונים
├── integration/            # בדיקות אינטגרציה
│   ├── api/                # בדיקות API
│   ├── database/           # בדיקות מסד נתונים
│   └── services/           # בדיקות שירותים
├── e2e/                    # בדיקות E2E
│   ├── user-flows/         # זרימות משתמש
│   ├── features/           # תכונות מלאות
│   └── accessibility/      # בדיקות נגישות
└── fixtures/               # נתוני בדיקה
    ├── data/               # נתונים לדוגמה
    ├── images/             # תמונות לבדיקה
    └── mocks/               # מוקים וסטאבים
```

## 🚀 הרצת בדיקות

### בדיקות יחידה
```bash
# JavaScript/TypeScript
npm test
npm run test:watch
npm run test:coverage

# Python
pytest
pytest --cov=src
pytest -v
```

### בדיקות אינטגרציה
```bash
# JavaScript/TypeScript
npm run test:integration

# Python
pytest tests/integration/
```

### בדיקות E2E
```bash
# Cypress
npm run test:e2e
npm run test:e2e:headless
```

## 📊 כיסוי קוד

### JavaScript/TypeScript
```bash
npm run test:coverage
```

### Python
```bash
pytest --cov=src --cov-report=html
```

## 🔧 הגדרת בדיקות

### Jest Configuration
```javascript
// jest.config.js
module.exports = {
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/tests/setup.ts'],
  testMatch: ['**/__tests__/**/*.test.{js,ts,tsx}'],
  collectCoverageFrom: [
    'src/**/*.{js,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/**/*.stories.{js,ts,tsx}'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    }
  }
};
```

### Pytest Configuration
```python
# pytest.ini
[tool:pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts = 
    --cov=src
    --cov-report=html
    --cov-report=term-missing
    --cov-fail-under=80
```

## 📝 כתיבת בדיקות

### בדיקות יחידה - JavaScript
```javascript
// tests/unit/utils/commandments.test.js
import { getCommandmentByNumber } from '../../../src/utils/commandments';

describe('getCommandmentByNumber', () => {
  test('should return correct commandment for valid number', () => {
    const result = getCommandmentByNumber(1);
    expect(result.number).toBe(1);
    expect(result.text).toContain('אָנֹכִי ה׳ אֱלֹקֶיךָ');
  });

  test('should throw error for invalid number', () => {
    expect(() => getCommandmentByNumber(11)).toThrow('Invalid commandment number');
  });
});
```

### בדיקות יחידה - Python
```python
# tests/unit/test_commandments.py
import pytest
from src.utils.commandments import get_commandment_by_number

def test_get_commandment_by_number_valid():
    result = get_commandment_by_number(1)
    assert result['number'] == 1
    assert 'אָנֹכִי ה׳ אֱלֹקֶיךָ' in result['text']

def test_get_commandment_by_number_invalid():
    with pytest.raises(ValueError, match='Invalid commandment number'):
        get_commandment_by_number(11)
```

### בדיקות אינטגרציה
```javascript
// tests/integration/api/commandments.test.js
import request from 'supertest';
import app from '../../../src/app';

describe('Commandments API', () => {
  test('GET /api/commandments should return all commandments', async () => {
    const response = await request(app)
      .get('/api/commandments')
      .expect(200);

    expect(response.body).toHaveLength(10);
    expect(response.body[0]).toHaveProperty('number');
    expect(response.body[0]).toHaveProperty('text');
  });
});
```

### בדיקות E2E
```javascript
// tests/e2e/commandments.spec.js
describe('Commandments Page', () => {
  beforeEach(() => {
    cy.visit('/commandments');
  });

  it('should display all ten commandments', () => {
    cy.get('[data-testid="commandment"]').should('have.length', 10);
  });

  it('should allow user to click on commandment for details', () => {
    cy.get('[data-testid="commandment"]').first().click();
    cy.get('[data-testid="commandment-details"]').should('be.visible');
  });
});
```

## 🎯 עקרונות בדיקות

### AAA Pattern
- **Arrange** - הכנת הנתונים והמצב
- **Act** - ביצוע הפעולה הנבדקת
- **Assert** - בדיקת התוצאות

### בדיקות טובות
- **ברורות** - קל להבין מה נבדק
- **מבודדות** - לא תלויות בבדיקות אחרות
- **מהירות** - רצות מהר
- **אמינות** - נותנות תוצאות עקביות

### בדיקות רעות
- בדיקות שתלויות בסדר הרצה
- בדיקות שתלויות בזמן
- בדיקות שתלויות במצב חיצוני
- בדיקות מורכבות מדי

## 📈 מדדי איכות

### כיסוי קוד
- **80%+** - כיסוי מינימלי
- **90%+** - כיסוי טוב
- **95%+** - כיסוי מעולה

### מהירות בדיקות
- בדיקות יחידה: < 1ms
- בדיקות אינטגרציה: < 100ms
- בדיקות E2E: < 5s

## 🔍 דיבוג בדיקות

### JavaScript/TypeScript
```bash
# דיבוג עם Node.js
node --inspect-brk node_modules/.bin/jest --runInBand

# דיבוג עם VS Code
# הוסף breakpoint ופתח debugger
```

### Python
```bash
# דיבוג עם pdb
pytest --pdb

# דיבוג עם VS Code
# הוסף breakpoint ופתח debugger
```

## 📚 משאבים נוספים

- [Jest Documentation](https://jestjs.io/docs/getting-started)
- [Pytest Documentation](https://docs.pytest.org/)
- [Cypress Documentation](https://docs.cypress.io/)
- [Testing Library Documentation](https://testing-library.com/)

---

> "לֹא תַעֲנֶה בְרֵעֲךָ עֵד שָׁקֶר" — שמות כ׳:ט״ז
> 
> *בדיקות טובות הן עדות לאמת ולאמינות.*
