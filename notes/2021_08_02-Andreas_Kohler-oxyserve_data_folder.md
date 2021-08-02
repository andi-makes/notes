# Change oxyserve data location

Here is how you can launch `oxyserve` if your data isn't located in the `./data` folder.

When launching `oxyserve`, set the following environment variables:

```bash
$ DATA_DIR="path/to/data" ROCKET_TEMPLATE_DIR="$DATA_DIR/templates" oxyserve
```

This is subject to change. I would like to generate `ROCKET_TEMPLATE_DIR` in oxyserve itself
from `DATA_DIR`, but right now, it is what it is.

I will update this note as soon as the template directory gets generated from the data directory.