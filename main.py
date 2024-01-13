from fastapi import FastAPI
from browser_handler import BrowserHandler


app = FastAPI()


@app.get("/")
def read_root():
    bh = BrowserHandler()

    bh.login()

    bh.move_to_input_attendance_page()

    return {"Hello": "World"}
