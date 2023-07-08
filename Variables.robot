*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Library         BuiltIn
Library         Collections
Library         String

*** Variables ***
${name}      Jone Carter
${age}      30
@{fruit}      apple      banana      orange
&{person}      name=John    age=30    city=New York


*** Test Cases ***
#1. Add Values (for string - change)
1.1. for string
      log      ${name}
      set test variable    ${name}      Ilona Kashkan
      log      ${name}
      log      ${age}
      set test variable    ${age}      18
      log      ${age}

1.2. for list
      log      ${fruit}
      append to list    ${fruit}      Mango
      insert into list    ${fruit}     0      Melon
      log to console     ${fruit}

1.3. for dictionary
       ${keys}      get dictionary keys    ${person}
       log to console    ${keys}
       log      ${person}
       set to dictionary    ${person}        name=Ilona    age=35    city=Minsk
       log    ${person}

2. Create variables
     set test variable    @{favorite}       In Search of Lost Time      The Great Gatsby     War and Peace
     log     ${favorite}


