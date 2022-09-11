SELECT klient_id,
       banka_id,
       SUM(broj_smetki_sopstvenik) AS broj_smetki_sopstvenik,
       SUM(broj_smetki_ovlasteni_lica) AS broj_smetki_ovlasteni_lica,
       SUM(broj_transakcii_prvo_tromesecje) AS broj_transakcii_prvo_tromesecje
FROM
(
    -- broj smetki vo bankata za koi klientot e sopstvenik
    SELECT -- s.smetka_br,
        k.klient_id,
        b.banka_id,
        COUNT(*) AS broj_smetki_sopstvenik,
        0 AS broj_smetki_ovlasteni_lica,
        (
            SELECT COUNT(*)
            FROM dbo.transakcii t1
                JOIN dbo.smetki s1
                    ON s1.smetka_br = t1.smetka_br
            WHERE s1.klient_id = k.klient_id
                  AND s1.banka_id = b.banka_id
                  AND MONTH(t1.datum) IN ( 1, 2, 3, 4 ) -- 1-vo tromesecje bilo koja godina
        ) AS broj_transakcii_prvo_tromesecje
    FROM dbo.smetki s
        JOIN dbo.klienti k
            ON k.klient_id = s.klient_id
        JOIN dbo.banki b
            ON b.banka_id = s.banka_id
    GROUP BY k.klient_id,
             b.banka_id
    UNION
    -- broj smetki vo bankata za koi klientot e edno od ovlastenite lice
    SELECT -- s.smetka_br,
        k.klient_id,
        b.banka_id,
        0 AS broj_smetki_sopstvenik,
        COUNT(*) AS broj_smetki_ovlasteni_lica,
        (
            SELECT COUNT(*)
            FROM dbo.transakcii t1
                JOIN dbo.ovlasteni_lica ol1
                    ON ol1.smetka_br = t1.smetka_br
                JOIN dbo.smetki s1
                    ON s1.smetka_br = ol1.smetka_br
            WHERE ol1.klient_id = k.klient_id
                  AND s1.banka_id = b.banka_id
                  AND MONTH(t1.datum) IN ( 1, 2, 3, 4 ) -- 1-vo tromesecje bilo koja godina
        ) AS broj_transakcii_prvo_tromesecje
    FROM dbo.ovlasteni_lica os
        JOIN dbo.smetki s
            ON s.smetka_br = os.smetka_br
        JOIN dbo.banki b
            ON b.banka_id = s.banka_id
        JOIN dbo.klienti k
            ON k.klient_id = os.klient_id
    GROUP BY k.klient_id,
             b.banka_id
) t
--WHERE klient_id = 5
GROUP BY klient_id,
         banka_id
ORDER BY klient_id;
