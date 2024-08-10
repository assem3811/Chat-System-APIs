# Chat System API

This is a Ruby on Rails API application designed to manage a chat system. The application supports creating and managing applications, chats, and messages, with integrated Elasticsearch for searching messages. The application is containerized using Docker.

## Features

- **Applications**: Manage multiple applications with unique tokens.
- **Chats**: Each application can have multiple chats.
- **Messages**: Each chat can contain multiple messages.
- **Search**: Integrated with Elasticsearch to search through messages.
- **Dockerized**: Easily set up and run the entire stack with Docker.

## Technologies Used

- Ruby on Rails
- MySQL
- Elasticsearch
- Redis
- Docker

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/chat-system-api.git
cd chat-system-api
