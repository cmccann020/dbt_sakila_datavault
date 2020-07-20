{% snapshot snapshot_payment %}

{{
    config(
      target_schema='snapshot',
      unique_key='PAYMENT_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','payment' )}}
    
{% endsnapshot %}