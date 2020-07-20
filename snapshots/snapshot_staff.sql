{% snapshot snapshot_staff %}

{{
    config(
      target_schema='snapshot',
      unique_key='STAFF_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','staff' )}}
    
{% endsnapshot %}