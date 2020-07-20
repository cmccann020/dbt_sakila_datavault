{% snapshot snapshot_country %}

{{
    config(
      target_schema='snapshot',
      unique_key='COUNTRY_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','country' )}}

{% endsnapshot %}