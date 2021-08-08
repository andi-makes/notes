# CSS is black magic

Modern CSS is capable of a lot of things. It is used to create responsive layouts,
making those layouts look nice and more. But CSS's capabilities don't stop at looks -
you can do more than you'd think with it!

Let me show you what I mean by that. By using CSS `combinators` and `pseudo classes` you can
conditionally style elements on your page.

Let's imagine we have a simple html file:

```html
<body>
    <input type="checkbox" id="checker">
    <label for="checker">Toggle my background color!</label>
</body>
```

Fairly simple, isn't it? Now let's get to work on the real magic, the CSS part.

```css
label {
    background-color: cadetblue;
}

#checker:checked ~ label {
    background-color: chocolate;
}
```

And there you have it, you can toggle the background color of the label! How does it work though?

```css
#checker:checked ~ label {
    background-color: chocolate;
}
```

This part here is the magic. If the element with the `#checker` id (our checkbox) is `checked`, then change the background color of *all labels that are also a child of the parent of `#checker`*. In our case, the parent is the body element.

That means, that by using this method, we can only change so called siblings of our `#checker` checkbox. Using the other combinators, we can also style the siblings children using this method.

I'm currently using this method to implement the "compact mode" of my website. But to be completly honest, I'm not satisfied with this solution. I store the preference using JavaScript and the `localStorage` API, so regardless I'm using JavaScript on this site. I think I'll move away from the CSS solution and implement the "compact mode" using a real programming language.

Maybe one shall not use black magic.