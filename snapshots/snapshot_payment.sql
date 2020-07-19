{% snapshot snapshot_payment %}

    SELECT * FROM {{ source('DBT_CMCCANN','payment' )}}
    
{% endsnapshot %}