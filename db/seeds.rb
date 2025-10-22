# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Önceki verileri temizledik
puts "  Eski veriler temizleniyor..."
Comment.destroy_all
Post.destroy_all
Tag.destroy_all
Category.destroy_all
User.destroy_all

# Kullanıcılar oluşturuyoruz
puts " Kullanıcılar oluşturuluyor..."
user1 = User.create!(name: "Ahmet Yılmaz", email: "ahmet@example.com")
user2 = User.create!(name: "Ayşe Demir", email: "ayse@example.com")
user3 = User.create!(name: "Mehmet Kaya", email: "mehmet@example.com")
user4 = User.create!(name: "Fatma Şahin", email: "fatma@example.com")

# Kategoriler oluşturuyoruz
puts " Kategoriler oluşturuluyor..."
tech = Category.create!(name: "Teknoloji", description: "Teknoloji haberleri ve yazıları")
lifestyle = Category.create!(name: "Yaşam", description: "Yaşam tarzı ve kültür içerikleri")
sport = Category.create!(name: "Spor", description: "Spor haberleri ve analizler")
education = Category.create!(name: "Eğitim", description: "Eğitim ve öğrenme içerikleri")

# Tag'ler oluşturuyoruz
puts "  Etiketler oluşturuluyor..."
ruby_tag = Tag.create!(name: "ruby")
rails_tag = Tag.create!(name: "rails")
api_tag = Tag.create!(name: "api")
web_tag = Tag.create!(name: "web")
backend_tag = Tag.create!(name: "backend")
database_tag = Tag.create!(name: "database")
tutorial_tag = Tag.create!(name: "tutorial")
beginner_tag = Tag.create!(name: "beginner")

# Gönderiler oluşturuyoruz
puts " Gönderiler oluşturuluyor..."

post1 = Post.create!(
  title: "Ruby on Rails ile API Geliştirme",
  content: "Ruby on Rails, modern web uygulamaları geliştirmek için harika bir framework'tür. API geliştirmek oldukça kolay ve hızlıdır. RESTful yapısı sayesinde standartlara uygun API'ler oluşturabilirsiniz.",
  user: user1,
  category: tech
)
post1.tags << [ ruby_tag, rails_tag, api_tag, backend_tag, tutorial_tag ]

post2 = Post.create!(
  title: "RESTful API Tasarım Prensipleri",
  content: "RESTful API'lar, HTTP protokolünün güçlü yanlarını kullanarak veri alışverişini sağlar. GET, POST, PUT, DELETE metodları standardı oluşturur. Doğru endpoint tasarımı ve status code kullanımı çok önemlidir.",
  user: user2,
  category: tech
)
post2.tags << [ api_tag, web_tag, backend_tag ]

post3 = Post.create!(
  title: "Database İlişkileri ve ActiveRecord",
  content: "Veritabanı ilişkileri, has_many, belongs_to, has_and_belongs_to_many gibi ActiveRecord metodlarıyla kolayca yönetilir. Bu ilişkiler sayesinde karmaşık sorguları basit şekilde yapabilirsiniz.",
  user: user1,
  category: tech
)
post3.tags << [ ruby_tag, rails_tag, database_tag, tutorial_tag ]

post4 = Post.create!(
  title: "Yeni Başlayanlar İçin Ruby",
  content: "Ruby, öğrenmesi kolay ve eğlenceli bir programlama dilidir. Okunabilir sözdizimi ve güçlü kütüphaneleri ile hızlı geliştirme yapmanızı sağlar. Web development için mükemmel bir seçimdir.",
  user: user3,
  category: education
)
post4.tags << [ ruby_tag, beginner_tag, tutorial_tag ]

post5 = Post.create!(
  title: "Sağlıklı Yaşam İçin 10 Öneri",
  content: "Sağlıklı bir yaşam için düzenli egzersiz, dengeli beslenme ve yeterli uyku çok önemlidir. Günlük en az 30 dakika hareket etmek, bol su içmek ve stresten uzak durmak temel prensiplerdir.",
  user: user4,
  category: lifestyle
)

post6 = Post.create!(
  title: "Futbol Dünyasından Haberler",
  content: "Bu hafta futbol dünyasında heyecan verici maçlar ve transferler yaşandı. Büyük kulüpler yeni sezon hazırlıklarını sürdürüyor. Genç yetenekler dikkat çekiyor.",
  user: user2,
  category: sport
)

post7 = Post.create!(
  title: "Rails 7 Yenilikleri",
  content: "Rails 7 ile gelen Hotwire, Turbo ve Stimulus özellikleri modern web uygulamaları geliştirmeyi çok daha kolay hale getiriyor. Import maps sayesinde JavaScript paket yönetimi basitleşti.",
  user: user1,
  category: tech
)
post7.tags << [ rails_tag, web_tag, tutorial_tag ]

post8 = Post.create!(
  title: "Online Eğitim Platformları",
  content: "Online eğitim platformları, her yerden öğrenme fırsatı sunuyor. Udemy, Coursera, Pluralsight gibi platformlarda binlerce kurs bulunuyor. Kendi hızınızda öğrenebilirsiniz.",
  user: user3,
  category: education
)

post9 = Post.create!(
  title: "API Güvenliği Best Practices",
  content: "API güvenliği için JWT token kullanımı, rate limiting, CORS ayarları ve input validation çok önemlidir. HTTPS kullanımı zorunludur. API key'leri asla kod içinde saklamayın.",
  user: user2,
  category: tech
)
post9.tags << [ api_tag, backend_tag, web_tag ]

post10 = Post.create!(
  title: "Yoga ve Meditasyon",
  content: "Yoga ve meditasyon, zihinsel ve fiziksel sağlık için harika alıştırmalardır. Günde 10-15 dakika meditasyon bile stresi azaltır ve odaklanmayı artırır.",
  user: user4,
  category: lifestyle
)

# Yorumları oluşturuyoruz
puts " Yorumlar oluşturuluyor..."

Comment.create!(content: "Harika bir yazı, çok faydalı oldu! Rails gerçekten güçlü.", post: post1, user: user2)
Comment.create!(content: "Rails API geliştirmek için en iyi seçim", post: post1, user: user3)
Comment.create!(content: "ActiveRecord çok kullanışlı, örnekler için teşekkürler", post: post1, user: user4)

Comment.create!(content: "RESTful standartları çok önemli, güzel açıklamışsınız", post: post2, user: user1)
Comment.create!(content: "Status code kullanımı konusunda detay verebilir misiniz?", post: post2, user: user3)

Comment.create!(content: "belongs_to ve has_many farkını çok iyi anladım", post: post3, user: user2)
Comment.create!(content: "Polymorphic ilişkileri de anlatır mısınız?", post: post3, user: user4)

Comment.create!(content: "Yeni başlayanlar için mükemmel kaynak!", post: post4, user: user1)
Comment.create!(content: "Ruby öğrenmeye başladım, çok yardımcı oldu", post: post4, user: user2)

Comment.create!(content: "Çok faydalı öneriler, uygulayacağım", post: post5, user: user1)
Comment.create!(content: "Egzersiz programı paylaşır mısınız?", post: post5, user: user3)

Comment.create!(content: "Hangi takımı tutuyorsunuz?", post: post6, user: user1)
Comment.create!(content: "Şampiyonlar Ligi'nde favoriniz kim?", post: post6, user: user4)

Comment.create!(content: "Hotwire kullandınız mı? Deneyimlerinizi paylaşır mısınız?", post: post7, user: user3)
Comment.create!(content: "Turbo çok hızlı, gerçekten etkileyici", post: post7, user: user2)

Comment.create!(content: "Hangi platformu önerirsiniz?", post: post8, user: user1)
Comment.create!(content: "Udemy'de çok iyi kurslar var", post: post8, user: user4)

Comment.create!(content: "JWT implementasyonu için örnek var mı?", post: post9, user: user1)
Comment.create!(content: "Rate limiting nasıl yapılır?", post: post9, user: user3)
Comment.create!(content: "CORS ayarları için Rack CORS kullanabilirsiniz", post: post9, user: user4)

Comment.create!(content: "Yoga ile ilgili kaynak önerir misiniz?", post: post10, user: user2)

puts "\n Test verileri başarıyla oluşturuldu!"
puts "=" * 50
puts " İSTATİSTİKLER"
puts "=" * 50
puts " Kullanıcılar: #{User.count}"
puts " Kategoriler: #{Category.count}"
puts " Gönderiler: #{Post.count}"
puts " Yorumlar: #{Comment.count}"
puts "  Etiketler: #{Tag.count}"
puts "=" * 50
