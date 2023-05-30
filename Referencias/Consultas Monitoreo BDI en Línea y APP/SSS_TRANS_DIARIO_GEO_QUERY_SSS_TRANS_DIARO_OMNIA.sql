--SSS_TRANS_DIARIO_GEO_QUERY_SSS_TRANS_DIARO_OMNIA.sql
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--select max(record_date) from taud_activity_log_his;
  
--select CT.VALUE  from TGEN_CATALOGUE_ITEM CT WHERE   CT.CATALOGUE_ID = 1;
SELECT TO_CHAR(A.INTERNAL_SESSION_ID) AS ID_TRANSACCION,
      TO_NUMBER(A.EVENT_TYPE) AS CODIGO_TRANSACCION,
      'OMNIA' AS CANAL,
      NVL(A.SHORT_NAME_BT,EVENTO) AS TIPO_TRANSACCION,
      'SSS_TRANS_DIARO_OMNIA' AS TRAMA_ORIGEN,
      A.TERMINAL_ID AS IP_CLIENTE,
      NULL AS PULSEPLUS_LATITUD,
      NULL AS PULSEPLUS_LONGITUDE
FROM (
    WITH SELECTBT AS (
        SELECT B.BUSINESS_TEMPLATE_ID,
               CASE
                WHEN LENGTH(SUBSTR(B.SHORT_NAME,0,INSTR(B.SHORT_NAME,'ÿ') - 1) ) > 0 THEN SUBSTR(B.SHORT_NAME,0,INSTR(B.SHORT_NAME,'ÿ') - 1)
                ELSE SHORT_NAME
            END
        AS SHORT_NAME
        FROM EEFISA.TAPD_BUSINESS_TEMPLATE B
        WHERE B.BUSINESS_TEMPLATE_ID IN (
            SELECT BUSINESS_TEMPLATE_ID
            FROM TAUD_ACTIVITY_LOG
            WHERE
                    --trunc(record_date) = trunc( SYSDATE - 1 )
             TRUNC(RECORD_DATE) > TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') )
                 --user_id = &user_id
                  AND   BUSINESS_TEMPLATE_ID IS NOT NULL
            UNION ALL
            SELECT BUSINESS_TEMPLATE_ID
            FROM TAUD_ACTIVITY_LOG_HIS
            WHERE
                  --trunc(record_date) = trunc( SYSDATE - 1 )
             TRUNC(RECORD_DATE) > TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') )
                 --user_id = &user_id
                  AND   BUSINESS_TEMPLATE_ID IS NOT NULL
        )
    ),SELECTQT AS (
        SELECT Q.QUERY_TEMPLATE_ID,
               CASE
                WHEN LENGTH(SUBSTR(Q.SHORT_NAME,0,INSTR(Q.SHORT_NAME,'ÿ') - 1) ) > 0 THEN SUBSTR(Q.SHORT_NAME,0,INSTR(Q.SHORT_NAME,'ÿ') - 1)
                ELSE SHORT_NAME
            END
        AS SHORT_NAME
        FROM TAPD_QUERY_TEMPLATE Q
        WHERE Q.QUERY_TEMPLATE_ID IN (
            SELECT QUERY_TEMPLATE_ID
            FROM TAUD_ACTIVITY_LOG
            WHERE
                    --trunc(record_date) = trunc( SYSDATE - 1 )
             TRUNC(RECORD_DATE) > TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') )
                 --and user_id = &user_id
                  AND   QUERY_TEMPLATE_ID IS NOT NULL
            UNION ALL
            SELECT QUERY_TEMPLATE_ID
            FROM TAUD_ACTIVITY_LOG_HIS
            WHERE
                --trunc(record_date) =trunc( SYSDATE - 1 )
             TRUNC(RECORD_DATE) > TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') )
                 --and user_id = &user_id
                  AND   QUERY_TEMPLATE_ID IS NOT NULL
        )
    ) SELECT *
      FROM (
        SELECT H.INTERNAL_SESSION_ID,
               H.EVENT_TYPE,
               (
            SELECT CT.VALUE
            FROM TGEN_CATALOGUE_ITEM CT
            WHERE H.EVENT_TYPE = CT.ITEM_ID
                  AND   CT.CATALOGUE_ID = 1
        ) EVENTO,
--    to_char( h.process_date,'DD/MM/YYYY HH24:MI:SS') as process_date,
--    to_char( h.record_date,'DD/MM/YYYY HH24:MI:SS') as record_date,
               H.PROCESS_DATE,
               H.RECORD_DATE,
               H.SESSION_ID,
               H.TERMINAL_ID,
               H.LOGON_ATTEMPT,
               H.USER_ID,
               H.SIGN_ON_NAME,
               H.ACTION_ID,
               H.A_CHANNEL_ID,
               H.BUSINESS_TEMPLATE_ID,
               (
            SELECT SHORT_NAME
            FROM SELECTBT
            WHERE BUSINESS_TEMPLATE_ID = H.BUSINESS_TEMPLATE_ID
        ) AS SHORT_NAME_BT,
               H.QUERY_TEMPLATE_ID,
               (
            SELECT SHORT_NAME
            FROM SELECTQT
            WHERE QUERY_TEMPLATE_ID = H.QUERY_TEMPLATE_ID
        ) AS SHORT_NAME_QT,
               H.RECORD_NUMBER,
               'log' AS TABLA,
               H.URL_QUERY_STRING,
               H.CLIENT_IP_ADDRESS,
               H.BROWSER_NAME,
               H.AUTH_PASSWORD,
               H.COOKIE,
               H.REMOTE_ADR,
               H.CDN_IP,
               H.USER_AGENT
        FROM TAUD_ACTIVITY_LOG H
        WHERE 
    	 --trunc( record_date)=trunc( SYSDATE - 1 )
         TRUNC(RECORD_DATE) > TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') ) 
         --and user_id=&user_id 
        UNION ALL
        SELECT H.INTERNAL_SESSION_ID,
               H.EVENT_TYPE,
               (
            SELECT CT.VALUE
            FROM TGEN_CATALOGUE_ITEM CT
            WHERE H.EVENT_TYPE = CT.ITEM_ID
                  AND   CT.CATALOGUE_ID = 1
        ) EVENTO,
--    to_char( h.process_date,'DD/MM/YYYY HH24:MI:SS') as process_date,
--    to_char( h.record_date,'DD/MM/YYYY HH24:MI:SS') as record_date,
               H.PROCESS_DATE,
               H.RECORD_DATE,
               H.SESSION_ID,
               H.TERMINAL_ID,
               H.LOGON_ATTEMPT,
               H.USER_ID,
               H.SIGN_ON_NAME,
               H.ACTION_ID,
               H.A_CHANNEL_ID,
               H.BUSINESS_TEMPLATE_ID,
               (
            SELECT SHORT_NAME
            FROM SELECTBT
            WHERE BUSINESS_TEMPLATE_ID = H.BUSINESS_TEMPLATE_ID
        ) AS SHORT_NAME_BT,
               H.QUERY_TEMPLATE_ID,
               (
            SELECT SHORT_NAME
            FROM SELECTQT
            WHERE QUERY_TEMPLATE_ID = H.QUERY_TEMPLATE_ID
        ) AS SHORT_NAME_QT,
               H.RECORD_NUMBER,
               'his' AS TABLA,
               H.URL_QUERY_STRING,
               H.CLIENT_IP_ADDRESS,
               H.BROWSER_NAME,
               H.AUTH_PASSWORD,
               H.COOKIE,
               H.REMOTE_ADR,
               H.CDN_IP,
               H.USER_AGENT
        FROM TAUD_ACTIVITY_LOG_HIS H
        WHERE  
    --trunc( record_date)=trunc( SYSDATE - 1 )
         TRUNC(RECORD_DATE) >= TRUNC(TO_DATE('07/07/2021','dd/MM/yyyy') )
     --and user_id=&user_id 
    )
    
    --order by internal_session_id, record_date
    --order by internal_session_id, record_date desc 
) A
ORDER BY A.INTERNAL_SESSION_ID DESC;