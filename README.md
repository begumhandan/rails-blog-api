# Blog API Projesi

Ruby on Rails ile geliştirilmiş RESTful Blog API'si

## 📋 Proje Hakkında

Bu proje Ruby on Rails kullanılarak geliştirilmiş bir blog API'sidir.
Proje tamamen API modunda çalışmakta olup ön yüz bulunmamaktadır.

## 🎯 Özellikler

- 5 model ile geliştirildi (User, Category, Post, Tag, Comment)
- RESTful API mimarisi
- JSON formatında veri dönüşü
- Model validasyonları
- İlişkisel veritabanı yapısı

## 📦 Modeller

1. **User** - Kullanıcılar
2. **Category** - Kategoriler
3. **Post** - Blog yazıları
4. **Tag** - Etiketler
5. **Comment** - Yorumlar

## 🚀 Kurulum

```bash
# Repoyu klonlayın
git clone https://github.com/begumhandan/rails-blog-api.git
cd rails-blog-api

# Bağımlılıkları yükleyin
bundle install

# Veritabanını oluşturun
rails db:create
rails db:migrate
rails db:seed

# Sunucuyu başlatın
rails server
```

## 🛠️ Teknolojiler

- Ruby 3.x
- Rails 7.x
- SQLite3
- Git & GitHub

## 👤 Geliştirici

[Begüm Handan Demir]

## 📅 Proje Tarihi

22 Ekim 2025
