{% snapshot snapshot_country %}

    SELECT * FROM {{ source('DBT_CMCCANN','country' )}}

{% endsnapshot %}