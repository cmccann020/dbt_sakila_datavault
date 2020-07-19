{% snapshot snapshot_film %}

{{
    config(
      target_schema='snapshot',
      unique_key='FILM_ID',

      strategy='timestamp',
      updated_at='LAST_UPDATE',
    )
}}

    SELECT * FROM {{ source('Sakila','film') }}
    
{% endsnapshot %}