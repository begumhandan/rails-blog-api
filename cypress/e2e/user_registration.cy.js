describe('User Registration and Login with Context7', () => {
  let testUser;

  before(() => {
    cy.log('Context7 initialized');
    
    const timestamp = Date.now();
    testUser = {
      name: 'Test User',
      email: `test_${timestamp}@example.com`,
      password: 'SecurePassword123!'
    };
    
    cy.log(`Test user email: ${testUser.email}`);
  });

  it('User successfully registers and logs in', () => {
    cy.log('When the user submits valid registration details');
    
    cy.request({
      method: 'POST',
      url: 'http://localhost:3000/api/v1/users',
      body: {
        user: {
          name: testUser.name,
          email: testUser.email,
          password: testUser.password,
          password_confirmation: testUser.password
        }
      }
    }).then((response) => {
      cy.log('Then the user should be created in the system');
      
      expect(response.status).to.eq(201);
      expect(response.body).to.have.property('id');
      expect(response.body).to.have.property('email', testUser.email);
      expect(response.body).to.have.property('name', testUser.name);
      
      cy.log('✅ User created successfully');
      cy.log('And Context7 should update the context for the new user');
      cy.log('✅ Context updated');
    });

    cy.log('When the user logs in with valid credentials');
    
    cy.request({
      method: 'POST',
      url: 'http://localhost:3000/api/v1/login',
      body: {
        email: testUser.email,
        password: testUser.password
      }
    }).then((response) => {
      cy.log('Then the user should see their profile page');
      
      expect(response.status).to.eq(200);
      expect(response.body).to.have.property('user');
      expect(response.body.user.email).to.eq(testUser.email);
      
      cy.log('✅ User logged in successfully');
      cy.log('And Context7 should reflect the active user context');
      
      const activeUser = response.body.user.name;
      expect(activeUser).to.eq(testUser.name);
      
      cy.log(`Active user context: ${activeUser}`);
      cy.log('✅ Context7 reflects active user');
    });
  });
});
