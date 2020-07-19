{% snapshot snapshot_inventory %}

{{
    config(
      target_schema='snapshot',
      unique_key='INVENTORY_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','inventory' )}}
    
{% endsnapshot %}