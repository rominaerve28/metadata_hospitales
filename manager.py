import tasks

def show_menu():
    print("\nMenú Mysql")
    print("1. Agregar usuario")
    print("2. Modificar usuario")
    print("3. Eliminar usuario")
    print("4. Agregar rol")
    print("5. Asignar un rol a un usuario")
    print("6. Consultar usuarios")
    print("7. Consultar roles")
    print("8. Respaldar base de datos")
    print("9. Restaurar base de datos")
    print("10. Crear reporte")
    print("11. Generación procedimientos almacenados")
    print("12. Salir")

def main():
    while True:
        show_menu()
        choice = input("Selecciona una opción: ")

        if choice == '1':
            print("1")
        elif choice == '2':
            print("2")
        elif choice == '3':
            print("3")
        elif choice == '4':
            print("4")            
        elif choice == '5':
            print("5")
        elif choice == '6':
            print("6")
        elif choice == '7':
            print("7")
        elif choice == '8':
            print("8")
        elif choice == '9':
            print("9")
        elif choice == '10':
            print("10")
        elif choice == '11':
            print("11")            
        elif choice == '12':
            print("Saliendo del Gestor de Tareas.")
            break
        else:
            print("Opción inválida. Intente nuevamente.")

if __name__ == "__main__":
    main()
