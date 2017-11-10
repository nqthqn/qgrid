
from apistar.backends.sqlalchemy_backend import Session
from proj.models import *


def fixtures(session: Session):
    # Add a test user
    user = User(email="test@example.com",password="foobar")
    session.add(user)
    session.flush()

    # Add matrix
    session.add(Matrix(name="Candidates", active=True, user=user.id))
    session.add(Matrix(name="Multiplication", active=False, user=user.id))
    session.add(Matrix(name="Gradebook", active=False, user=user.id))
    session.add(Matrix(name="Survey Grid 1", active=False, user=user.id))
    session.flush()

    # Populate matrix axis
    m = session.query(Matrix).get(1)
    session.add(Row(name="Bob", sort=1, matrix=m.id))
    session.add(Row(name="Suzy", sort=2, matrix=m.id))
    session.add(Row(name="Joe", sort=3, matrix=m.id))

    o5 = Options(key="text")
    o2 = Options(key="drop")
    session.add(o2)
    session.add(o5)
    session.flush()

    session.add(Option(key="0", value="Sad", options=o2.id, sort=1))
    session.add(Option(key="1", value="Meh", options=o2.id, sort=2))
    session.add(Option(key="2", value="Happy", options=o2.id, sort=3))

    session.add(Col(name="Skills (1 - 5)", sort=1, matrix=m.id, options=o5.id))
    session.add(Col(name="Looks (1 - 5)", sort=1, matrix=m.id, options=o5.id))
    session.add(Col(name="Joy", sort=2, matrix=m.id, options=o2.id))
    session.add(Col(name="Notes", sort=3, matrix=m.id, options=o5.id))

    session.flush()


