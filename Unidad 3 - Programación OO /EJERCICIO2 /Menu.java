package ejercicio2;
import java.util.Scanner;
        
        
public class Menu {
    private int opcion;
    private final GestorFrecuente g;
    
    public Menu(GestorFrecuente g){
        this.opcion = 7;
        this.g = g;
    }
    
    public void mostrarMenu(){
        Scanner scanner = new Scanner(System.in);
        
        do{
            System.out.println("------- M E N U   D E   O P C I O N E S -----------");
            System.out.println("1. Cargar viajero.");
            System.out.println("2. Dado un numero de viajero, mostrar los datos.");
            System.out.println("3. Dado el dni de un viajero, mostrar la cantidad de millas.");
            System.out.println("4. Dado el dni de un viajero y una cantidad de millas, acumular las millas");
            System.out.println("5. Dado el dni de un viajero y una cantidad de millas, decrementar las millas.");
            System.out.println("6. Mostrar los datos del viajero con la cantidad maxima de millas.");
            System.out.println("7. Salir del menu de opciones.");
            System.out.print("> ");
            
            this.opcion = scanner.nextInt();
            scanner.nextLine();
            switch (opcion){
                case 1 -> {
                    System.out.println("Ingrese numero viajero:");
                    int num = scanner.nextInt();
                    scanner.nextLine();

                    System.out.println("Ingrese numero DNI:");
                    String dni = scanner.nextLine();

                    System.out.println("Ingrese nombre:");
                    String nom = scanner.nextLine();

                    System.out.println("Ingrese apellido:");
                    String ape = scanner.nextLine();
                    
                    System.out.println("Ingrese la cantidad de millas:");
                    int millas = scanner.nextInt();
                    scanner.nextLine();
                    
                    Frecuente nuevo = new Frecuente(num, dni, nom, ape, millas);
                    
                    g.cargarViajero(nuevo);
                }
                case 2 -> {
                    System.out.println("Ingrese numero viajero:");
                    int num = scanner.nextInt();
                    scanner.nextLine();
                    
                    g.buscarPorNum(num);              
                }
                case 3 -> {
                    System.out.println("Ingrese numero DNI:");
                    String dni = scanner.nextLine();
                    
                    int r = g.cantMillas(dni);
                    
                    if(r != -1){
                        System.out.println(r);
                    } else {
                        System.out.println("NO HAY PASAJERO CON ESE DNI");
                    }
                }
                case 4 -> {
                    System.out.println("Ingrese numero DNI: ");
                    String dni = scanner.nextLine();
                    
                    System.out.println("Ingrese la cantidad de millas:");
                    int millas = scanner.nextInt();
                    scanner.nextLine();
                    
                    String r = g.incrementarMillas(dni, millas);
                    
                    System.out.println(r);    
                }
                case 5 -> {
                    System.out.println("Ingrese numero DNI: ");
                    String dni = scanner.nextLine();
                    
                    System.out.println("Ingrese la cantidad de millas: ");
                    int millas = scanner.nextInt();
                    scanner.nextLine();
                    
                    String r = g.decrementarMillas(dni, millas);
                    
                    System.out.println(r);   
                }
                case 6 -> {
                    g.mostrarViajeroMMax();
                }
                case 7 -> {
                    System.out.println("Saliendo del menu...");
                }
                default -> {
                    System.out.println("Opcion invalida.");
                }       
            }
        } while (opcion != 7);
    } 
}
