#!/usr/bin/env python3
import connexion
from actors_api_plan.server import server

app = connexion.AioHttpApp(__name__, only_one_api=True)
app.add_api(f'actors_api_plan/spec.yml')
# set the WSGI application callable to allow using uWSGI:
# uwsgi --http :8080 -w app
application = app.app


if __name__ == '__main__':
    server.run()
    