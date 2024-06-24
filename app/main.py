# uvicorn app.main:app --reload
from fastapi import FastAPI, Request
# fastapi middleware for cors
from fastapi.middleware.cors import CORSMiddleware
from fastapi.testclient import TestClient

from . import models
from .database import engine
# import routers
from .routers import employee, auth, rol, attendance, payroll, payroll_perk, payroll_deduction, overtime


# not needed with alembic
models.Base.metadata.create_all(bind=engine)

app = FastAPI()

# fastapi middleware for cors
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.middleware("http")
async def log_headers(request: Request, call_next):
    print("Request Headers:", request.headers)
    response = await call_next(request)
    return response

# include routers
app.include_router(employee.router)
app.include_router(auth.router)
app.include_router(attendance.router)
app.include_router(rol.router)
app.include_router(payroll.router)
app.include_router(payroll_perk.router)
app.include_router(payroll_deduction.router)
app.include_router(overtime.router)


client = TestClient(app)

# root route
@app.get("/")
def root():
    return {"data": "Hello World"}

# startup event
@app.on_event("startup")
def startup():
    print ("Starting up")
    # users = user.get_users()
    # print(users)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"data": "Hello World"}
