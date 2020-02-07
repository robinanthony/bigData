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
            order by $plant/COMMON
            return <PLANT>
                  {
                    for $propertie in $plant/*[.!=$light]
                    return $propertie
                  }
                  <FAMILY>
                  {
                    for $family in doc("xquery-fichiers/plant_families.xml")/CLASSIFICATION/FAMILY[SPECIES=$plant/BOTANICAL]
                    return data($family/NAME)
                  }
                  </FAMILY>
                  </PLANT>
          }
        </LIGHT>
}
</CATALOG>
