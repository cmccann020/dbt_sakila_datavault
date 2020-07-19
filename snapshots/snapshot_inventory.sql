{% snapshot snapshot_inventory %}

    SELECT * FROM {{ source('DBT_CMCCANN','inventory' )}}
    
{% endsnapshot %}