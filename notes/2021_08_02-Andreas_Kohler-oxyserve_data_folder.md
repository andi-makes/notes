# Change oxyserve data location

Here is how you can launch oxyserve if your data isn't located in "./data".

When launching `oxyserve`, set the following environment variables:

```bash
$ DATA_DIR="path/to/data" ROCKET_TEMPLATE_DIR="$DATA_DIR/templates" oxyserve
```

<link rel="stylesheet"
      href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/styles/default.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js"></script>
<script>hljs.highlightAll();</script>