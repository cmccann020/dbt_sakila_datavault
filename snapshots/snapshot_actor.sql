{% snapshot snapshot_actor %}

    SELECT * FROM {{ source('Sakila','actor' )}}
    
{% endsnapshot %}