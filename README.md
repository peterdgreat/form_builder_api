# Backend README

This README documents the steps necessary to get the backend of the Form Builder application up and running.

## Overview
This project is the backend of a dynamic Form Builder application, built using Ruby on Rails. It provides an API for the frontend to create, customize, and manage forms. The backend handles form data storage, user authentication, and serves the necessary endpoints for the frontend application.

## Features
- **API Endpoints**: RESTful API for managing forms and user authentication.
- **User Authentication**: Secure registration and login functionality.
- **Database Management**: Store and retrieve form data efficiently.

## Installation
Clone the repository:

```bash
git clone https://github.com/peterdgreat/form_builder_api
cd form_builder_api
```

Install dependencies:

```bash
bundle install
```

Set up the database:

```bash
rails db:create
rails db:migrate
```

Set up environment variables:

Create a `.env` file in the root of your project with the following variables:

```
DATABASE_URL=postgres://user:password@localhost:5432/form_builder_development
```

Adjust the `DATABASE_URL` to match your database configuration.

Start the development server:

```bash
rails server
```

The API should be running on `http://localhost:3001`.

## Usage
- **API Documentation**: Refer to the API documentation for available endpoints.
- **Authentication**: Use `/register` to create a new user and `/login` to authenticate.

## Deployment
To deploy the backend for production:

1. Precompile assets:
   ```bash
   RAILS_ENV=production rails assets:precompile
   ```
2. Deploy the application to your preferred hosting service (e.g., Heroku, AWS).

## Technologies
- Ruby on Rails
- PostgreSQL
- JWT for authentication

## Contributing
Feel free to fork the repository and submit pull requests. Issues and feature requests are welcome.

## License
This project is licensed under the MIT License.

This README covers the essential aspects of your backend project, helping others understand, set up, and contribute to it.
