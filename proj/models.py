from sqlalchemy.sql import func
import datetime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey, Boolean
from sqlalchemy_utils import PasswordType

Base = declarative_base()

class User(Base):
    __tablename__ = "user"
    id = Column(Integer, primary_key=True)
    email = Column(String)
    password = Column(PasswordType(
        schemes=[
            'pbkdf2_sha512',
            'md5_crypt'
        ],
        deprecated=['md5_crypt']
    ))

class Matrix(Base):
    __tablename__ = "matrix"
    id = Column(Integer, primary_key=True)
    name = Column(String)
    active = Column(Boolean)
    user = Column(Integer, ForeignKey("user.id"), nullable=False)
    created_at = Column(DateTime(timezone=True), default=func.now())

class Row(Base):
    __tablename__ = "row"
    id = Column(Integer, primary_key=True)
    name = Column(String)
    sort = Column(Integer)
    matrix = Column(Integer, ForeignKey("matrix.id"), nullable=False)

class Options(Base):
    __tablename__ = "options"
    id = Column(Integer, primary_key=True)
    key = Column(String)
    value = Column(String)

class Option(Base):
    __tablename__ = "option"
    id = Column(Integer, primary_key=True)
    key = Column(String)
    value = Column(String)
    sort = Column(Integer)
    options = Column(Integer, ForeignKey("options.id"), nullable=False)

class Col(Base):
    __tablename__ = "col"
    id = Column(Integer, primary_key=True)
    name = Column(String)
    sort = Column(Integer)
    matrix = Column(Integer, ForeignKey("matrix.id"), nullable=False)
    options = Column(Integer, ForeignKey("options.id"), nullable=False)

class Resp(Base):
    __tablename__ = "resp"
    id = Column(Integer, primary_key=True)
    user = Column(Integer, ForeignKey("user.id"), nullable=True)

class Cell(Base):
    __tablename__ = "cell"
    id = Column(Integer, primary_key=True)
    value = Column(String)
    row = Column(Integer, ForeignKey("row.id"), nullable=False)
    col = Column(Integer, ForeignKey("col.id"), nullable=False)
    option = Column(Integer, ForeignKey("option.id"), nullable=False)
    resp = Column(Integer, ForeignKey("resp.id"), nullable=False)


