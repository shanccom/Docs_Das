import os

import psycopg
from dotenv import load_dotenv

load_dotenv()

database_url = os.getenv("DATABASE_URL")

if not database_url:
    raise Exception("No se encontró DATABASE_URL en el archivo .env")

try:
    with psycopg.connect(database_url) as connection:
        print("Conexión exitosa a PostgreSQL")

        with connection.cursor() as cursor:
            cursor.execute("SELECT version();")
            version = cursor.fetchone()

            print("PostgreSQL:")
            print(version[0])

except Exception as error:
    print("❌ Error de conexión:")
    print(error)
