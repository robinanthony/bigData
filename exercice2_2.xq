<CATALOG>
{
  for $light in distinct-values(doc("xquery-fichiers/plant_catalog.xml")/CATALOG/PLANT/LIGHT)
  order by $light
  return <LIGHT>
          <EXPOSURE>
          {
            $light
          }
          </EXPOSURE>
          {
            for $plant in doc("xquery-fichiers/plant_catalog.xml")/CATALOG/PLANT[LIGHT=$light]
            return <PLANT>
                  {
                    for $propertie in $plant/*[.!=$light]
                    return $propertie
                  }
                  </PLANT>
          }
        </LIGHT>
}
</CATALOG>
