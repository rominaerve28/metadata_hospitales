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


def procedimientosAlmacenados():
    conexion = mysql.connector.connect(
        host='localhost',
        user='root',
        password='123456',
        database='hospitales_db'
    )
    try:
        conexion._open_connection()
        cursor = conexion.cursor()

        cursor.execute("SHOW TABLES FROM hospitales_db")
        tablas = cursor.fetchall()

        with open('procedimientoAlmacenado.sql', 'w') as archivo:
            archivo.write(f"DELIMITER $$\n\n")
            
            for tabla in tablas:
                nombre_tabla = tabla[0]
                cursor.execute(f"DESCRIBE {nombre_tabla}")
                columnas = cursor.fetchall()
                
                # Identificar la clave primaria
                primary_key = None
                columnas_nombres = []
                columnas_parametros = []
                columnas_update = []
                
                for columna in columnas:
                    col_name = columna[0]
                    col_type = columna[1]
                    if columna[3] == 'PRI' and columna[5] == 'auto_increment':
                        primary_key = col_name
                    else:
                        columnas_nombres.append(col_name)
                        columnas_parametros.append(f"IN p_{col_name} {col_type}")
                        columnas_update.append(f"{col_name} = p_{col_name}")

                # Generar nombres de columnas y parámetros
                columnas_insert = ", ".join(columnas_nombres)
                columnas_parametros = ", ".join(columnas_parametros)
                
                # Procedimiento almacenado para insertar registros
                archivo.write(f"CREATE PROCEDURE Insertar_{nombre_tabla} ({columnas_parametros}) \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    INSERT INTO {nombre_tabla} ({columnas_insert}) VALUES ({', '.join([f'p_{col}' for col in columnas_nombres])});\n")
                archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para actualizar registros
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Actualizar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}, {columnas_parametros}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    UPDATE {nombre_tabla} SET {', '.join(columnas_update)} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para eliminar registros
                if primary_key:
                    archivo.write(f"CREATE PROCEDURE Eliminar_{nombre_tabla} (IN p_{primary_key} {columnas[0][1]}) \n")
                    archivo.write(f"BEGIN\n")
                    archivo.write(f"    DELETE FROM {nombre_tabla} WHERE {primary_key} = p_{primary_key};\n")
                    archivo.write(f"END $$\n\n")
                
                # Procedimiento almacenado para obtener todos los registros
                archivo.write(f"CREATE PROCEDURE ObtenerTodos_{nombre_tabla} () \n")
                archivo.write(f"BEGIN\n")
                archivo.write(f"    SELECT * FROM {nombre_tabla};\n")
                archivo.write(f"END $$\n\n")
            
            archivo.write(f"DELIMITER ;\n")
    
        print("Scripts de procedimientos almacenados generados exitosamente.")
    
    except mysql.connector.Error as error:
        print("Error al generar script: ", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")

