## TPC-H for MonetDB

### Setup Database

- `initTPCH1.txt`: schema for SF1
- `initTPCH2.txt`: schema for SF2
- `initTPCH4.txt`: schema for SF4
- `initTPCH8.txt`: schema for SF8
- `initTPCH16.txt`: schema for SF16

### Unzip Log Files

    (cd sf1  && tar -xvf log_sf1.tar.gz)
    (cd sf2  && tar -xvf log_sf2.tar.gz)
    (cd sf4  && tar -xvf log_sf4.tar.gz)
    (cd sf8  && tar -xvf log_sf8.tar.gz)
    (cd sf16 && tar -xvf log_sf16.tar.gz)

### View Execution Time in Short

For example, return 3 lines after matching `avg_query` in `sf1/log_thread_1.log`:

    grep -A 3 avg_query sf1/log_thread_1.log

    | avg_query1               |
    +==========================+
    |       1584.9171999999999 |
    +--------------------------+
    --
    | avg_query4               |
    +==========================+
    |                 154.7629 |
    +--------------------------+
    --
    | avg_query6               |
    +==========================+
    |                  97.3221 |
    +--------------------------+
    --
    | avg_query12              |
    +==========================+
    |                 173.6981 |
    +--------------------------+
    --
    | avg_query14              |
    +==========================+
    |                   68.712 |
    +--------------------------+
    --
    | avg_query16              |
    +==========================+
    |                  70.7439 |
    +--------------------------+
    --
    | avg_query19              |
    +==========================+
    |                 880.2949 |
    +--------------------------+
    --
    | avg_query22              |
    +==========================+
    |                 120.8553 |
    +--------------------------+

