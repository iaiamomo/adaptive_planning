# Agility via Planning techniques

## Description
This repository contains the implementation of a tool to compose manufacturing actors via planning techniques, which have been introduced in the paper "On the Application of Process Management and Process Mining to Industry 4.0".

## Experimental results - Glass Factory
[plan1](plan1), [plan2](plan2), [plan3](plan3) contains three different results based on three different initial conditions of the involved actors. The descriptions of the initial conditions of the actors are contained in the relative folders.

- [plan1](plan1): all the actors are available and the resulting plan is the one involving **rb1** and **converter** to produce glass as it is less expensive.

- [plan2](plan2): **rb1** is *broken* and the resulting plan is the one involving **rb2** and **converter** to produce glass as it is less expensive.

- [plan3](plan3): **converter** is *broken* and the resulting plan is the one involving **rb2**, **heater**, **processor** and **cooler** to produce glass as it is less expensive.

### Reproduce the experiments
To reproduce the experiments put the descriptions of the actors contained in the three folders inside [descriptions](industrial_services/actors_api_plan/descriptions) and follow the instructions listed below.

## Use the source code

### Preliminaries

Setup the environment (install [miniconda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html#installing-conda-on-a-system-that-has-other-python-installations-or-packages)):
```sh
conda env create -f environment.yml
conda activate py3
```

Finally, clone [Fast Downward](https://github.com/aibasel/downward) planner repository and build it:
```sh
git clone https://github.com/aibasel/downward.git
cd downward
./build.py
```


### How to run the code

1. Put the descriptions of the industrial actors inside [descriptions](industrial_services/actors_api_plan/descriptions/) folder (refer to the [template](industrial_services/README.md)).

2. Generate Python client from OpenAPI v3.0 specification:
```sh
cd industrial_services/actors_api_plan/openapi_client_script
./generate-openapi-client.sh
```

3. Inside [industrial_services](industrial_services), run the server representing a middleware exposing HTTP server and a web socket server:
```sh
cd industrial_services
python app.py
```

4. Then, run the services:
```sh
cd industrial_services
python launch_devices.py
```

5. Set the goal and other contextual information inside [context.py](context.py). N.B.: some knowledge of automated planning is required.

6. Start the orchestrator:
```sh
python orchestrator.py
```

## License
Distributed under the MIT License. See [LICENSE](LICENSE) for more information.
