# Upaguru Copilot

Upaguru Copilot is an intelligent, AI-powered assistant designed to support educators, curriculum developers, and institutions in generating, managing, and auditing lesson plans. As part of the broader UpaguruVerse platform, this service focuses on streamlining lesson planning workflows through secure, scalable, and API-driven interactions.

## Purpose

The primary goal of Upaguru Copilot is to empower education professionals with tools that:

- Generate lesson plans based on subject, topic, and grade level.
- Maintain auditable records of AI-generated content.
- Integrate securely with LLMs such as OpenAI via API.
- Provide automation-ready APIs for downstream LMS or dashboards.

## Key Features

- LLM integration for lesson plan generation
- Audit logging of requests and responses
- Modular service-oriented architecture (open/close layering)
- PostgreSQL with schema-based data segregation
- Swagger/OpenAPI documentation
- Docker-based local development support
- Config-driven setup via environment variables

## Technology Stack

- Spring Boot 3.x
- PostgreSQL (primary RDBMS)
- MongoDB (for unstructured storage, if needed)
- Redis (future integration for caching or state handling)
- OpenAI API for LLM-powered content generation
- Swagger UI for REST API documentation
- Docker Compose for local infrastructure provisioning
- Environment variable-driven configuration

## Development Status

The project is in active development. Initial focus is on enabling core lesson plan audit workflows, with future updates to support role-based prompts, prompt templates, and advanced analytics.

## License

This project is licensed under the Apache 2.0 License.

## Contact

For collaboration or inquiries, please reach out to the Upaguru team.

## When To use UpaGuru-CoPilot - Action & Response Generation

- When you want to generate natural language output or code.

- When you’re acting on a processed prompt and need a response, suggestion, or workflow plan.

- When the agent must take decisions or provide step-wise guidance.

### Typical Inputs
- Cleaned, enriched, summarized prompts.

- Context from mind or labels from sense.

### Typical Outputs
- Natural language answer.

- Multi-step plan, task list.

- Code snippet, command line, or instructions.

### Example Use Cases
- Provide explanation or advice based on recalled memory.

- Generate an email or a document section.

- Suggest next best action or step in a task.