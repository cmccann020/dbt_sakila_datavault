{% snapshot snapshot_customer %}

    SELECT * FROM {{ source('DBT_CMCCANN','customer' )}}
    
{% endsnapshot %}