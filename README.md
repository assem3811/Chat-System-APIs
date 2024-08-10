# Chat System API

This is a Ruby on Rails API application designed to manage a chat system. The application supports creating and managing applications, chats, and messages, with integrated Elasticsearch for searching messages. The application is containerized using Docker.

## Features

- **Applications**: Manage multiple applications with unique tokens.
- **Chats**: Each application can have multiple chats.
- **Messages**: Each chat can contain multiple messages.
- **Search**: Integrated with Elasticsearch to search through messages.
- **Dockerized**: Easily set up and run the entire stack with Docker.

## Technologies Used
- Ubuntu Linux OS
- Ruby on Rails
- MySQL
- Elasticsearch
- Redis
- Docker

## Prerequisites

- Docker
- Docker Compose
- It is highly recommended to run the app on Linux OS

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/assem3811/Chat-System-APIs
cd chat-system-api
```
### 2. Set Up the Environment
Ensure you have Docker and Docker Compose installed on your machine.

### 3. Build and run the Application
```bash
docker-compose up --build
```
This Will:
- Set up the MySQL, Elasticsearch, and Redis services.
- Create and migrate the database.
- Start the rails server on `http://localhost:3000`

### 4. Testing the APIs
Once the application is running, you can use tools like curl or Postman to interact with the API. The following are some example endpoints:
- List Applications: `GET /applications`
- Create a Chat: `POST /applications/:application_token/chats/:chat_number/messages`
- Send a message: `POST /applications/:application_token/chats/:chat_number/messages`
- Search messages: `GET /applications/:application_token/chats/:chat_number/messages/search?q=your_query`

### 5. Stopping the Application
```bash
docker-compose down
```
## API Endpoints
### Applications
- List all Applications: `GET /applications`
- Get an Application by a token: `/applications/:application_token`
- Create a new Application: `POST /applications`
  - Request Body: `{ "name": "Application name" }`
- Update an Application name: `PUT /applications/:application_token`
  - Request Body: `{ "name": "Application name" }`
- Delete an Application: `DELETE /applications/:application_token`

### Chats
- Get Chats of a specific Application: `GET /applications/:application_token/chats`
- Get a chat by its number: `GET /applications/:application_token/chats/:chat_number`
- Create a new chat: `POST /applications/:application_token/chats`
- Delete a chat: `DELETE /applications/:application_token/chats/:chat_number`

### Messages
- Get messages of a specific chat of a specific Application: `GET /applications/:application_token/chats/:chat_number/messages`
- Search a message by Elastic search: `GET /applications/:application_token/chats/:chat_number/messages/search?query=search_key`

## Troubleshooting
### Elasticsearch connection issue
If you encounter issues with Elasticsearch, such as Connection refused, ensure that the Elasticsearch service is running and that the ELASTICSEARCH_URL is correctly configured in your docker-compose.yml. If all set make sure to run this command
```bash
sudo systemctl start elasticsearch
```

### Database errors
If you encounter database connection issues, ensure that the MySQL service is running and that the environment variables in docker-compose.yml are correctly set.

### License
This project is implemented on behalf of Instabug assessment. It is an open source for references and knowledge-sharing purposes.

### Author
Assem Salama
