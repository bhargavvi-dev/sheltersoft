CKEDITOR.editorConfig=function(e){e.language="ru",e.extraPlugins="stylesheetparser,youtube,texttransform,autogrow,floating-tools",e.toolbar=[{name:"document",items:["Source"]},{name:"clipboard",items:["Cut","Copy","Paste","PasteText","PasteFromWord","-","Undo","Redo"]},{name:"editing",items:["Find","Replace","-","SelectAll","-","TransformTextSwitcher","TransformTextToLowercase","TransformTextToUppercase","TransformTextCapitalize"]},"/",{name:"basicstyles",items:["Bold","Italic","Underline","Strike","Subscript","Superscript","-","RemoveFormat"]},{name:"paragraph",items:["NumberedList","BulletedList","-","Blockquote","CreateDiv","-","JustifyLeft","JustifyCenter","JustifyRight","JustifyBlock"]},{name:"links",items:["Link","Unlink","Anchor"]},"/",{name:"insert",items:["Image","Youtube","Flash","Table","SpecialChar"]},{name:"styles",items:["Styles","Format"]},{name:"others",items:["Maximize","ShowBlocks"]}],e.format_tags="p;h2;h3;h4;h5;h6",e.floatingtools="Basic",e.floatingtools_Basic=[["Styles","Format","-","JustifyLeft","JustifyCenter","JustifyRight"],["TransformTextSwitcher","TransformTextToLowercase","TransformTextToUppercase","TransformTextCapitalize"],["Bold","Italic","-","NumberedList","BulletedList","CreateDiv","-","Link","Unlink"]],e.stylesSet=[],e.contentsCss="/assets/ckeditor/styles.css",e.autoGrow_onStartup=!0,e.youtube_width="698",e.youtube_height="524",e.youtube_related=!1,e.allowedContent=!0,e.filebrowserBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",e.filebrowserFlashUploadUrl="/ckeditor/attachment_files",e.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",e.filebrowserImageBrowseUrl="/ckeditor/pictures",e.filebrowserImageUploadUrl="/ckeditor/pictures",e.filebrowserUploadUrl="/ckeditor/attachment_files",e.filebrowserParams=function(){for(var e,t,r,a=document.getElementsByTagName("meta"),o=new Object,i=0;i<a.length;i++)switch(r=a[i],r.name){case"csrf-token":e=r.content;break;case"csrf-param":t=r.content;break;default:continue}return void 0!==t&&void 0!==e&&(o[t]=e),o},e.addQueryString=function(e,t){var r=[];if(!t)return e;for(var a in t)r.push(a+"="+encodeURIComponent(t[a]));return e+(-1!=e.indexOf("?")?"&":"?")+r.join("&")},CKEDITOR.on("dialogDefinition",function(t){var r,a,o=t.data.name,i=t.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],o)>-1&&(r=i.getContents("Upload")||i.getContents("upload"),a=null==r?null:r.get("upload"),a&&a.filebrowser&&void 0===a.filebrowser.params&&(a.filebrowser.params=e.filebrowserParams(),a.action=e.addQueryString(a.action,a.filebrowser.params)))})};