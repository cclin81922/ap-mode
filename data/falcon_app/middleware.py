from engine import engine


from sqlalchemy.orm import sessionmaker
session_factory = sessionmaker(bind=engine)


from sqlalchemy.orm import scoped_session
Session = scoped_session(session_factory)


class SQLAlchemySessionManager:
    """
    Create a scoped session for every request and close it when the request
    ends.
    """

    def __init__(self, Session):
        self.Session = Session

    def process_resource(self, req, resp, resource, params):
        resource.db_session = self.Session()

    def process_response(self, req, resp, resource, req_succeeded):
        if hasattr(resource, 'db_session'):
            Session.remove()