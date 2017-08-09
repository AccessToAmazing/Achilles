-- 102	Number of persons by gender by age, with age at first observation period

--HINT DISTRIBUTE_ON_KEY(analysis_id)
select 102 as analysis_id,  CAST(p1.gender_concept_id AS VARCHAR(255)) as stratum_1, 
CAST(year(op1.index_date) - p1.YEAR_OF_BIRTH AS VARCHAR(255)) as stratum_2, 
null as stratum_3, null as stratum_4, null as stratum_5,
COUNT_BIG(p1.person_id) as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_102
from @cdmDatabaseSchema.PERSON p1
	inner join (select person_id, MIN(observation_period_start_date) as index_date from @cdmDatabaseSchema.OBSERVATION_PERIOD group by PERSON_ID) op1
	on p1.PERSON_ID = op1.PERSON_ID
group by p1.gender_concept_id, year(op1.index_date) - p1.YEAR_OF_BIRTH;
