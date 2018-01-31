/*
 * @file image paste plugin for CKEditor
	Feature introduced in: https://bugzilla.mozilla.org/show_bug.cgi?id=490879
	doesn't include images inside HTML (paste from word): https://bugzilla.mozilla.org/show_bug.cgi?id=665341
 * Copyright (C) 2011 Alfonso Martínez de Lizarrondo
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 */
CKEDITOR.plugins.add("imagepaste",{init:function(e){e.on("paste",function(t){var a=t.data.html;a&&(t.data.html=a.replace(/<img src="data:image\/png;base64,.*?" alt="">/g,function(t){var a=t.match(/"data:image\/png;base64,(.*?)"/)[1],n=CKEDITOR.tools.getNextId(),o=e.config.filebrowserImageUploadUrl+"&CKEditor="+e.name+"&CKEditorFuncNum=2&langCode="+e.langCode,r=new XMLHttpRequest;r.open("POST",o),r.onload=function(){var t=r.responseText.match(/2,\s*'(.*?)',/)[1],a=e.document.getById(n);a.data("cke-saved-src",t),a.setAttribute("src",t),a.removeAttribute("id")};var i="---------------------------1966284435497298061834782736",d="\r\n",s="--"+i;s+=d+'Content-Disposition: form-data; name="upload"';var m=window.atob(a);return s+='; filename="'+n+'.png"'+d+"Content-type: image/png",s+=d+d+m+d+"--"+i,s+="--",r.setRequestHeader("Content-Type","multipart/form-data; boundary="+i),r.sendAsBinary(s),t.replace(/>/,' id="'+n+'">')}))})}});