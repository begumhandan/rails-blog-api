📝 Blog API Projesi

Ruby on Rails ile geliştirilmiş RESTful Blog API’si ve React tabanlı yönetim paneli (frontend).

📋 Proje Hakkında

Bu proje Ruby on Rails ile geliştirilen bir RESTful Blog API’si ve React (Vite + TailwindCSS) kullanılarak yapılmış bir frontend arayüzü içermektedir.
Proje hem backend (API) hem de frontend (dashboard) bileşenlerini kapsar.
Ek olarak, Cypress ile uçtan uca (E2E) testler ve Cucumber ile senaryo tabanlı kabul testleri uygulanmıştır.

🎯 Özellikler
🔹 Backend (Ruby on Rails)

5 model: User, Category, Post, Tag, Comment

RESTful API mimarisi

JSON formatında veri dönüşü

Model validasyonları ve ilişki yapısı

API endpoint'leri test edilmiştir

🔹 Frontend (React + TypeScript + TailwindCSS)

Vite yapılandırması

Shadcn/UI bileşenleri

Zod + React Hook Form ile form validasyonu

Dashboard görünümü: kullanıcı yönetimi, kayıt ekleme vb.

Responsive tasarım

🔹 Testler

Cypress: E2E testler (dashboard, form işlemleri)

Cucumber (Gherkin): Davranış odaklı (BDD) senaryolar

Test kayıtları video & screenshot olarak saklanır

📦 Modeller

User – Kullanıcılar

Category – Kategoriler

Post – Blog yazıları

Tag – Etiketler

Comment – Yorumlar

🚀 Kurulum
1️⃣ Backend (Rails API)

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
2️⃣ Frontend (React + Vite)
cd frontend
npm install
npm run dev

Frontend varsayılan olarak http://localhost:5173 adresinde çalışır.

🧪 Test Çalıştırma
Cypress E2E Testleri

# Testleri başlat

npx cypress open

# veya headless modda:

npx cypress run
Cucumber Senaryoları
bundle exec cucumber
🛠️ Teknolojiler
Katman Teknoloji
Backend Ruby 3.x, Rails 7.x, SQLite3
Frontend React 18, TypeScript, TailwindCSS, Shadcn/UI
Test Cypress, Cucumber (Gherkin), Jest
Versiyonlama Git & GitHub
👩‍💻 Geliştirici

Begüm Handan Demir
📧 GitHub Profilim

📅 Proje Tarihi

22 Ekim 2025 – Geliştirme süreci boyunca düzenli olarak genişletilmiştir
