
## Unzip Log files

    (cd sf1  && tar -xvf log_sf1.tar.gz)
    (cd sf2  && tar -xvf log_sf2.tar.gz)
    (cd sf4  && tar -xvf log_sf4.tar.gz)
    (cd sf8  && tar -xvf log_sf8.tar.gz)
    (cd sf16 && tar -xvf log_sf16.tar.gz)

## View Execution Time in Short

For example, return 3 lines after matching `avg_query` in `sf1/log_thread_1.log`:

    grep -A 3 avg_query sf1/log_thread_1.log



