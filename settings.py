import os
from os.path import join, dirname
from dotenv import load_dotenv

load_dotenv(verbose=True)

dotenv_path = join(dirname(__file__), ".env")
load_dotenv(dotenv_path)

USER_EMAIL = os.environ.get("USER_EMAIL")
USER_PASS = os.environ.get("USER_PASS")
