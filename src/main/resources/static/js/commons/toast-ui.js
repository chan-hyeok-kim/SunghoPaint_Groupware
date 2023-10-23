/**
 * 
 */

const { Editor } = toastui;

const { tableMergedCell, colorSyntax } = Editor.plugin;

 const ToastEditor__chartOptions = {
        minWidth: 100,
        maxWidth: 600,
        minHeight: 100,
        maxHeight: 300
    };

/*customToolbar=[{
	name:'다크',
	tooltip: '다크 모드',
	text:'다크',
	command: 'darktab',
	style: { backgroundImage: 'none', color: 'black' },
	state: 'strong'
}]*/

let dark='default'
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
	initialEditType: 'wysiwyg',
	height: '600px',
	previewStyle: 'vertical',
	//tab
	theme: 'dark'
});


/*editor.addCommand('wysiwyg','darktab',function(){
	if(dark=='default'){
	 dark='dark'
	 }else{
	 dark='default'
	 }
})*/


$('#document-add-btn-list').mouseover(function(){
	console.log(editor.getHTML());
	$('#test').html('<textarea style="display:none" id="text" name="approvalForm"></textarea>');
	$('#text').text(editor.getHTML());
	
})

