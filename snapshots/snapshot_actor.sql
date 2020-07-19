{% snapshot snapshot_actor %}

{{
    config(
      target_schema='snapshot',
      unique_key='ACTORID',

      strategy='timestamp',
      updated_at='DATETIME',
    )
}}

    SELECT * FROM {{ source('Sakila','actor' )}}
    
{% endsnapshot %}