Flaskr
======

The basic blog app built in the Flask `tutorial`_, modified to use
Flask-SQLAlchemy instead of plain SQL.

.. _tutorial: https://flask.palletsprojects.com/tutorial/


Install
-------

**Be sure to use the same version of the code as the version of the docs
you're reading.** You probably want the latest tagged version, but the
default Git version is the master branch.

.. code-block:: text

    # clone the repository
    $ git clone https://github.com/pallets/flask-sqlalchemy
    $ cd flask-sqlalchemy/examples/flaskr
    # checkout the correct version
    $ git checkout correct-version-tag

Create a virtualenv and activate it:

.. code-block:: text

    $ python3 -m venv venv
    $ . venv/bin/activate

Or on Windows cmd:

.. code-block:: text

    $ py -3 -m venv venv
    $ venv\Scripts\activate.bat

Install Flaskr:

.. code-block:: text

    $ pip install -e .

Or if you are using the master branch, install Flask-SQLAlchemy from
source before installing Flaskr:

.. code-block:: text

    $ pip install -e ../..
    $ pip install -e .


Run
---

.. code-block:: text

    $ export FLASK_APP=flaskr
    $ export FLASK_ENV=development
    $ flask init-db
    $ flask run

Or on Windows cmd:

.. code-block:: text

    > set FLASK_APP=flaskr
    > set FLASK_ENV=development
    > flask init-db
    > flask run

Open http://127.0.0.1:5000 in a browser.


Test
----

.. code-block:: text

    $ pip install -e '.[test]'
    $ pytest

Run with coverage report:

.. code-block:: text

    $ coverage run -m pytest
    $ coverage report
    $ coverage html  # open htmlcov/index.html in a browser


Flask is a Python web framework that is lightweight and has many useful tools and features for creating web applications. SQLAlchemy is a database toolkit for Python that provides efficient and performant database access. You can use SQLAlchemy to interact with SQL-type database engines such as SQLite, MySQL, and PostgreSQL. SQLAlchemy provides you with an Object Relational Mapper (ORM). This makes it possible to interact with data, making queries and edits, using the Python language. 

In this tutorial, you’ll build start with a repository that has a ready-made Flask App called Flaskr which is a simple blogging application. You’ll also use Flask-SQLAlchemy, which is a Flask extension that makes it simple to use Flask and SQLAlchemy together.

For more information on Flaskr, refer to this official tutorial which guides you through the process of creating the application from scratch. The repo we will use is based on one of the examples in the flask-sqlachemy repo. 

Fork this repo and clone it to your local machine

Navigate to the repo in the terminal, create a virtual environment, and then activate it
```python3 -m venv venv
```
```. venv/bin/activate
```

Install Flaskr
```pip install -e .
```

You’ll need two environment variables set. When we deploy, you will set those in the blueprint, but for now, while developing locally, you’ll just export them via the command line. 

```export FLASK_APP=flaskr
```
And 
```export FLASK_ENV=development
```
[note here that there are ENV warnings that it’s deprecated and instead to use FLASK_DEBUG…but I am not sure what to do with that…might reach out to Pallets folks]

The next step is to initialize the database
```
flask init-db
```

And finally, run your application
```
flask run
```

To see it running locally in a browser, open http://127.0.0.1:5000

To prepare it for deployment, we will be using poetry. This will read a pyproject.toml file
We will also build a blueprint for this deployment. Blueprints are Render’s implementation of infrastructure as code. Help with version control over this project’s deployment. 

1: create a .gitignore
2: run ```poetry init``` This will automatically create the pyproject for you. Choose to build this interactively
Add Flask, SQLAlchemy, and Flask-SQLAlchemy as dependencies, leaving the version blank
Would you like to define your development dependencies interactively? Yes Add poetry
When you confirm generation, it will add a python.toml file to your repo 

Now, add a start script in pyproject.toml (
[tool.poetry.scripts]
my-script = "flaskr.__init__:start"

And from the console run poetry install
Once dependencies are done installing, you can run `poetry run my-script`

Poetry run flask init-db
Poetry run flask run


3: create a Blueprint file called render.yaml
