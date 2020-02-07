<CATALOG>
{
  for $plant in doc("xquery-fichiers/plant_catalog.xml")/CATALOG/PLANT
  return <PLANT>
        {
          for $propertie in $plant/*
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
</CATALOG>
