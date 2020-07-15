{% snapshot snapshot_city %}

    SELECT * FROM {{ source('DBT_CMCCANN','city' )}}
    
{% endsnapshot %}