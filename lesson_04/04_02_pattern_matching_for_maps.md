# Pattern matching for maps

Есть некоторые нюансы при работе с map. (Есть нюансы не только с map, но с ними редко приходится сталкиваться, а с map часто).

В шаблоне не нужно перечислять все ключи, какие есть в map. Мы указываем только те ключи, которые нам нужны.

```
iex(4)> my_map = %{a: 1, b: 2, c: 3}
%{a: 1, b: 2, c: 3}
iex(5)> %{a: value} = my_map
%{a: 1, b: 2, c: 3}
iex(6)> value
1
```

Если ключи не являются атомами, то синтаксис отличается.
```
iex(7)> my_map = %{"a" => 1, "b" => 2, "c" => 3}
%{"a" => 1, "b" => 2, "c" => 3}
iex(8)> %{"a" => value1} = my_map
%{"a" => 1, "b" => 2, "c" => 3}
iex(9)> %{"a" => value1, "b" => value2} = my_map
%{"a" => 1, "b" => 2, "c" => 3}
iex(10)> value1
1
iex(11)> value2
2
```

Шаблон **%{}** совпадает с любой map. Это может быть контринтуитивно, кто-то может ожидать, что этот шаблон совпадает только с пустой map. По сути, такой шаблон проверяет, что значение является map, а не каким-то другим типом.

```
iex(13)> %{} = my_map
%{"a" => 1, "b" => 2, "c" => 3}
```

Переменные можно использовать для извлечения значений, но не для ключей:
```
iex(15)> %{"c" => my_var} = my_map
%{"a" => 1, "b" => 2, "c" => 3}
iex(16)> my_var
3
iex(17)> %{my_var => 1} = my_map
** (CompileError) iex:17: cannot use variable my_var as map key inside a pattern.
```

А pin operator можно использовать и для ключа, и для значения:
```
iex(18)> value1
1
iex(19)> %{"a" => ^value1} = my_map
%{"a" => 1, "b" => 2, "c" => 3}
iex(20)> keyb = "b"
"b"
iex(21)> %{^keyb => _} = my_map
%{"a" => 1, "b" => 2, "c" => 3
```
