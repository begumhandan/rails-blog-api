#  Ruby on Rails Blog API

This project is a **Blog API** built with **Ruby on Rails**.  
It allows users to create posts, write comments, and organize content using categories and tags.  
The application defines clear relationships between **User**, **Category**, **Post**, **Comment**, and **Tag** models,  
supporting both one-to-many and many-to-many associations.

---

##  Features
- Users can create, update, and delete posts.  
- Comments are linked to both posts and users.  
- Posts can be categorized and tagged for better organization.  
- Full CRUD operations are available for each model.  
- Relationships are managed through Active Record (`has_many`, `belongs_to`, `has_and_belongs_to_many`).

---

##  Technologies Used
- **Ruby on Rails 7**  
- **Active Record Associations**  
- **Model Validations**

---

##  Usage

### Load sample data:
```bash
rails db:seed
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
