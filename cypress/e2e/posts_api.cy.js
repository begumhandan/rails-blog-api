describe('Posts API CRUD Testleri', () => {
  
  let createdPostId;
  let userId;
  let categoryId;

  before(() => {
    // Test için user oluştur
    cy.request('POST', 'http://localhost:3000/api/v1/users', {
      user: { 
        name: 'Cypress Test User', 
        email: `cypress${Date.now()}@test.com` 
      }
    }).then((response) => {
      userId = response.body.id;
    });

    // Test için kategori oluştur
    cy.request('POST', 'http://localhost:3000/api/v1/categories', {
      category: { 
        name: 'Cypress Test Category',
        description: 'Test için kategori'
      }
    }).then((response) => {
      categoryId = response.body.id;
    });
  });

  it('GET /api/v1/posts - Tüm postları listeler', () => {
    cy.request('GET', 'http://localhost:3000/api/v1/posts')
      .then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body).to.be.an('array');
        cy.log('✅ Postlar başarıyla listelendi');
      });
  });

  it('POST /api/v1/posts - Yeni post oluşturur', () => {
    cy.request('POST', 'http://localhost:3000/api/v1/posts', {
      post: {
        title: 'Cypress ile API Testi',
        content: 'Bu post Cypress tarafından oluşturuldu',
        user_id: userId,
        category_id: categoryId,
        tag_ids: []
      }
    }).then((response) => {
      expect(response.status).to.eq(201);
      expect(response.body).to.have.property('id');
      expect(response.body.title).to.eq('Cypress ile API Testi');
      createdPostId = response.body.id;
      cy.log(`✅ Post oluşturuldu - ID: ${createdPostId}`);
    });
  });

  it('GET /api/v1/posts/:id - Tek bir post getirir', () => {
    cy.request('GET', `http://localhost:3000/api/v1/posts/${createdPostId}`)
      .then((response) => {
        expect(response.status).to.eq(200);
        expect(response.body.id).to.eq(createdPostId);
        expect(response.body.title).to.eq('Cypress ile API Testi');
        cy.log('✅ Post detayı başarıyla getirildi');
      });
  });

  it('PATCH /api/v1/posts/:id - Post günceller', () => {
    cy.request('PATCH', `http://localhost:3000/api/v1/posts/${createdPostId}`, {
      post: {
        title: 'Güncellenmiş Başlık',
        content: 'Güncellenmiş içerik'
      }
    }).then((response) => {
      expect(response.status).to.eq(200);
      expect(response.body.title).to.eq('Güncellenmiş Başlık');
      expect(response.body.content).to.eq('Güncellenmiş içerik');
      cy.log('✅ Post başarıyla güncellendi');
    });
  });

  it('DELETE /api/v1/posts/:id - Post siler', () => {
    cy.request('DELETE', `http://localhost:3000/api/v1/posts/${createdPostId}`)
      .then((response) => {
        expect(response.status).to.eq(204);
        cy.log('✅ Post başarıyla silindi');
      });
  });

  it('GET /api/v1/posts/9999 - Olmayan post 404 hatası verir', () => {
    cy.request({
      method: 'GET',
      url: 'http://localhost:3000/api/v1/posts/9999',
      failOnStatusCode: false
    }).then((response) => {
      expect(response.status).to.eq(404);
      expect(response.body.error).to.eq('Post not found');
      cy.log('✅ 404 hatası doğru çalışıyor');
    });
  });

  it('POST /api/v1/posts - Geçersiz veri 422 hatası verir', () => {
    cy.request({
      method: 'POST',
      url: 'http://localhost:3000/api/v1/posts',
      body: {
        post: {
          title: '',
          content: '',
          user_id: userId,
          category_id: categoryId
        }
      },
      failOnStatusCode: false
    }).then((response) => {
      expect(response.status).to.eq(422);
      expect(response.body).to.have.property('errors');
      cy.log('✅ Validasyon hatası doğru çalışıyor');
    });
  });
});
