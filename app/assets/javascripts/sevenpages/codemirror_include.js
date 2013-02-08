//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/javascript
//= require codemirror/modes/css
//= require codemirror/modes/htmlmixed

var ta = document.getElementById('code');
var editor = CodeMirror.fromTextArea(ta, {
    mode: 'text/html',
    tabMode: 'indent',
    lineNumbers: true,
    lineWrapping: true,
    smartIndent: true
});
editor.setSize(null,800);