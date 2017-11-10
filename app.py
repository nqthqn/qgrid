
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

app = App(
        routes=routes,
        settings=settings,
        commands=sqlalchemy_backend.commands.append(Command('fixtures', fixtures)),
        components=sqlalchemy_backend.components
    )

if __name__ == '__main__':
    app.main()
