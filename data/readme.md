## Overview
- **Total clusters**: 3
- **Trace duration**: 60 days

## Data Categories
- **IO Zone**: WARM, COLD, UNKNOWN
- **Operation Type**: READ, WRITE
- **Service Class (Request Priority)**: LATENCY_SENSITIVE, THROUGHPUT_ORIENTED, OTHER
- **Flash Cache**: From flash cache: 0 or 1
- **Cache Hit**: Hit[1], Miss[0], Write[-1 or n/a]

## Cluster Analysis

### Cluster 1
- **Average traces**: 168K
- **Warm IO_ZONE**: ~95%
- **Operation type**: Writes (~52%)
- **Service class**: Throughput oriented (~74%)
- **Flash cache**: ~94% not served from flash cache
- **Cache hit**: For read ops = equal distribution

### Cluster 2
- **Average traces**: 100K
- **Warm IO_ZONE**: ~90%
- **Operation type**: Writes (~52%)
- **Service class**: OTHER oriented (~50%), next highest is throughput by 30%
- **Flash cache**: ~95% not served from flash cache
- **Cache hit**: For read ops = equal distribution

### Cluster 3
- **Average traces**: 168K
- **Warm IO_ZONE**: ~90%
- **Operation type**: Writes (~65%)
- **Service class**: Latency and throughput oriented
- **Flash cache**: ~94% not served from flash cache
- **Cache hit**: For read ops = equal distribution

### Common Observations in IO Sizes
- Request IO, response IO, and disk IO are in distinct sizes (bytes)
- Least common size: 0 bytes
- Highest size: 8MB
- Most common IO sizes: 0KB, 256KB, 1MB

Note: The above observations are made from 27 samples picked randomly in three clusters. In detail summary for each of them is in `data_exploration_output.docx` file.
Code in [data_exploration.ipynb](data/data_exploration.ipynb)

We have identified the request_io_size in bytes from thesios data. See more [here](data/thesios-data-analysis.ipynb)