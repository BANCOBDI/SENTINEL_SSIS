SELECT to_char(A.INTERNAL_SESSION_ID) AS ID_TRANSACCION,
TO_NUMBER(A.EVENT_TYPE) AS CODIGO_TRANSACCION,
'OMNIA' AS CANAL,
nvl(A.SHORT_NAME_BT, evento) AS TIPO_TRANSACCION,
'SSS_TRANS_DIARO_OMNIA' AS TRAMA_ORIGEN,
A.TERMINAL_ID  AS IP_CLIENTE,
NULL AS PULSEPLUS_LATITUD,
NULL AS PULSEPLUS_LONGITUDE
FROM (
WITH selectbt AS (
    SELECT
        b.business_template_id,
        CASE  WHEN length(SUBSTR(b.short_name, 0, INSTR(b.short_name, 'ÿ') - 1)) > 0  THEN SUBSTR(b.short_name, 0, INSTR(b.short_name, 'ÿ') - 1)  ELSE short_name  END as short_name
    FROM
        eefisa.tapd_business_template b
    WHERE
       b. business_template_id IN (
            SELECT
                business_template_id
            FROM
                taud_activity_log
            WHERE
                    trunc(record_date) = trunc( SYSDATE - 1 )
                 --user_id = &user_id
                AND business_template_id IS NOT NULL
            UNION ALL
            SELECT
                business_template_id
            FROM
                taud_activity_log_his
            WHERE
                  trunc(record_date) = trunc( SYSDATE - 1 )
                 --user_id = &user_id
                AND business_template_id IS NOT NULL
        )
),
 selectqt AS (
    SELECT
        q.query_template_id,
       CASE  WHEN length(SUBSTR(q.short_name, 0, INSTR(q.short_name, 'ÿ') - 1)) > 0 THEN SUBSTR(q.short_name, 0, INSTR(q.short_name, 'ÿ') - 1)  ELSE short_name  END as short_name
    FROM
        tapd_query_template q
    WHERE
        q.query_template_id IN (
            SELECT
                query_template_id
            FROM
                taud_activity_log
            WHERE
                    trunc(record_date) = trunc( SYSDATE - 1 )
                 --and user_id = &user_id
                AND query_template_id IS NOT NULL
            UNION ALL
            SELECT
                query_template_id
            FROM
                taud_activity_log_his
            WHERE
                trunc(record_date) =trunc( SYSDATE - 1 )
                 --and user_id = &user_id
                AND query_template_id IS NOT NULL
        )
)

select * from (

SELECT
    h.internal_session_id,
    h.event_type,
    (select CT.VALUE  from TGEN_CATALOGUE_ITEM CT WHERE h.EVENT_TYPE =  CT.ITEM_ID AND  CT.CATALOGUE_ID = 1) evento,
--    to_char( h.process_date,'DD/MM/YYYY HH24:MI:SS') as process_date,
--    to_char( h.record_date,'DD/MM/YYYY HH24:MI:SS') as record_date,
h.process_date,
h.record_date,
    h.session_id,
    h.terminal_id,
    h.logon_attempt,
    h.user_id,
    h.sign_on_name,
    h.action_id,
    h.a_channel_id,
    h.business_template_id,
    (select short_name from selectbt where business_template_id = h.business_template_id) as short_name_bt,
    h.query_template_id,
    (select short_name from selectqt where query_template_id = h.query_template_id) as short_name_qt,
    h.record_number,
    'log' as tabla,
    h.url_query_string,
    h.client_ip_address,
    h.browser_name,
    h.auth_password,
    h.cookie,
    h.remote_adr,
    h.cdn_ip,
    h.user_agent
    
FROM
   taud_activity_log h 
    where 
         trunc( record_date)=trunc( SYSDATE - 1 )
         --and user_id=&user_id 
union all
SELECT
    h.internal_session_id,
    h.event_type,
    (select CT.VALUE  from TGEN_CATALOGUE_ITEM CT WHERE h.EVENT_TYPE =  CT.ITEM_ID AND  CT.CATALOGUE_ID = 1) evento,
--    to_char( h.process_date,'DD/MM/YYYY HH24:MI:SS') as process_date,
--    to_char( h.record_date,'DD/MM/YYYY HH24:MI:SS') as record_date,
h.process_date,
h.record_date,
    h.session_id,
    h.terminal_id,
    h.logon_attempt,
    h.user_id,
    h.sign_on_name,
    h.action_id,
    h.a_channel_id,
    h.business_template_id,
    (select short_name from selectbt where business_template_id = h.business_template_id) as short_name_bt,
    h.query_template_id,
    (select short_name from selectqt where query_template_id = h.query_template_id) as short_name_qt,
    h.record_number,
    'his' as tabla,
    h.url_query_string,
    h.client_ip_address,
    h.browser_name,
    h.auth_password,
    h.cookie,
    h.remote_adr,
    h.cdn_ip,
    h.user_agent
FROM
    taud_activity_log_his h
    where  
    trunc( record_date)=trunc( SYSDATE - 1 )
     --and user_id=&user_id 
    )
    
    --order by internal_session_id, record_date
    --order by internal_session_id, record_date desc 
    ) A
    order by A.internal_session_id desc;
    
    select max(record_date) from taud_activity_log_his;
    
    select CT.VALUE  from TGEN_CATALOGUE_ITEM CT WHERE   CT.CATALOGUE_ID = 1