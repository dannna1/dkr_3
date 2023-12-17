function F(x: Real): Real;
begin
  F := 1*x*x*x + (-2)*x*x + 3*x + 0;
end;
function Simpson(a, b: Real; n: Integer): Real;
var
  h, x, S1, S2: Real;
  i: Integer;
begin
  h := (b - a) / n;
  S1 := F(a) + F(b);
  S2 := 0;
  for i := 1 to n-1 do
  begin
    x := a + i*h;
    if i mod 2 = 0 then
      S2 := S2 + 2*F(x)
    else
      S2 := S2 + 4*F(x);
  end;
  Simpson:= (h/3)*(S1 + S2);
end;

procedure Menu();
var
  a, b: Real;
  n: Integer;
  result, error: Real;
  c: Integer;
begin
  repeat
    writeln('1. Вычислить площадь фигуры');
    writeln('2. Выход');
    write('Выберите действие: ');
    readln(c);
    case c of
      1:
      begin
        write('Введите нижний предел интегрирования: ');
        readln(a);
        write('Введите верхний предел интегрирования: ');
        readln(b);
        write('Введите количество разбиений: ');
        readln(n);
        result := Simpson(a, b, n);
        writeln('Площадь фигуры: ', result:0:4);
        // вычисление погрешности
        error := abs((b - a)*(b - a)*(b - a)*(1/180)*4); // формула погрешности для метода Симпсона
        writeln('Погрешность: ', error:0:8);
      end;
      2: writeln('Выход');
    else
      writeln('Некорректный выбор');
    end;
  until c = 2;
end;

begin
  Menu();
end.