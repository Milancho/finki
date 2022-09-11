
SELECT klient_id,
           banka_id, sum (broj_smetki_sopstvenik) AS broj_smetki_sopstvenik,
		   sum (broj_smetki_ovlasteni_lica) AS broj_smetki_ovlasteni_lica
FROM
(
-- broj_smetki_sopstvenik
    SELECT -- s.smetka_br,
           k.klient_id,
           b.banka_id,
		   COUNT(*) AS broj_smetki_sopstvenik,
		   0 AS broj_smetki_ovlasteni_lica
    FROM dbo.smetki s
        JOIN dbo.klienti k
            ON k.klient_id = s.klient_id
        JOIN dbo.banki b
            ON b.banka_id = s.banka_id
			GROUP BY k.klient_id, b.banka_id
    UNION
	-- broj_smetki_ovlasteni_lica
    SELECT -- s.smetka_br,
           k.klient_id,
           b.banka_id,
		      0 AS broj_smetki_sopstvenik,
			  COUNT(*) AS broj_smetki_ovlasteni_lica
    FROM dbo.ovlasteni_lica os
        JOIN dbo.smetki s
            ON s.smetka_br = os.smetka_br
        JOIN dbo.banki b
            ON b.banka_id = s.banka_id
        JOIN dbo.klienti k
            ON k.klient_id = os.klient_id
			GROUP BY k.klient_id, b.banka_id
) t
WHERE klient_id = 5
GROUP BY klient_id, banka_id, broj_smetki_sopstvenik
ORDER BY klient_id


