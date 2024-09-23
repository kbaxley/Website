# Website

### Label

label elements are used to help associate the text for an input element with the input element itself (especially for assistive technologies like screen readers).

Here is an example of a label element with a radio button:

Example Code
<label><input type="radio"> cat</label>

### id

The id attribute is used to identify specific HTML elements. Each id attribute's value must be unique from all other id values for the entire page.

Here is an example of an input element with an id attribute:

Example Code
<input id="email">

### Checked

To automatically check a box or a radio value 

<label><input checked id="indoor" type="radio" name="indoor-outdoor" value="indoor"> Indoor</label>

### Footer

The footer element is used to define a footer for a document or section. A footer typically contains information about the author of the document, copyright data, links to terms of use, contact information, and more.

<footer></footer>

### Language

Notice that the entire contents of the page are nested within an html element. The html element is the root element of an HTML page and wraps all content on the page.

You can also specify the language of your page by adding the lang attribute to the html element.

Add the lang attribute with the value en to the opening html tag to specify that the language of the page is English

<html lang="en"></html>

### !DOCTYPE

All pages should begin with <!DOCTYPE html>. This special string is known as a declaration and ensures the browser tries to meet industry-wide specifications.

<!DOCTYPE html> tells browsers that the document is an HTML5 document which is the latest version of HTML.

### meta

You can set browser behavior by adding meta elements in the head. Here's an example:

Example Code
<meta attribute="value">
Inside the head element, nest a meta element with a charset attribute. Set to the value to utf-8 which tells the browser how to encode characters for the page.
