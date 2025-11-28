import javax.swing.JOptionPane;

public class AnioBisiesto {
    public static void main(String [] args) {

        int anio, cantidad;
        boolean bisiesto;

        cantidad = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese la cantidad de veces que ejecutará el programa: "));

        for (int i = 1; i <= cantidad; i++){
            anio = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese un año:"));

            if (anio %4 == 0) {
                if (anio %100 == 0) {
                    if (anio %400 == 0) {
                        bisiesto = true;
                    } else {
                        bisiesto = false;
                    }
                } else {
                    bisiesto = true;
                }
            } else {
                bisiesto = false;
            }

            if (bisiesto) {
                JOptionPane.showMessageDialog(null, anio + " es bisiesto");
            } else {
                JOptionPane.showMessageDialog(null, anio + " no es bisiesto");
            }
        }

    }
}
