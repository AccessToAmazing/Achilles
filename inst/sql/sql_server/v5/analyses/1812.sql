-- 1812	Number of measurement records with invalid provider_id

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 1812 as analysis_id,  
	null as stratum_1, null as stratum_2, null as stratum_3, null as stratum_4, null as stratum_5,
	COUNT_BIG(m.PERSON_ID) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_1812
from @cdmDatabaseSchema.measurement m
	left join @cdmDatabaseSchema.provider p on p.provider_id = m.provider_id
where m.provider_id is not null
	and p.provider_id is null
;
