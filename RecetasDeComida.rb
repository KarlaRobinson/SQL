<?xml version="1.0" encoding="utf-8" ?>
<!-- SQL XML created by WWW SQL Designer, https://github.com/ondras/wwwsqldesigner/ -->
<!-- Active URL: http://ondras.zarovi.cz/sql/demo/ -->
<sql>
<datatypes db="mysql">
  <group label="Numeric" color="rgb(238,238,170)">
    <type label="Integer" length="0" sql="INTEGER" quote=""/>
    <type label="TINYINT" length="0" sql="TINYINT" quote=""/>
    <type label="SMALLINT" length="0" sql="SMALLINT" quote=""/>
    <type label="MEDIUMINT" length="0" sql="MEDIUMINT" quote=""/>
    <type label="INT" length="0" sql="INT" quote=""/>
    <type label="BIGINT" length="0" sql="BIGINT" quote=""/>
    <type label="Decimal" length="1" sql="DECIMAL" re="DEC" quote=""/>
    <type label="Single precision" length="0" sql="FLOAT" quote=""/>
    <type label="Double precision" length="0" sql="DOUBLE" re="DOUBLE" quote=""/>
  </group>

  <group label="Character" color="rgb(255,200,200)">
    <type label="Char" length="1" sql="CHAR" quote="'"/>
    <type label="Varchar" length="1" sql="VARCHAR" quote="'"/>
    <type label="Text" length="0" sql="MEDIUMTEXT" re="TEXT" quote="'"/>
    <type label="Binary" length="1" sql="BINARY" quote="'"/>
    <type label="Varbinary" length="1" sql="VARBINARY" quote="'"/>
    <type label="BLOB" length="0" sql="BLOB" re="BLOB" quote="'"/>
  </group>

  <group label="Date &amp; Time" color="rgb(200,255,200)">
    <type label="Date" length="0" sql="DATE" quote="'"/>
    <type label="Time" length="0" sql="TIME" quote="'"/>
    <type label="Datetime" length="0" sql="DATETIME" quote="'"/>
    <type label="Year" length="0" sql="YEAR" quote=""/>
    <type label="Timestamp" length="0" sql="TIMESTAMP" quote="'"/>
  </group>
  
  <group label="Miscellaneous" color="rgb(200,200,255)">
    <type label="ENUM" length="1" sql="ENUM" quote=""/>
    <type label="SET" length="1" sql="SET" quote=""/>
    <type label="Bit" length="0" sql="bit" quote=""/>
  </group>
</datatypes><table x="397" y="95" name="Meals">
<row name="id_meal" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<row name="id_chefs" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Chefs" row="id_chefs" />
</row>
<key type="PRIMARY" name="">
<part>id_meal</part>
</key>
</table>
<table x="642" y="200" name="Chefs">
<row name="id_chefs" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_chefs</part>
</key>
</table>
<table x="30" y="14" name="Ingredients">
<row name="id_ingredients" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<row name="quantity" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_measurement" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Measurement" row="id_measurement" />
</row>
<key type="PRIMARY" name="">
<part>id_ingredients</part>
</key>
</table>
<table x="32" y="165" name="Measurement">
<row name="id_measurement" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_measurement</part>
</key>
</table>
<table x="668" y="3" name="Menu">
<row name="id_menu" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_menu</part>
</key>
</table>
<table x="201" y="17" name="Meal_Ingredients">
<row name="meal_ingredients" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_meal" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<row name="id_ingredients" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Ingredients" row="id_ingredients" />
</row>
<key type="PRIMARY" name="">
<part>meal_ingredients</part>
</key>
</table>
<table x="508" y="21" name="Menu_Meals">
<row name="id_menu_meals" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_menu" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Menu" row="id_menu" />
</row>
<row name="id_meals" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<key type="PRIMARY" name="">
<part>id_menu_meals</part>
</key>
</table>
<table x="376" y="311" name="Category">
<row name="id_category" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="name" null="1" autoincrement="0">
<datatype>MEDIUMTEXT</datatype>
<default>NULL</default></row>
<key type="PRIMARY" name="">
<part>id_category</part>
</key>
</table>
<table x="374" y="202" name="Meal_Category">
<row name="id_meal_category" null="1" autoincrement="1">
<datatype>INTEGER</datatype>
<default>NULL</default></row>
<row name="id_meal" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Meals" row="id_meal" />
</row>
<row name="id_category" null="1" autoincrement="0">
<datatype>INTEGER</datatype>
<default>NULL</default><relation table="Category" row="id_category" />
</row>
<key type="PRIMARY" name="">
<part>id_meal_category</part>
</key>
</table>
</sql>
