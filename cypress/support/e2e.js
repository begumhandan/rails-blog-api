// Custom commands for user operations
Cypress.Commands.add('registerUser', (userData) => {
  return cy.request({
    method: 'POST',
    url: `${Cypress.config('baseUrl')}/users`,
    body: { user: userData },
    failOnStatusCode: false
  });
});

Cypress.Commands.add('loginUser', (credentials) => {
  return cy.request({
    method: 'POST',
    url: `${Cypress.config('baseUrl')}/login`,
    body: credentials,
    failOnStatusCode: false
  });
});

// Prevent Cypress from failing on uncaught exceptions
Cypress.on('uncaught:exception', (err, runnable) => {
  return false;
});
