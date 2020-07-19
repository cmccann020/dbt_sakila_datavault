{% snapshot snapshot_language %}

    SELECT * FROM {{ source('DBT_CMCCANN','language' )}}
    
{% endsnapshot %}