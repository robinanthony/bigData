<PRICE>
{
  sum(
    for $plant in doc("xquery-fichiers/plant_order.xml")/ORDER/PLANT
      return number($plant/QUANTITY) * number(substring(doc("xquery-fichiers/plant_catalog.xml")/CATALOG/PLANT[COMMON=$plant/COMMON]/PRICE, 2))
    )
}
</PRICE>
