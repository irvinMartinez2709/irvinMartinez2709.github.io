import javax.swing.JOptionPane;

public class Edad {
    public static void main(String [] args) {

        int cantidad, diaNacido, mesNacido, anioNacido, diaActual, mesActual, anioActual, edadDia, edadMes, edadAnio;

        cantidad = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese la cantidad de veces que ejecutará el programa: "));

        for (int i = 1; i <= cantidad; i++){
            diaNacido = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el día de nacimiento:"));
            mesNacido = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el mes:"));
            anioNacido = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el año:"));

            diaActual = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el día actual:"));
            mesActual = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el mes actual (1-12):"));
            anioActual = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese el año actual:"));

            edadAnio = anioActual - anioNacido;
            edadMes = mesActual - mesNacido;
            edadDia = diaActual - diaNacido;

            if (edadDia < 0) {
                edadDia += 30;
                edadMes -= 1;
            }

            if (edadMes < 0) {
                edadMes += 12;
                edadAnio -= 1;
            }

            if (edadAnio < 1) {
                JOptionPane.showMessageDialog(null, "Edad: " + edadMes + " meses y " + edadDia + " días.");
            } else {
                JOptionPane.showMessageDialog(null, "Edad: " + edadAnio + " años.");
            }
        }

    }
}
