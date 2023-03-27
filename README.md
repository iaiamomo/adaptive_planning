# Adaptivity via Planning techniques

Implementation a tool to compose industral services via Planning techniques.

## Use the source code

### Preliminaries

Setup the environment (install [miniconda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html#installing-conda-on-a-system-that-has-other-python-installations-or-packages)):
```sh
conda env create -f environment.yml
conda activate py3
```

Finally, clone [Fast Downward](https://github.com/aibasel/downward) planner respository and build it:
```sh
git clone https://github.com/aibasel/downward.git
cd downward
./build.py
```


### How to run the code

1. Put the descriptions of the industral actors inside [descriptions](industrial_services/actors_api_plan/descriptions/) folder (refer to [template](industrial_services/README.md)).

2. Generate Python client from OpenAPI v3.0 specification:
```sh
cd actors_api_plan/openapi_client_script
./generate-openapi-client.sh
```

3. Setup [config.json](config.json) file

3. Inside [industrial_services](industrial_services), run the server representing a middleware exposing HTTP server and a websocket server:
```sh
cd industrial_services
python app.py
```

4. Then, run the services (inside [industrial_services](industrial_services)):
```sh
cd industrial_services
python launch_devices.py
```

5. Set the goal and the contextual informations inside [context.py](context.py). N.B.: some knowledge of automated planning is required.

6. Start the orchestrator:
```sh
python orchestrator.py
```


## Use the Docker image

### Preliminaries

Build an image from the [Dockerfile](Dockerfile):
```sh
docker build -t orchestrator .
```

Run a new container from the image created:
```sh
docker run -it --network host orchestrator bash
```

Get the ``CONTAINER ID`` of the running container with:
```sh
docker ps
```


### How to run the code

1. Open three terminals in a running container executing three times:
```sh
docker exec -it <CONTAINER_ID> bash
```

2. Then, follow the instructions listed in the previous section.

N.B. Use ``python3`` instead of ``python`` when launching components.