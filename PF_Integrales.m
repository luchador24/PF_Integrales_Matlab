clear all
clc
disp("------------------ Menú ------------------")
disp("1. Método Fracciones Parciales")
disp("2. Integrales Impropias (Convergen o Divergen)")
disp("3. Área de una función con Intervalos")
disp("4. Área Acotada por dos funciones")
disp("5. Volúmenes de sólidos")
disp("6. Área de una superficie en revolución")
disp("7. Valor Promedio de una Función")
disp("8. Salir")
disp(" ")
h=input("Ingrese el número de la opción que desea realizar: ");
while h>8
    clc
clear
disp("------------------ Menú ------------------")
disp("1. Método Fracciones Parciales")
disp("2. Integrales Impropias (Convergen o Divergen)")
disp("3. Área de una función con Intervalos")
disp("4. Área Acotada por dos funciones")
disp("5. Volúmenes de sólidos")
disp("6. Área de una superficie en revolución")
disp("7. Valor Promedio de una Función")
disp("8. Salir")
disp(" ")
disp("**Debe de seleccionar una opción válida**")
h=input("Ingrese el número de la opción que desea realizar: ");
end

switch h
    case (1)
        disp("------Método Fracciones Parciales------")
        syms x
        nu=input("INGRESE EL NUMERADOR:");
        de=input("INGRESE EL DENOMINADOR:");
        disp("DENOMINADORES PARA A Y B")
        syms A B
        c=factor(de)
        disp("GUARDAR CADA UNO DE LOS RESULTADOS")
        d=input("INGRESE EL PRIMER RESULTADO:")
        e=input("INGRESE EL SEGUNDO RESULTADO:")
        fp=[(d*e*A)/d]+[(d*e*B)/e]
        ec=[1,1];
        ind=input("GUARDAR los dos terminos numericos:")
        g=[ec;ind]
        vn=input("INGRESE el valor numerico de el numerador:")
        h=[0;vn]
        i=inv(g)
        disp("RESULTADOS DE A Y B")
        j=i*h
        a=input("GUARDAR EL VALOR DE A:")
        b=input("GUARDAR EL VALOR DE B:")
        comp=[a*(d)+b*(e)]/[d*e]

    case (2)
        disp("------Integrales Impropias (Convergen o Divergen)------")
        syms x
        %SOLICITAR DATOS%
        f=input('ingrese una funcion');
        a=input('ingrese limite inferior')
        b=input('ingrese limite superior')
        %CALCULAR INTEGRAL%
        I= int(f,x,a,b)
        %CONDICION%
        if I==inf
            disp('diverge');
        else 
            disp('converge');
        end
        
    case(3)
        disp("------Área de una función con Intervalos------")
        %Syms define en base a que variable trabaja la funcion%
        syms x;
        %Ingreso de informacion%
        f=input("Ingrese la funcion deseada ( a razon de x):");
        a=input("Ingrese el Limite inferior del intervalo:");
        b=input("Ingrese el imite superior del intervalo:");
        fa=abs(f);
        %Aplicacion de la formula de area%
        disp("El AREA (en unidades cuadradas) ES De:")
        Area=int(fa,a,b)
        %Graficar la funcion%
        %Funcion principal%
        x=linspace(-5,5,500);
        y=input("Ingrese la funcion que desea graficar:");
        plot(x,y)
        grid on
        %Funcion dentro de valor absoluto%
        x1=linspace(-5,5,500);
        y1=y;
        hold on
        %Area de la funcion%
        plot(x1,abs(y1))
        li=input("Ingrese el limite inferior:");
        ls=input("Ingrese el limite superior:");
        x2=linspace(li,ls,500);
        y2=y;
        hold on
        area(x2,abs(y2))
        
    case(4)
        disp("------Área Acotada por dos funciones------")
        %PEDIR DATOS%
        syms x;
        f1 = input('Ingrese la 1ra funcion: ');     % f1 = x^2-2*x     x^2
        f2 = input('Ingrese la 2da funcion: ');     % f2 = -x^2+4*x    x+2
        x= -2:0.01:5;
        fprintf("--- Para graficar inserte nuevamente las funciones ---\n");
        fun1 = input("Ingrese la 1ra funcion: ");
        fun2 = input("Ingrese la 2da funcion: ");

        %INTERSECCIÓN%
        fprintf("La interseccion es: \n")
        inter = solve(f1==f2);
        disp(inter)

        %AREA%
        fn = f2 - f1;
        fprintf("El área es: (en unidades^2) = ")
        area = int(fn,inter(1),inter(2));
        area = (area^2)^0.5;
        disp(area)

        %GRAFICAR%
        plot(x,fun1,"g");
        hold on;
        plot(x,fun2,"r");
        grid on;

    case(5)
        clc
        syms x;
        disp("------Volúmenes de sólidos------")
        %SOLICITAR DATOS%
        f=input("Ingrese la función (a razón de x) a integrar: ")
        Intervalos=solve(f)
        %SOLICITAR LOS INTERVALOS A TRABAJAR%
        b=input("Ingrese el intervalo superior: ")
        a=input("Ingrese el intervalo inferior: ")
        fAlDos=f^2
        %CALCULAR EL VOLUMEN MEDIANTE LA SIGUIENTE FORMULA%
        disp("El vólumen del sólido es de: (en Unidades^3)")
        Volumen=int(fAlDos,x,a,b)*pi
        %SOLICITAR LA FUNCION EN FORMATO ESCALAR PARA PODER GRAFICAR%
        x=a:0.1:b;
        disp("GRÁFICA")
        y=input("Ingrese la función (a razón de x) a integrar (ESCALAR): ");
        cylinder(y);
    
    case(6)
        disp("------Área de una superficie en revolución------")
        syms x;
        syms y;
        val=1;
        eje=input("Cuál es el 'eje' a trabajar? ")
        while(val)
            if eje=="x"
                val=0;
                %SOLICITAR LA FUNCION%
                f=input("Ingrese la función (a razón de x) a integrar: ")
                Intervalos=solve(f)
                %SOLICITAR LOS INTERVALOS A TRABAJAR%
                b=input("Ingrese el intervalo superior: ")
                a=input("Ingrese el intervalo inferior: ")
                %FORMULAS PARA APLICARLAS EN LA FORMULA DEL AREA DE SUPERFICIE EN R%
                derivada=diff(f);
                raiz=sqrt(1+(derivada^2));
                fCompleta=f*raiz;
                %TRABAJAR LA FORMULA Y MOSTRAR DATOS%
                disp("El área de la Superficie en Revolución: (en Unidades^2)")
                AREA=int(fCompleta,x,a,b)*2*pi
                %SOLICITAR LA FUNCION EN FORMATO ESCALAR PARA PODER GRAFICAR%
                x=a:0.1:b;
                disp("GRÁFICA")
                y=input("Ingrese la función (a razón de x) a integrar (ESCALAR): ");
                cylinder(y);
            end
        end

    case(7)
        disp("------Valor Promedio de una Función------")
        a=input('Ingrese el valor de a: ');
        b=input('Ingrese el valor de b: ');
        %Operacion entre a y b
        disp("1/b-a")
        D= 1/(b-a);
        disp(D);
        %Variable simbólica
        syms x
        %Funcion a integrar 
        disp("si hay una potencia escribir un punto antes de la potencia ejemplo x.^3;  y si hay una multiplicación de por ejemplo 2x , entonces escribir 2*x")
        y = input ('Ingrese la funcion a integrar:');
        I=int (y,a,b)
        disp("Fórmula: (1/b-a)*I")
        disp("El valor promedio de la función es: ")
        C= D*I;
        disp(C)
        x = (a:b);
        %En la linea siguiente escribir la funcion bajo las recomendaciones de la
        %linea 14
        y= ((x.^2+(2*x))-1);
        hold on
        plot (x,y,'r')
        plot(C,'k*')
        
    otherwise 
        warning("GRACIAS POR UTILIZAR EL PROGRAMA TeamOne!")
end
      