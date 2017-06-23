# API v2 client requirements

These are some initial thoughts on designing API v2 clients.

We would like to support three kinds of clients:

- CLI client for our customers
- Ruby client for customers
- Elixir client to allow other microservices to access front's API
- JavaScript client to streamline UI <-> front communication

It would be awesome if we could generate these client from RAML.
Based on my experience with it, we will be forced to write our own
extensions and tools to support this generation. Out of the box solutions
are probably not good enough.
