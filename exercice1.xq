<html lang="fr">
  <body>
    <table>
      <thead>
        <tr>
          <th colspan="2">Superficie des maisons</th>
        </tr>
      </thead>
      <tbody>
        <td>Maisons</td><td>Surface (en m2)</td>
        {
          for $m in doc("xquery-fichiers/maisons.xml")/maisons/maison
          order by $m/@id
          return <tr><td>{data($m/@id)}</td><td>{sum($m/*/*/@surface-m2)}</td></tr>
        }
      </tbody>
    </table>
  </body>
</html>
