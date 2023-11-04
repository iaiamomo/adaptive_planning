# Industrial APIs

Implementing **Industrial APIs** for manufacturing actors (devices, machines, humans,...). 

Follow the **template** to generate the actors descriptions. The different characteristics of the actor are represented as attributes and features. <em>Features</em> represent the dynamic properties (e.g., <code>status</code>) which change during the lifecycle of the actor, while <em>attributes</em> (e.g., <code>type</code>, <code>actions</code>, <code>transitions</code>) represent functionalities and values that do not change over time.
```json
{
  "id": "actor_id",
  "attributes": {
      "type": "type_of_the_actor",
      "_comment": "static properties"
  },
  "features": {
      "_comment": "dynamic properties"
  }
}
```

## Instructions
Run the server. It exposes an HTTP server and a websocket server:
```sh
python app.py
```

Launch the actors (which communicate with the server through websocket):
```sh
python launch_devices.py
```

## Preliminaries
Install required Python packages:
```sh
pip install -r requirements.txt
```

Generate Python client from OpenAPI v3.0 specification:
```sh
cd actors_api_plan/open_client_script
./generate-openapi-client.sh
```
