/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
!function(){function e(e,t,s){var r=e.join(" ");r=r.replace(/(,|>|\+|~)/g," "),r=r.replace(/\[[^\]]*/g,""),r=r.replace(/#[^\s]*/g,""),r=r.replace(/\:{1,2}[^\s]*/g,""),r=r.replace(/\s+/g," ");for(var n=r.split(" "),l=[],o=0;o<n.length;o++){var c=n[o];s.test(c)&&!t.test(c)&&-1==CKEDITOR.tools.indexOf(l,c)&&l.push(c)}return l}function t(t,s,r){var n,l=[],o=[];for(n=0;n<t.styleSheets.length;n++){var c=t.styleSheets[n],a=c.ownerNode||c.owningElement;if(!(a.getAttribute("data-cke-temp")||c.href&&"chrome://"==c.href.substr(0,9)))try{for(var i=c.cssRules||c.rules,u=0;u<i.length;u++)o.push(i[u].selectorText)}catch(f){}}var g=e(o,s,r);for(n=0;n<g.length;n++){var h=g[n].split("."),p=h[0].toLowerCase(),v=h[1];l.push({name:p+"."+v,element:p,attributes:{"class":v}})}return l}CKEDITOR.plugins.add("stylesheetparser",{init:function(e){e.filter.disable();var s;e.once("stylesSet",function(r){r.cancel(),e.once("contentDom",function(){e.getStylesSet(function(r){var n=e.config.stylesheetParser_skipSelectors||/(^body\.|^\.)/i,l=e.config.stylesheetParser_validSelectors||/\w+\.\w+/;s=r.concat(t(e.document.$,n,l)),e.getStylesSet=function(e){return s?e(s):void 0},e.fire("stylesSet",{styles:s})})})},null,null,1)}})}();