import falcon


from middleware import SQLAlchemySessionManager
from middleware import Session
api = application = falcon.API(middleware=[
    SQLAlchemySessionManager(Session),
])


class QuoteResource:
    def on_get(self, req, resp):
        """Handles GET requests"""
        quote = {
            'quote': (
                "I've always been more interested in "
                "the future than in the past."
            ),
            'author': 'Grace Hopper'
        }

        #from model import User
        #user = User(id=1, name='cclin')
        #self.db_session.add(user)
        #self.db_session.commit()

        resp.media = quote


api.add_route('/quote', QuoteResource())

# for dev-time only
if __name__ == "__main__":
    options = {
         'bind': '%s:%s' % ('127.0.0.1', '8080'),
         'workers': 1,
    }

    import gunicorn.app.base
    class StandaloneApplication(gunicorn.app.base.BaseApplication):
        def __init__(self, app, options=None):
            self.options = options or {}
            self.application = app
            super(StandaloneApplication, self).__init__()

        def load_config(self):
            from gunicorn.six import iteritems
            config = dict([(key, value) for key, value in iteritems(self.options)
                       if key in self.cfg.settings and value is not None])
            for key, value in iteritems(config):
                self.cfg.set(key.lower(), value)

        def load(self):
            return self.application

    StandaloneApplication(api, options).run()