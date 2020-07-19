{% snapshot snapshot_category %}

{{
    config(
      target_schema='snapshot',
      unique_key='CATEGORY_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','category' )}}
    
{% endsnapshot %}