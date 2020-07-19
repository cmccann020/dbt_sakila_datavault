with staff as (

    select * from {{ source('Sakila','staff') }}

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
        LAST_UPDATE
    FROM staff
)

select * from final