with staff as (

    select * from {{ ref('snapshot_staff') }}

)
,
final as (
    SELECT
        {{ dbt_utils.surrogate_key(['FIRSTNAME','LASTNAME']) }} AS STAFF_HASH_KEY,
        STAFF_ID,
        FIRST_NAME AS STAFF_FIRST_NAME,
        LAST_NAME AS STAFF_LAST_NAME,
        ADDRESS_ID,
        PICTURE,
        EMAIL AS STAFF_EMAIL,
        STORE_ID,
        ACTIVE,
        USERNAME AS STAFF_USERNAME,
        PASSWORD AS STAFF_PASSWORD,
        DBT_SCD_ID AS DBT_Incremental_ID,
        DBT_UPDATED_AT
    FROM staff
    WHERE DBT_VALID_TO IS NULL
)

select * from final