/*! For license information please see core-install.js.LICENSE.txt */
(()=>{"use strict";var e,t={84891:(e,t,n)=>{var o=n(19755),r=n.n(o),a=n(31352),i=n(78595);const s=((e,t)=>{let n=e.getElementsByTagName("head")[0].getAttribute("data-requesttoken");return{getToken:()=>n,setToken:e=>{n=e,t("csrf-token-update",{token:n})}}})(document,i.j8),d=s.getToken;s.setToken,r().fn.extend({showPassword(e){const t={fn:null,args:{}};t.fn=e;const n=function(e,t){t.val(e.val())},o=function(e,t,o){e.is(":checked")?(n(t,o),o.show(),t.hide()):(n(o,t),o.hide(),t.show())};return this.each((function(){const e=r()(this),a=r()(e.data("typetoggle")),i=function(e){const t=r()(e),n=r()("<input />");return n.attr({type:"text",class:t.attr("class"),style:t.attr("style"),size:t.attr("size"),name:t.attr("name")+"-clone",tabindex:t.attr("tabindex"),autocomplete:"off"}),void 0!==t.attr("placeholder")&&n.attr("placeholder",t.attr("placeholder")),n}(e);i.insertAfter(e),t.fn&&(t.args.input=e,t.args.checkbox=a,t.args.clone=i),a.bind("click",(function(){o(a,e,i)})),e.bind("keyup",(function(){n(e,i)})),i.bind("keyup",(function(){n(i,e),e.trigger("keyup")})),i.bind("blur",(function(){e.trigger("focusout")})),o(a,e,i),i.closest("form").submit((function(e){i.prop("type","password")})),t.fn&&t.fn(t.args)}))}}),n(79366),n(75289),n(56396);var l,c=n(25108);r().prototype.tooltip=(l=r().prototype.tooltip,function(e){try{return l.call(this,e)}catch(t){if(t instanceof TypeError&&"destroy"===e)return void 0===window.TESTING&&c.error("Deprecated call $.tooltip('destroy') has been deprecated and should be removed"),l.call(this,"dispose");if(t instanceof TypeError&&"fixTitle"===e)return void 0===window.TESTING&&c.error("Deprecated call $.tooltip('fixTitle') has been deprecated and should be removed"),l.call(this,"_fixTitle")}}),n(99205),n(38554),window.addEventListener("DOMContentLoaded",(function(){const e=!!r()("#hasSQLite").val();r()("#hasMySQL").val(),r()("#hasPostgreSQL").val(),r()("#hasOracle").val(),r()("#selectDbType").buttonset(),r()("#selectDbType p.info a").button("destroy"),r()("#hasSQLite").val()?(r()("#use_other_db").hide(),r()("#use_oracle_db").hide()):r()("#sqliteInformation").hide(),r()("#adminlogin").change((function(){r()("#adminlogin").val(r().trim(r()("#adminlogin").val()))})),r()("#sqlite").click((function(){r()("#use_other_db").slideUp(250),r()("#use_oracle_db").slideUp(250),r()("#sqliteInformation").show(),r()("#dbname").attr("pattern","[0-9a-zA-Z$_-]+")})),r()("#mysql,#pgsql").click((function(){r()("#use_other_db").slideDown(250),r()("#use_oracle_db").slideUp(250),r()("#sqliteInformation").hide(),r()("#dbname").attr("pattern","[0-9a-zA-Z$_-]+")})),r()("#oci").click((function(){r()("#use_other_db").slideDown(250),r()("#use_oracle_db").show(250),r()("#sqliteInformation").hide(),r()("#dbname").attr("pattern","[0-9a-zA-Z$_-.]+")})),r()("#showAdvanced").click((function(e){e.preventDefault(),r()("#datadirContent").slideToggle(250),r()("#databaseBackend").slideToggle(250),r()("#databaseField").slideToggle(250)})),r()("form").submit((function(){const e=r()(this).serializeArray();r()(".float-spinner").show(250),r()('input[type="submit"]').attr("disabled","disabled").val(r()('input[type="submit"]').data("finishing")),r()("input",this).addClass("ui-state-disabled").attr("disabled","disabled"),r()("#selectDbType").find(".ui-button").length>0&&r()("#selectDbType").buttonset("disable"),r()(".strengthify-wrapper, .tipsy").css("filter","alpha(opacity=30)").css("opacity",.3);const t=r()("<form>");t.attr("action",r()(this).attr("action")),t.attr("method","POST");for(let n=0;n<e.length;n++){const o=r()('<input type="hidden">');o.attr(e[n]),t.append(o)}const n=decodeURIComponent((new RegExp("[?|&]redirect_url=([^&;]+?)(&|#|;|$)").exec(location.search)||[,""])[1].replace(/\+/g,"%20"))||"";if(n){const e=r()('<input type="hidden">');e.attr({name:"redirect_url",value:n}),t.append(e)}return t.appendTo(document.body),t.submit(),!1}));const t=r()('input[type="radio"]:checked').val();void 0===t&&r()('input[type="radio"]').first().click(),("sqlite"===t||e&&void 0===t)&&(r()("#datadirContent").hide(250),r()("#databaseBackend").hide(250),r()("#databaseField").hide(250),r()(".float-spinner").hide(250)),r()("#adminpass").strengthify({zxcvbn:OC.linkTo("core","vendor/zxcvbn/dist/zxcvbn.js"),titles:[(0,a.Iu)("core","Very weak password"),(0,a.Iu)("core","Weak password"),(0,a.Iu)("core","So-so password"),(0,a.Iu)("core","Good password"),(0,a.Iu)("core","Strong password")],drawTitles:!0,nonce:btoa(d())}),r()("#dbpass").showPassword().keyup(),r()(".toggle-password").click((function(e){e.preventDefault(),"password"===r()(this).parent().children("input").attr("type")?r()(this).parent().children("input").attr("type","text"):r()(this).parent().children("input").attr("type","password")}))}))}},n={};function o(e){var r=n[e];if(void 0!==r)return r.exports;var a=n[e]={id:e,loaded:!1,exports:{}};return t[e].call(a.exports,a,a.exports,o),a.loaded=!0,a.exports}o.m=t,e=[],o.O=(t,n,r,a)=>{if(!n){var i=1/0;for(c=0;c<e.length;c++){n=e[c][0],r=e[c][1],a=e[c][2];for(var s=!0,d=0;d<n.length;d++)(!1&a||i>=a)&&Object.keys(o.O).every((e=>o.O[e](n[d])))?n.splice(d--,1):(s=!1,a<i&&(i=a));if(s){e.splice(c--,1);var l=r();void 0!==l&&(t=l)}}return t}a=a||0;for(var c=e.length;c>0&&e[c-1][2]>a;c--)e[c]=e[c-1];e[c]=[n,r,a]},o.n=e=>{var t=e&&e.__esModule?()=>e.default:()=>e;return o.d(t,{a:t}),t},o.d=(e,t)=>{for(var n in t)o.o(t,n)&&!o.o(e,n)&&Object.defineProperty(e,n,{enumerable:!0,get:t[n]})},o.g=function(){if("object"==typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"==typeof window)return window}}(),o.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),o.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},o.nmd=e=>(e.paths=[],e.children||(e.children=[]),e),o.j=8998,(()=>{o.b=document.baseURI||self.location.href;var e={8998:0};o.O.j=t=>0===e[t];var t=(t,n)=>{var r,a,i=n[0],s=n[1],d=n[2],l=0;if(i.some((t=>0!==e[t]))){for(r in s)o.o(s,r)&&(o.m[r]=s[r]);if(d)var c=d(o)}for(t&&t(n);l<i.length;l++)a=i[l],o.o(e,a)&&e[a]&&e[a][0](),e[a]=0;return o.O(c)},n=self.webpackChunknextcloud=self.webpackChunknextcloud||[];n.forEach(t.bind(null,0)),n.push=t.bind(null,n.push.bind(n))})(),o.nc=void 0;var r=o.O(void 0,[7874],(()=>o(84891)));r=o.O(r)})();
//# sourceMappingURL=core-install.js.map?v=ee30b3e03d1c73d51ebf