%include 'in_out.asm' ; подключение внешнего файла
SECTION .data ; секция инициированных данных
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss ; секция не инициированных данных
x: RESB 80 ; Переменная, значение которой будем вводить с клавиатуры, выделенный размер - 80 байт
SECTION .text ; Код программы
GLOBAL _start ; Начало программы
_start: ; Точка входа в программу
mov eax, msg ; запись адреса выводимого сообщения в eax
call sprint ; вызов подпрограммы печати сообщения
mov ecx, x ; запись адреса переменной в ecx
mov edx, 80 ; запись длины вводимого значения в edx
call sread ; вызов подпрограммы ввода сообщения
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, eax = x
mov ebx, eax ; сохраним x в ebx
mul ebx ; eax = x * x
mov ecx, eax ; сохраняем x^2 в ecx
mul ebx ; eax = x * x^2 = x^3
mov ebx, 3
div ebx ; eax = x^3 / 3
add eax, 21 ; eax = x^3 / 3 + 21
mov edi, eax ; сохраняем результат в edi
mov eax, rem ; вывод сообщения "Результат: "
call sprint
mov eax, edi 
call iprintLF 
call quit 
