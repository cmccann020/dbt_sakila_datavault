{% snapshot snapshot_store %}

{{
    config(
      target_schema='snapshot',
      unique_key='STORE_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','store' )}}
    
{% endsnapshot %}