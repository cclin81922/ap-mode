# for init-time only
if __name__ == "__main__":
    from model import User
    user = User(id=1, name='cclin')

    from engine import engine
    
    from sqlalchemy.orm import sessionmaker
    Session = sessionmaker(bind=engine)
    session = Session()
    session.add(user)
    session.commit()