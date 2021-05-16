SELECT pls14.stabr,
       sum(pls14.gpterms) AS internet_2014,
       sum(pls09.gpterms) AS internet_2009,
	   sum(pls14.pitusr) AS uses_2014,
	   sum(pls09.pitusr) AS uses_2009,
       round( (CAST(sum(pls14.gpterms) AS decimal(10,1)) - sum(pls09.gpterms)) /
                    sum(pls09.gpterms) * 100, 2 ) AS internet_pct_change,
       round( (CAST(sum(pls14.pitusr) AS decimal(10,1)) - sum(pls09.pitusr)) /
                    sum(pls09.pitusr) * 100, 2 ) AS uses_pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.gpterms >= 0 AND pls09.gpterms >= 0 AND pls14.pitusr >= 0 AND pls09.pitusr >= 0
GROUP BY pls14.stabr
ORDER BY internet_pct_change DESC, uses_pct_change DESC;