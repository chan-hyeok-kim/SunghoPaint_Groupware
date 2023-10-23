/**
 * 
 */

const Editor = toastui.Editor;

const { tableMergedCell, colorSyntax } = Editor.plugin;

 const ToastEditor__chartOptions = {
        minWidth: 100,
        maxWidth: 600,
        minHeight: 100,
        maxHeight: 300
    };




const editor = new Editor({
	el: document.querySelector('#editor'),
	language: 'ko',
	toolbarItems: [
		['heading', 'bold', 'italic', 'strike'],
		['hr', 'quote'],
		['ul', 'ol', 'task', 'indent', 'outdent'],
		['table', 'image', 'link'],
		['code', 'codeblock'],
		['scrollSync'],
		//customToolbar
	],
	plugins: [
		[toastui.Editor.plugin.chart, ToastEditor__chartOptions],
		[toastui.Editor.plugin.codeSyntaxHighlight, { highlighter: Prism }],
		, tableMergedCell,
		colorSyntax,
		[
			toastui.Editor.plugin.uml,
			{ rendererURL: "http://www.plantuml.com/plantuml/svg/" }
		]

	],
	extendedAutolinks: true,
	
});



$('#document-add-btn-list').mouseover(function(){
	console.log(editor.getHTML());
	$('#editor').after('<textarea style="display:none" id="text" name="approvalForm"></textarea>');
	$('#text').text(editor.getHTML());
	
})

