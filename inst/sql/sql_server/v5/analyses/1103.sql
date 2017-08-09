-- 1103	Number of care sites by location state

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 1103 as analysis_id,  
	CAST(l1.state AS VARCHAR(255)) as stratum_1, 
	null as stratum_2, null as stratum_3, null as stratum_4, null as stratum_5,
	COUNT_BIG(distinct care_site_id) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_1103
from @cdmDatabaseSchema.care_site cs1
	inner join @cdmDatabaseSchema.LOCATION l1
	on cs1.location_id = l1.location_id
where cs1.location_id is not null
	and l1.state is not null
group by l1.state;
