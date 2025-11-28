import javax.swing.JOptionPane;

public class ConversorTemperatura {
    public static void main(String[] args) {

        int cantidad = 0, seleccion = 0;
        double farenheit = 0, celsius = 0, temperatura = 0;
        String input = "";

        // Pedir la cantidad de repeticiones
        while (true) {
            input = JOptionPane.showInputDialog(null,"CONVERSOR CELSIUS - FARENHEIT \n\nIngrese la cantidad de veces que desea \nejecutar el programa.");
            if (input == null) {
                JOptionPane.showMessageDialog(null, "Programa cancelado. Adiós ✌️");
                return; // sale del programa
            }
            try {
                cantidad = Integer.parseInt(input);
                if (cantidad > 0) break;
                JOptionPane.showMessageDialog(null, "Ingrese un valor positivo.");
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Ingrese un valor válido.");
            }
        }

        // Elegir tipo de conversión
        while (true) {
            input = JOptionPane.showInputDialog(null,"CONVERSOR CELSIUS - FARENHEIT \n\nIngrese el método de conversión \n\n1. Grados Celsius a Fahrenheit \n2. Grados Fahrenheit a Celsius");
            if (input == null) {
                JOptionPane.showMessageDialog(null, "Programa cancelado. Adiós ✌️");
                return;
            }
            try {
                seleccion = Integer.parseInt(input);
                if (seleccion == 1 || seleccion == 2)
                    break;
                JOptionPane.showMessageDialog(null, "Ingrese una opción válida (1-2).");
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(null, "Ingrese un valor válido.");
            }
        }

        for (int i = 1; i <= cantidad; i++) {
            switch (seleccion) {
                case 1: // Celsius a Fahrenheit
                    input = JOptionPane.showInputDialog(null,"CONVERSOR CELSIUS - FARENHEIT \n\nIngrese la temperatura en Celsius:");
                    if (input == null) {
                        JOptionPane.showMessageDialog(null, "Programa cancelado. Adiós ✌️");
                        return;
                    }
                    try {
                        temperatura = Double.parseDouble(input);
                        farenheit = ((9.0 / 5.0) * temperatura) + 32;
                        JOptionPane.showMessageDialog(null, String.format("Grados Celsius: %.2f °C\nGrados Fahrenheit: %.2f °F", temperatura, farenheit));
                    } catch (NumberFormatException e) {
                        JOptionPane.showMessageDialog(null, "Ingrese un valor válido.");
                        i--;
                    }
                    break;

                case 2: // Fahrenheit a Celsius
                    input = JOptionPane.showInputDialog(null,
                            "CONVERSOR CELSIUS - FARENHEIT \n\nIngrese la temperatura en Fahrenheit:");
                    if (input == null) {
                        JOptionPane.showMessageDialog(null, "Programa cancelado. Adiós ✌️");
                        return;
                    }
                    try {
                        temperatura = Double.parseDouble(input);
                        celsius = (temperatura - 32) * (5.0 / 9.0);
                        JOptionPane.showMessageDialog(null, String.format("Grados Fahrenheit: %.2f °F\nGrados Celsius: %.2f °C", temperatura, celsius));
                    } catch (NumberFormatException e) {
                        JOptionPane.showMessageDialog(null, "Ingrese un valor válido.");
                        i--;
                    }
                    break;
            }

            if (i == cantidad) {
                JOptionPane.showMessageDialog(null, "Programa terminado. \nAdiós. ✌️");
            }
        }
    }
}
