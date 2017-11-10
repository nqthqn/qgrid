
from apistar.backends.sqlalchemy_backend import Session
from proj.models import *
from apistar.renderers import HTMLRenderer
from apistar import annotate, render_template

@annotate(renderers=[HTMLRenderer()])
def home():
    return render_template('index.html')

def list_matrix(session: Session):
    queryset = session.query(Matrix).all()

    return [
        {'id': matrix.id
        ,'name': matrix.name
        ,'active': matrix.active
        ,'rows' : rows(session, matrix.id)
        ,'cols' : cols(session, matrix.id)
        }
        for matrix in queryset
    ]

def get_matrix(session: Session, id: int):
    matrix = session.query(Matrix).get(id)
    return {'id': matrix.id
        ,'name': matrix.name
        ,'active': matrix.active
        ,'rows' : rows(session, matrix.id)
        ,'cols' : cols(session, matrix.id)
        }

def create_matrix():
    return None

def add_matrix():
    return None


def rows(session: Session, id: int):
        return [
            {'id': row.id
            ,'name': row.name
            ,'sort': row.sort
            }
            for row in session.query(Row).filter(Row.matrix==id)
        ]

def cols(session: Session, id: int):
    return [
        {'id': col.id
        ,'name': col.name
        ,'sort': col.sort
        ,'options' : options(session, col.options)
        }
        for col in session.query(Col).filter(Col.matrix==id)
    ]

def options(session: Session, id: int):
    grp = session.query(Options).get(id)
    return {'id': grp.id
        ,'key': grp.key
        ,'value': grp.value
        ,'options' :
            [
                {'id': opt.id
                ,'key': opt.key
                ,'value': opt.value
                ,'sort' : opt.sort
                }
                for opt in session.query(Option).filter(Option.options==grp.id)
            ]
        }

