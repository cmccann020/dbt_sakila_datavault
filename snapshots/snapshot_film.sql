{% snapshot snapshot_film %}

    SELECT * FROM {{ source('DBT_CMCCANN','film') }}
    
{% endsnapshot %}