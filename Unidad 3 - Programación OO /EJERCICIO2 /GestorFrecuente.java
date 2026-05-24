package ejercicio2;

import java.util.ArrayList;
import java.util.List;

public class GestorFrecuente {
    private final List<Frecuente> viajeros;


    public GestorFrecuente() {

        viajeros = new ArrayList<>();
    }
    
    
    // a) Cargar viajero: registrar un nuevo viajero.
    public void cargarViajero(Frecuente viajero){
        viajeros.add (viajero);
    }
    
    
    // b) Mostrar viajero: dado el número de un viajero mostrar todos sus datos (use el
    //método toString). 
    public void buscarPorNum (int numero){
        int indice = 0;
        int bandera = 0;
        int p = 0;
        
        while (indice < viajeros.size() && bandera == 0){
            if (viajeros.get(indice).getNumero() == numero){
                bandera = 1;
                p = indice;
            } else {
                indice += 1;
            }
        }
        
        if (bandera == 1){
            System.out.print(viajeros.get(p).toString());
        } else {
            System.out.println("---X-X- NO HAY PASAJERO CON ESE NUMERO -X-X---");
        }
    }
    
    
    //c) Consultar Cantidad de Millas: se ingresa un dni y si corresponde a un viajero
    //registrado, retorna la cantidad de millas del viajero
    public int buscarPorDNI (String dni){
        int indice = 0;
        int bandera = 0;
        int p = -1;
        while (indice < viajeros.size() && bandera == 0){
            if (dni.equals(viajeros.get(indice).getDni())){
                bandera = 1;
                p = indice;
            } else {
                indice += 1;
            }
        }
        return p;    
    }
        

    public int cantMillas (String dni){
        int pos = buscarPorDNI(dni);
        int resultado;
            if (pos != -1){
                resultado = viajeros.get(pos).getMillas();
            } else {
                resultado = -1;
            }
            
            return resultado;
        }
        
    //d) Acumular Millas: se ingresa un dni y cantidad de millas, si corresponde a un
    //viajero registrado se incrementa las millas acumuladas del viajero en la
    //cantidad de millas dadas. 
    
    public String incrementarMillas (String dni, int MMillas){
        int indice = 0;
        int bandera = 0;
        int p = -1;
        while (indice < viajeros.size() && bandera == 0){
            if (dni.equals(viajeros.get(indice).getDni())){
                bandera = 1;
                int sm = viajeros.get(indice).acumularMillas(MMillas);
                viajeros.get(indice).setMillas(sm);
                p = indice;
            } else {
                indice += 1;
            }
        }
        return viajeros.get(p).toString();
    }
    
    //e) Canjear Millas: se ingresa un dni y cantidad de millas, si corresponde a un
    //viajero registrado se decrementa las millas acumuladas del viajero en la
    //cantidad de millas dadas. 
    
    public String decrementarMillas (String dni, int MMillas){
        int indice = 0;
        int bandera = 0;
        int p = -1;
        while (indice < viajeros.size() && bandera == 0){
            if (dni.equals(viajeros.get(indice).getDni())){
                bandera = 1;
                int sm = viajeros.get(indice).canjearMillas(MMillas);
                viajeros.get(indice).setMillas(sm);
                p = indice;
            } else {
                indice += 1;
            }
        }
        return viajeros.get(p).toString();
    }
    
    //f) Mejor viajero: Mostrar los datos del/ los viajeros con mayor cantidad de millas
    public void mostrarViajeroMMax(){
        int max = -99;
        
        for (int i = 0; i < viajeros.size(); i ++){
            if (viajeros.get(i).getMillas() > max){
                max = viajeros.get(i).getMillas();
            }
        }
        
        for (int i = 0; i < viajeros.size(); i ++){
            if (viajeros.get(i).getMillas() == max){
                System.out.print(viajeros.get(i).toString());
            }
        }
    }  
}
