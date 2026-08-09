from sqlalchemy import create_engine
import pandas as pd

def get_engine(db_path='data/superstore.db'):
    """Create and return a SQLAlchemy engine for the SQLite database."""
    return create_engine(f'sqlite:///{db_path}')

def run_query(query, engine=None, db_path='data/superstore.db'):
    """Run a SQL query and return results as a pandas DataFrame."""
    if engine is None:
        engine = get_engine(db_path)
    return pd.read_sql(query, engine)