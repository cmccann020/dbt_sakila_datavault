{% snapshot snapshot_film %}

{{
    config(
      target_schema='snapshot',
      unique_key='FILM_ID',

      strategy='check',
      check_cols=['TITLE','DESCRIPTION'],
    )
}}

    SELECT * FROM {{ source('Sakila','film') }}
    
{% endsnapshot %}