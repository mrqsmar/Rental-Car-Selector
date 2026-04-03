import mysql.connector
from config import Config


def get_db():
    return mysql.connector.connect(
        host=Config.MYSQL_HOST,
        user=Config.MYSQL_USER,
        password=Config.MYSQL_PASSWORD,
        database=Config.MYSQL_DATABASE,
    )


def query_db(sql, params=None, fetchone=False):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql, params or ())
    rows = cursor.fetchone() if fetchone else cursor.fetchall()
    cursor.close()
    conn.close()
    return rows
