# Durakla - Toplu Taşıma Uygulaması 🚌

Modern ve kullanıcı dostu bir toplu taşıma takip uygulaması. Kullanıcıların durakları, hatları ve otobüsleri gerçek zamanlı olarak takip etmelerini sağlar.

## 🎯 Özellikler

- 🗺️ **Google Maps Entegrasyonu** - İnteraktif harita ile konum seçimi
- 🔍 **Konum Arama** - Hızlı ve kolay konum arama
- ⭐ **Favoriler** - Sık kullanılan konumları kaydetme
- 📍 **Yakındaki Duraklar** - Etrafınızdaki durakları görüntüleme
- 🚍 **Gerçek Zamanlı Bilgi** - Otobüs varış sürelerini takip etme
- 🎨 **Modern Dark Theme** - Göz yormayan koyu tema tasarımı
- 📱 **Responsive Tasarım** - Tüm ekran boyutlarında sorunsuz çalışma

## 🛠️ Teknolojiler

- **Flutter** - Cross-platform uygulama geliştirme
- **Google Maps Flutter** - Harita entegrasyonu
- **Material Design 3** - Modern UI/UX tasarımı
- **Dart** - Programlama dili

## 📋 Gereksinimler

- Flutter SDK 3.38.9 veya üzeri
- Dart SDK 3.10.8 veya üzeri
- Android Studio / VS Code
- Google Maps API Key (Android & iOS için)

## 🚀 Kurulum

1. **Projeyi klonlayın**
```bash
git clone https://github.com/KULLANICI_ADINIZ/durakla_app.git
cd durakla_app
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
```

3. **Google Maps API Key ayarlayın**

### Android için:
`android/app/src/main/AndroidManifest.xml` dosyasına API key'inizi ekleyin:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_API_KEY_HERE"/>
```

### iOS için:
`ios/Runner/AppDelegate.swift` dosyasına API key'inizi ekleyin:
```swift
GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
```

4. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 📱 Ekran Görüntüleri

*(Ekran görüntüleri eklenecek)*

## 🎨 Renk Paleti

- **Background:** `#101622`
- **Primary Blue:** `#256AF4`
- **Orange:** `#F97316`
- **Live Green:** `#22C55E`
- **Card Background:** `#1E293B`

## 📁 Proje Yapısı

```
lib/
├── core/
│   ├── colors.dart          # Renk tanımlamaları
│   ├── theme.dart           # Tema ayarları
│   └── routes.dart          # Route tanımlamaları
├── screens/
│   ├── home_page.dart       # Ana sayfa (harita)
│   ├── splash_screen.dart   # Açılış ekranı
│   ├── onboarding_screen.dart
│   └── ...
├── widgets/                 # Yeniden kullanılabilir widget'lar
├── models/                  # Veri modelleri
└── services/                # API ve servis katmanları
```

## 🔐 Güvenlik

- API anahtarları `.gitignore` dosyasında tanımlanmıştır
- Hassas veriler repository'ye yüklenmez
- Kendi API anahtarlarınızı kullanın

## 🤝 Katkıda Bulunma

1. Bu repository'yi fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje [MIT lisansı](LICENSE) altında lisanslanmıştır.

## 👨‍💻 Geliştirici

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)

## 📞 İletişim

Sorularınız için issue açabilir veya bana ulaşabilirsiniz.

---

⭐ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
