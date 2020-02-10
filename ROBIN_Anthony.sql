drop table if exists TWITTER;

create table if not exists TWITTER (
  user int,
  follower int
);

.separator ' '

.import 'twitter.edgelist' TWITTER

select "nb total de relations friend/follower : ", count(*)
from TWITTER;

select "nb utilisateurs qui ont au moins un follower : ", count(distinct(user))
from TWITTER;

select "nb utilisateurs qui suivent au moins qqn : ", count(distinct(follower))
from TWITTER;

select "nb max de followers par utilisateur : ", max(foo.cpt)
from (
  select count(*) as cpt
  from TWITTER
  group by user
) as foo;

select "-- exemple utilisateur avec nb max de followers : ", foo.user
from (
  select max(foo.cpt), foo.user
  from (
    select count(*) as cpt, user
    from TWITTER
    group by user
  ) as foo
) as foo;

select "nb min de followers par utilisateur : ", min(foo.cpt)
from (
  select count(*) as cpt
  from TWITTER
  group by user
) as foo;

select "-- exemple utilisateur avec nb min de followers : ", foo.user
from (
  select min(foo.cpt), foo.user
  from (
    select count(*) as cpt, user
    from TWITTER
    group by user
  ) as foo
) as foo;
