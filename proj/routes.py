from apistar import Include, Route
from apistar.handlers import docs_urls, serve_static

from proj.views import *

routes = [
    Route('/', 'GET', home),
    Route('/matrix', 'GET', list_matrix),
    Route('/matrix/{id}', 'GET', get_matrix),
    Route('/matrix', 'POST', add_matrix),

    Include('/docs', docs_urls),
    Route('/static/{path}', 'GET', serve_static)

]