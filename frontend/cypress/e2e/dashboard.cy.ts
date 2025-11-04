/// <reference types="cypress" />

describe("Dashboard and User Management", () => {
  beforeEach(() => {
    // Sayfayı aç
    cy.visit("/"); // Eğer farklı route varsa burayı değiştir
  });

  it("should display dashboard cards with correct values", () => {
    cy.contains("Total Users").should("exist");
    cy.contains("Active Sessions").should("exist");
    cy.contains("Revenue").should("exist");

    // Kullanıcı sayısını kontrol et
    cy.contains("Total Users")
      .parent() // DashboardCard wrapper
      .contains("4"); // initial users array uzunluğu
  });

  it("should add a new user via the form", () => {
    const newUser = { name: "Jane Doe", email: "jane@example.com" };

    // Formu doldur
    cy.get("input[name='name']").type(newUser.name);
    cy.get("input[name='email']").type(newUser.email);

    // Formu submit et
    cy.get("form").contains("Register User").click();

    cy.wait(4000);

    // UserTable içinde yeni kullanıcıyı gör
    cy.get("table").contains("td", newUser.name).should("exist");
    cy.get("table").contains("td", newUser.email).should("exist");

    // Dashboard "Total Users" sayısını kontrol et
    cy.contains("Total Users").parent().contains("5"); // önce 4, yeni kullanıcı ile 5 olmalı
  });
});
