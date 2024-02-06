# alexs_magic_card_collector_app





Magic Card Collector App

App for tracking collected Magic The Gathering Cards, Written in Flutter, attempt to use BloC Pattern

(optional: make own API with Springboot, holding Magic Card Bulk Data within Database, (download all Imagefiles and link them corresponding in DB)


Current working process:

-Implement Serach Function wich Splitts the input Strings and gives Score for Results
- Making Layout in Flutter
- make Mock with example Data in json Format
- Implement Different Screens

##TODO

- Using Datasets from  https://scryfall.com/docs/api because there is an availabilty to download the bulk data conatining card information instead using remote hosted API
    -bulk Data is 1,9 GB - it would make sense to write an own API (maybe Springboot) which contains bulk data whcih is provided by scryfall - bulk data could be automaticly downloaded once a month
    - bulk data could be stored in an Database instead of an single Json File
    - images are not inside of bulk data, but the corresponding image url present in bulk data, therfore we must test if we should download all images once and store it in database or load images direktly from povided url via App
- Implement Communication with Api via BloC Pattern
- Design Layout for Flutter App

## Planned Features

- Show All Cards as GridView
- Differend Grid Sizes
- Enable Search by Card name or Card ID
- Mark Card as Collected
- Mark Card for Whishlist
- Show all Cards which you Collected
- Enable different filters (Element, Card Type, Rarity ....)

## nice to have

- Creatng User Account which saves all stored information about you Collected Cards
- Message System between registered Users


# maybe this could make this app even better

-ocr reader whchich takes the indentifier in the left bottom cornder and shows the result on moble app (posibillity to add the scanned Card via Dialog)
