# Patroni
Patroni is a template to quickly deploy HA PostgreSQL in the datacenter-or anywhere else-will hopefully find it useful.   
Patroni can use Kubernetes objects in order to store the state of the cluster and manage the leader key.    
Patroni is a template for PostgreSQL HA.   

It uses distributed configuration stores (DCS) like `Etcd`, Consul… to maintain cluster status.

`ETCD` is a distributed reliable key-value store for the most critical data of a distributed system. In our case, it is using to store the state of PostgreSQL clusters.

This is a Python template to manage PostgreSQL that has good documentation and an automatic failover feature. Also, its source code is hosted on GitHub.

## Pros of using Patroni:

- Each configuration option is described in detail; it is clear how it works.
- The automatic failover feature works out-of-the-box.
- The template is written in Python, and we use Python a lot, so it will be easy for us to fix issues, if any, and maybe even to contribute to the project.
- It completely manages PostgreSQL, allows changing the configuration on every node in the cluster simultaneously, and can be used to restart the cluster to apply the new configuration, if necessary.
## Cons of using Patroni:

- It is unclear from documentation how to work with PgBouncer in the right way. But this hardly should be considered a Patroni disadvantage, as its goal is solely to manage PostgreSQL. 
- It is our job to handle the connections to Patroni in a proper way.
- There are not many examples of using Patroni in huge environments, while many examples exist that describe deployment from scratch.













## Reference links
https://medium.com/@ahmed.eljami/patroni-for-a-high-available-postgresql-cluster-90839c359ff3   
https://medium.com/miro-engineering/implementing-fault-tolerance-postgresql-cluster-with-patroni-f008471a99b1
