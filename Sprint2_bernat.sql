# Nivell 1
# Exercici 1
select *
from transaction
where company_id in (
	select id
	from company 
    where country = 'Germany');

# Exercici 2
select company_name
from company
where id in (
	select company_id
    from transaction
    where amount > (
		select avg(amount)
        from transaction))
;

# Exercici 3
select*
from transaction
where company_id in (
	select id
	from company
	where company_name like '%C%');

# Exercici 4
select company_name
from company
where id = (
	select company_id
	from transaction
    where company_id = (
		select company_id
		from transaction
		where amount is null)
        )
;
select company_id
from transaction
where user_id is null;

# Nivell 2

#Exercici 1
select *
from transaction
where company_id in (
	select id
	from company
	where country = (
		select country
		from company
		where company_name = 'Non Institute')
		);

  
#Exercici 2
select company_name
from company
where id  in (
	select company_id
    from transaction
    where amount = (
		select max(amount)
		from transaction)
        );


# Nivell 3

#Exercici 1
select company_name
from company
where id  in (
	select company_id
    from transaction
    where amount > (
		select avg(amount)
		from transaction)
        );

#Exercici 2

	select if (nom < 4, "-4", "+4")
	from (
		select count(id)
		from transaction
		group by company_id
		) as nom
 ;
