
from apistar.frameworks.asyncio import ASyncIOApp as App
from apistar.backends import sqlalchemy_backend
from apistar import Command
from proj.routes import routes
from proj.models import Base
from proj.fixtures import fixtures

settings = {
    'DATABASE': {
        'URL': 'sqlite:///db.sqlite3',
        'METADATA': Base.metadata
    },
    'STATICS': {
        'ROOT_DIR': 'front/static',
        'PACKAGE_DIRS': ['apistar']
    },
    'TEMPLATES': {
        'ROOT_DIR': 'front/templates',
        'PACKAGE_DIRS': ['apistar']
    }
}

commands = [
    Command('fixtures', fixtures)
]
# TODO,  combine them?

app = App(
        routes=routes,
        settings=settings,
        commands= commands + sqlalchemy_backend.commands,
        components=sqlalchemy_backend.components
    )

if __name__ == '__main__':
    app.main()
