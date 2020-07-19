{% snapshot snapshot_address %}

{{
    config(
      target_schema='snapshot',
      unique_key='ADDRESS_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','address' )}}
    
{% endsnapshot %}