# Industrial APIs

Implementing **Industrial APIs** for industrial actors (devices, machines, humans,...). 

Follow the following **template** to generate the actors descriptions. The template represents a designer human. The different aspects of the actor are represented as attributes and features. <em>Features</em> represent a state with properties (e.g., <code>status</code>), while <em>attributes</em> (e.g., <code>type</code>, <code>actions</code>, <code>transitions</code>) represent functionalities and values that do not change or that change less frequently than the <em>features</em> property values.
```json
{
  "id": "designerusa",
  "attributes": {
      "type": "Service",
      "_comment": "static properties"
  },
  "features": {
      "_comment": "dynamic properties"
  }
}
```

## Instructions
Run the server representing a middleware exposing HTTP server and a websocket server:
```sh
python app.py
```

Run the services (which communicate with the server through websocket):
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

## Note
If you want to execute Industrial APIs to use MDP orchestrator please make some changes in [app.py](app.py) and [launch_devices.py](launch_devices.py) files.