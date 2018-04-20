# for init-time only
if __name__ == "__main__":
    from engine import engine
    from model import Base
    Base.metadata.create_all(engine)