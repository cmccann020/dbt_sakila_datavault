{% snapshot snapshot_language %}

{{
    config(
      target_schema='snapshot',
      unique_key='LANGUAGE_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','language' )}}
    
{% endsnapshot %}