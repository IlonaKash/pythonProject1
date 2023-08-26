*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${name}      Jone Carter
${age}      30
@{fruits}        apple    banana
&{person}      name=John    age=30    city=New York
@{my_fruit}    melon   pear   orange   mango   lemon    ananasik   watermelon

#1 - написать тест в котором в любую из этих переменных будет добавляться миним 5 значение по одному в каждой итерации циклом  FOR
#2 - написать тест в котором в цикле WHILE будет создаваться алфавит(English) до буквы P включительно
#3 - написать тест в котором из переменной @{fruits}(предварительно увеличить количество значений до 10) будут в отдельный список сохраняться только те фрукты которые имеют букву "е"
*** Test Cases ***
1.0. Test

       @{age1}  Create List
      FOR      ${i}    IN RANGE     1   6
           Append To List    ${age1}    ${i}
           log to console    ${i}
      END

1.1. Test
        FOR  ${index}  ${item}   IN  INUMERATE @{my_fruit}
           exit for loop if  '${index}'=='5'
           append to list  ${fruits}  ${item}
           log to console  ${item}
        END


1.2. Test
       FOR  ${index}  ${item}   IN ENUMERATE  @{my_fruit}
           IF ${index} != 5
           append to list  ${fruits}  ${item}
          END
        log to console  ${item}
        END
1.3. Test
    ${index}    Set Variable    0   # Инициализируем индекс для цикла WHILE
    ${max_index}    Set Variable    4   # Устанавливаем максимальный индекс, который нам нужен (4, так как индексация начинается с 0)

    WHILE    ${index} < ${max_index}
        ${item}    Get From List    ${my_fruit}    ${index}   # Получаем элемент с индексом ${index} из списка ${my_fruit}
        Append To List    ${fruits}    ${item}   # Добавляем элемент ${item} в список ${fruits}
        ${index}    Evaluate    ${index} + 1   # Увеличиваем индекс на 1 для перехода к следующему элементу
    END

    Log To Console    ${fruits}

#2. Test (in range)
    [Documentation]      Lesson 4 Loops
    [Tags]      smoke loop goodle
 #     FOR       ${item}    IN RANGE     0    1
 #          log to console   ${fruits}[${item}]
 #     END
3. IN ENUMERATE
    FOR     ${index}    ${item}    IN ENUMERATE    @{fruits}
        exit for loop if    '${index}'=='1'
        log to console    ${item}
    END

4. Add at least 5 values one by one in each iteration by the FOR LOOP
    FOR     ${item}     IN    @{fruits}
    
    set test variable
