# TenLight - נכסים (Assets)

זהו מדריך לנכסים בפרויקט TenLight.

## 📁 מבנה הנכסים

```
assets/
├── images/                   # תמונות
│   ├── logos/               # לוגואים
│   ├── icons/               # אייקונים
│   ├── illustrations/       # איורים
│   └── photos/              # תמונות
├── fonts/                   # גופנים
│   ├── hebrew/              # גופנים עבריים
│   ├── english/             # גופנים אנגליים
│   └── arabic/              # גופנים ערביים
├── audio/                   # קבצי אודיו
│   ├── music/               # מוזיקה
│   ├── sounds/              # צלילים
│   └── recordings/          # הקלטות
├── video/                   # קבצי וידאו
│   ├── tutorials/           # הדרכות
│   ├── presentations/       # מצגות
│   └── documentaries/       # תיעוד
├── data/                    # נתונים
│   ├── json/                # קבצי JSON
│   ├── csv/                 # קבצי CSV
│   └── xml/                 # קבצי XML
└── documents/               # מסמכים
    ├── pdfs/                # קבצי PDF
    ├── presentations/       # מצגות
    └── reports/             # דוחות
```

## 🎨 הנחיות עיצוב

### לוגואים
- **פורמט**: SVG (מועדף), PNG, ICO
- **רזולוציה**: 512x512px (מינימום)
- **רקע**: שקוף או לבן
- **צבעים**: כחול (#0066CC), זהב (#FFD700), לבן (#FFFFFF)

### אייקונים
- **פורמט**: SVG (מועדף), PNG
- **גודל**: 24x24px, 32x32px, 48x48px
- **סגנון**: מינימליסטי, עקבי
- **צבעים**: כחול (#0066CC), אפור (#666666)

### תמונות
- **פורמט**: WebP (מועדף), JPEG, PNG
- **רזולוציה**: 1920x1080px (מינימום)
- **איכות**: 85% (JPEG), אובדן ללא אובדן (PNG)
- **גודל קובץ**: < 500KB

### גופנים
- **עברית**: Noto Sans Hebrew, Heebo, Assistant
- **אנגלית**: Inter, Roboto, Open Sans
- **ערבית**: Noto Sans Arabic, Cairo, Amiri
- **פורמט**: WOFF2 (מועדף), WOFF, TTF

## 📊 אופטימיזציה

### תמונות
```bash
# אופטימיזציה עם ImageMagick
magick input.jpg -quality 85 -resize 1920x1080 output.jpg

# אופטימיזציה עם Sharp (Node.js)
const sharp = require('sharp');
sharp('input.jpg')
  .resize(1920, 1080)
  .jpeg({ quality: 85 })
  .toFile('output.jpg');
```

### אייקונים
```bash
# אופטימיזציה עם SVGO
svgo input.svg output.svg

# יצירת אייקונים מרובים
npm run generate-icons
```

### גופנים
```bash
# אופטימיזציה עם fonttools
pyftsubset font.ttf --text-file=charset.txt --output-file=font-subset.ttf

# יצירת גופנים מותאמים
npm run generate-fonts
```

## 🛠️ כלי עזר

### יצירת אייקונים
```javascript
// scripts/generate-icons.js
const fs = require('fs');
const path = require('path');

function generateIcons() {
  const sizes = [16, 24, 32, 48, 64, 128, 256, 512];
  const inputSvg = 'assets/images/logos/tenlight-logo.svg';
  
  sizes.forEach(size => {
    // יצירת PNG מכל גודל
    const outputPath = `assets/images/icons/tenlight-${size}x${size}.png`;
    // כאן תוסיף לוגיקה ליצירת PNG
  });
  
  console.log('✅ Icons generated successfully!');
}

module.exports = { generateIcons };
```

### יצירת גופנים
```python
# scripts/generate-fonts.py
import subprocess
import os

def generate_fonts():
    """Generate optimized font files."""
    fonts_dir = 'assets/fonts/'
    
    # יצירת גופנים מותאמים
    for font_file in os.listdir(fonts_dir):
        if font_file.endswith('.ttf'):
            # יצירת WOFF2
            subprocess.run([
                'pyftsubset', 
                os.path.join(fonts_dir, font_file),
                '--output-file', os.path.join(fonts_dir, font_file.replace('.ttf', '.woff2')),
                '--flavor', 'woff2'
            ])
    
    print("✅ Fonts generated successfully!")

if __name__ == '__main__':
    generate_fonts()
```

### יצירת תמונות
```bash
#!/bin/bash
# scripts/generate-images.sh

echo "🖼️ Generating optimized images..."

# יצירת WebP מכל JPEG
for file in assets/images/**/*.jpg; do
    if [ -f "$file" ]; then
        webp_file="${file%.jpg}.webp"
        cwebp -q 85 "$file" -o "$webp_file"
    fi
done

# יצירת תמונות מותאמות
for file in assets/images/**/*.jpg; do
    if [ -f "$file" ]; then
        # יצירת תמונות קטנות
        convert "$file" -resize 480x320 "assets/images/thumbnails/$(basename "$file")"
        # יצירת תמונות בינוניות
        convert "$file" -resize 800x600 "assets/images/medium/$(basename "$file")"
        # יצירת תמונות גדולות
        convert "$file" -resize 1920x1080 "assets/images/large/$(basename "$file")"
    fi
done

echo "✅ Images generated successfully!"
```

## 📱 תמיכה במכשירים

### רזולוציות נתמכות
- **Mobile**: 320x568px, 375x667px, 414x896px
- **Tablet**: 768x1024px, 1024x768px
- **Desktop**: 1920x1080px, 2560x1440px, 3840x2160px

### פורמטים נתמכים
- **תמונות**: WebP, JPEG, PNG, SVG
- **אודיו**: MP3, AAC, OGG, WAV
- **וידאו**: MP4, WebM, OGV
- **גופנים**: WOFF2, WOFF, TTF, OTF

## 🔍 בדיקת איכות

### תמונות
```bash
# בדיקת איכות תמונות
npm run check-images

# בדיקת גודל קבצים
npm run check-file-sizes

# בדיקת פורמטים
npm run check-formats
```

### גופנים
```bash
# בדיקת גופנים
npm run check-fonts

# בדיקת תמיכה בשפות
npm run check-language-support
```

### אודיו/וידאו
```bash
# בדיקת איכות אודיו
npm run check-audio

# בדיקת איכות וידאו
npm run check-video
```

## 📚 משאבים נוספים

- [ImageMagick](https://imagemagick.org/)
- [Sharp](https://sharp.pixelplumbing.com/)
- [SVGO](https://github.com/svg/svgo)
- [FontTools](https://github.com/fonttools/fonttools)
- [WebP](https://developers.google.com/speed/webp)

---

> "וְהָיָה כִּי יִקְרָא אֶתְכֶם מֹשֶׁה, וְנִגַּשׁ אֲלֵיכֶם כָּל אֲשֶׁר נְדָבוֹ רוּחוֹ" — שמות ל״ה:כ״א
> 
> *נכסים טובים עוזרים להעביר את המסר בצורה ברורה ויפה.*
