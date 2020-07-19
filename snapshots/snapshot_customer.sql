{% snapshot snapshot_customer %}

{{
    config(
      target_schema='snapshot',
      unique_key='CUSTOMER_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','customer' )}}
    
{% endsnapshot %}