-- 805	Number of observation occurrence records, by observation_concept_id by observation_type_concept_id

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 805 as analysis_id, 
	CAST(o1.observation_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
	CAST(o1.observation_type_concept_id AS VARCHAR(255)) as stratum_2,
	null as stratum_3, null as stratum_4, null as stratum_5,
	COUNT_BIG(o1.PERSON_ID) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_805
from
	@cdmDatabaseSchema.observation o1
group by o1.observation_CONCEPT_ID,	
	o1.observation_type_concept_id
;
