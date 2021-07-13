-- See the first few entries in the sequence table
SELECT 
	*
FROM
	sequence
LIMIT
	5; 

-- Find the number of new cases for each VOC each week in each region

SELECT 
	region.name,
  voc_case.date,
  voc.name_design,
  voc_case.total - LAG(voc_case.total, 1, voc_case.total) OVER (
  	PARTITION BY voc_case.region, voc_case.voc
    ORDER BY voc_case.date
  ) case_change
FROM
	voc
JOIN
	voc_case
ON
	voc.id = voc_case.voc
JOIN
	region
ON
	voc_case.region = region.id;
	
-- Find the number of new sequences generated (qc pass and fail) for each region 
-- over a 4-week period (most recent values shown first)

SELECT
	region.name,
	sequence.date,
	sequence.qc_fail - LAG(sequence.qc_fail, 4, sequence.qc_fail) OVER (
	PARTITION BY sequence.region
	ORDER BY sequence.date
	) sequence_qc_fail_change,
	sequence.qc_pass - LAG(sequence.qc_pass, 4, sequence.qc_pass) OVER (
	PARTITION BY sequence.region
	ORDER BY sequence.date
	) sequence_qc_pass_change
FROM 
	sequence
JOIN 
	region
ON
	sequence.region = region.id
ORDER BY sequence.date DESC;

-- Find the most recent data for delta variant cases

SELECT 
	region.name,
	voc_case.total,
	voc_case.date
FROM
	voc
JOIN
	voc_case
ON
	voc.id = voc_case.voc
JOIN
	region
ON
	voc_case.region = region.id
WHERE voc_case.date = (SELECT MAX(voc_case.date) FROM voc_case) AND voc.name_design = 'Delta';

