{% snapshot snapshot_rental %}

{{
    config(
      target_schema='snapshot',
      unique_key='RENTAL_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','rental' )}}
    
{% endsnapshot %}