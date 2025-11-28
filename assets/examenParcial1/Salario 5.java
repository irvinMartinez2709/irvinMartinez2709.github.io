import javax.swing.JOptionPane;

public class Salario {
    public static void main(String [] args) {

        double salarioBruto, impuesto, salarioNeto;
        int tiempoExtra, cantidad;

        cantidad = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese la cantidad de veces que ejecutará el programa: "));

        for (int i = 1; i <= cantidad; i++) {
            int horas = Integer.parseInt(JOptionPane.showInputDialog(null, "Ingrese las horas semanales trabajadas."));
            double tasa = Double.parseDouble(JOptionPane.showInputDialog(null, "Ingrese la tasa."));

            if (horas <= 40) {
                salarioBruto = horas * tasa;
            } else {
                tiempoExtra = horas - 40;
                salarioBruto = (40 * tasa) + (tiempoExtra * tasa * 1.5);
            }

            if (salarioBruto <= 750) {
                impuesto = 0;
            } else {
                impuesto = salarioBruto * 0.10;
            }

            salarioNeto = salarioBruto - impuesto;

            JOptionPane.showMessageDialog(null, String.format("Salario bruto: %.2f B/.\nSalario neto: %.2f B/.", salarioBruto, impuesto, salarioNeto));

        }
    }
}
