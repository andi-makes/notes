# Change oxyserve data location

Here is how you can launch `oxyserve` if your data isn't located in the `./data` folder.

## Update (8th of August, 2021):
To change tha data directory from the default `./data`, you have to set the `DATA_DIR` environment variable like so:

```bash
$ DATA_DIR="path/to/data" oxyserve
```

This change greatly simplifies the configuration process.

## Original Post:

When launching `oxyserve`, set the following environment variables:

```bash
$ DATA_DIR="path/to/data" ROCKET_TEMPLATE_DIR="$DATA_DIR/templates" oxyserve
```

This is subject to change. I would like to generate `ROCKET_TEMPLATE_DIR` in oxyserve itself
from `DATA_DIR`, but right now, it is what it is.

I will update this note as soon as the template directory gets generated from the data directory.