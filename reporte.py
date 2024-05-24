import mysql.connector
from fpdf import FPDF


conexion = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456'
)

HOST = 'localhost'
def listar(): 
    try: 
        conexion._open_connection()
        cursor = conexion.cursor()


        consulta = f"""SELECT TABLE_NAME
                    FROM information_schema.TABLES
                    WHERE TABLE_SCHEMA = 'hospitales_db'"""
        
        cursor.execute(consulta)
        
        resultados = cursor.fetchall()
        for fila in resultados:
            print(fila)
        table = input("Ingresa el nombre de la entidad de la que quiere generar un reporte: ")
        columnas(table)
    except mysql.connector.Error as error:
        print("Error al listar entidades:", error)

def columnas(table):
    try: 
        conexion._open_connection()
        cursor = conexion.cursor()
        consulta = f"""SELECT COLUMN_NAME
                        FROM information_schema.COLUMNS
                        WHERE TABLE_NAME = '{table}' 
                        AND TABLE_SCHEMA = 'hospitales_db'"""
        
        cursor.execute(consulta)
        resultados = cursor.fetchall()
        for fila in resultados:
            print(fila)
        reporte(table)

    except mysql.connector.Error as error:
        print("Error al listar entidades:", error)            

def reporte(table):
    try: 

        conexion._open_connection()
        cursor = conexion.cursor()
        columnasNombres = input("Ingrese las columnas que quiere en el reporte(separe las columnas con una ','): ")

        consulta = f"""SELECT {columnasNombres}
                        FROM hospitales_db.{table}"""
        cursor.execute(consulta)
        
        
        resultados = cursor.fetchall()
        # for fila in resultados:
        #     print(fila)
        pdf = FPDF()
        pdf.add_page()
        pdf.set_font("Arial", size=12)
        reporteNombre = input("Ingrese el nombre de su reporte: ")

        pdf.cell(200, 10, txt="Reporte", ln=True, align='C')
        header = columnasNombres.split(',')
        for col in header:
            pdf.cell(40, 10, col, border=1)
        pdf.ln()


        for fila in resultados:
            for dato in fila:
                pdf.cell(40, 10, str(dato), border=1)
            pdf.ln()

        pdf.output(f"{reporteNombre}.pdf")
        print("Reporte generado exitosamente.")
        print("Presiona Enter volver al menú de opciones...")
        input()
        
    except mysql.connector.Error as error:
        print("Error al generar reporte:", error)

    finally:
        if conexion.is_connected():
            cursor.close()
            conexion.close()
            print("Conexión cerrada.")