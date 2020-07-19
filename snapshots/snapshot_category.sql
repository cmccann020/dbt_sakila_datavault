{% snapshot snapshot_category %}

    SELECT * FROM {{ source('DBT_CMCCANN','category' )}}
    
{% endsnapshot %}