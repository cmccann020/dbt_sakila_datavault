{% snapshot snapshot_staff %}

    SELECT * FROM {{ source('DBT_CMCCANN','staff' )}}
    
{% endsnapshot %}