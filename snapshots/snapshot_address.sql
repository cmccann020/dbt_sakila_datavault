{% snapshot snapshot_address %}

    SELECT * FROM {{ source('DBT_CMCCANN','address' )}}
    
{% endsnapshot %}