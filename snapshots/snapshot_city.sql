{% snapshot snapshot_city %}

{{
    config(
      target_schema='snapshot',
      unique_key='CITY_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','city' )}}
    
{% endsnapshot %}