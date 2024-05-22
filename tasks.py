import mysql.connector


conexion = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456'
)

HOST = 'localhost'


def addUser():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario: ")
        contraseña = input("Ingresa la contraseña: ")
        
        cursor = conexion.cursor()

        consulta = f"CREATE USER '{usuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"

        cursor.execute(consulta)

        conexion.commit()

        print("Usuario agregado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def updateUser():
    try:
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario que quiere actualizar: ")
        newUsuario = input("Ingresa el nuevo nombre del usuario: ")
        contraseña = input("Ingresa la nueva contraseña: ")
        
        cursor = conexion.cursor()

        consulta = f"RENAME USER '{usuario}'@'{HOST}' TO '{newUsuario}'@'{HOST}'"
        
        cursor.execute(consulta)
        conexion.commit()
        
        consulta2 = f"ALTER USER '{newUsuario}'@'{HOST}' IDENTIFIED BY '{contraseña}'"

        cursor.execute(consulta2)
        conexion.commit()
        

        print("Usuario actualizado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al actualizar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def deleteUser():
    try: 
        conexion._open_connection()
        usuario = input("Ingresa el nombre del usuario a ser eliminado: ")

        cursor = conexion.cursor()

        consulta = f"DROP USER '{usuario}'@'{HOST}'"

        cursor.execute(consulta)
        conexion.commit()

        print("Usuario eliminado correctamente.")
    
    except mysql.connector.Error as error:
        print("Error al eliminar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")


def getUsers():
    try:
        conexion._open_connection()

        
        cursor = conexion.cursor()

        consulta = f"SELECT * FROM mysql.user"

        cursor.execute(consulta)

        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print(consulta)
        print("Presiona Enter para continuar...")
        input()
        print("Continuando con el programa...")

    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")



def getRoles():
    try:
        conexion._open_connection()
        
        cursor = conexion.cursor()

        consulta = f"""SELECT COLUMN_NAME
                    FROM information_schema.COLUMNS
                    WHERE TABLE_NAME = 'user' 
                    AND TABLE_SCHEMA = 'mysql' 
                    AND COLUMN_TYPE LIKE "enum('N','Y')"
                    AND IS_NULLABLE = 'NO'"""

        cursor.execute(consulta)

        resultados = cursor.fetchall()

        for fila in resultados:
            print(fila)
        print("Presiona Enter para continuar...")
        input()
        print("Continuando con el programa...")

    
    except mysql.connector.Error as error:
        print("Error al agregar usuario:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")