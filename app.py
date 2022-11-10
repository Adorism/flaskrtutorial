from flaskr.__init__ import create_app


gunicorn_app = create_app()