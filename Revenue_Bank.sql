IF OBJECT_ID('tbl_raw_pnl_2023', 'U') IS NOT NULL
BEGIN
    DROP TABLE tbl_raw_pnl_2023;
END

CREATE TABLE tbl_raw_pnl_2023 (
    YEAR_MONTH NVARCHAR(8),
    Ten_DVKD NVARCHAR(255),
    AREA NVARCHAR(255),
    REGION NVARCHAR(255),
    SND_LEVEL_I NVARCHAR(255),
    SND_LEVEL_II NVARCHAR(255),
    SND_LEVEL_III NVARCHAR(255),
    Phan_nhom NVARCHAR(255),
    Dvt NVARCHAR(255),
    AMT FLOAT
);

INSERT INTO tbl_raw_pnl_2023 (YEAR_MONTH, Ten_DVKD, AREA, REGION, SND_LEVEL_I, SND_LEVEL_II, SND_LEVEL_III, Phan_nhom, Dvt, AMT)
SELECT
    YEAR_MONTH,
    Ma_DVKD AS Ten_DVKD,
	null as AREA,
	null as REGION,
    SND_LEVEL_I,
    SND_LEVEL_II,
    SND_LEVEL_III,
    Phan_nhom,
    Dvt,
    AMT
FROM (
    SELECT * FROM [tbl_raw_ thuc_hien_202301]
    UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202302]
    UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202303]
	UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202304]
	UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202305]
	UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202306]
	UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202307]
	UNION ALL
    SELECT * FROM [tbl_raw_ thuc_hien_202308]
) AS CombinedData
GROUP BY YEAR_MONTH, Ma_DVKD, SND_LEVEL_I, SND_LEVEL_II, SND_LEVEL_III, Phan_nhom, Dvt, AMT;

select top 10 * from tbl_raw_pnl_2023

