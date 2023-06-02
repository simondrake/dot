// 
try {
  let { classes: Cc, interfaces: Ci, manager: Cm  } = Components;
  const {Services} = Components.utils.import('resource://gre/modules/Services.jsm');
  function ConfigJS() { Services.obs.addObserver(this, 'chrome-document-global-created', false); }
  ConfigJS.prototype = {
    observe: function (aSubject) { aSubject.addEventListener('DOMContentLoaded', this, {once: true}); },
    handleEvent: function (aEvent) {
      let document = aEvent.originalTarget; let window = document.defaultView; let location = window.location;
      if (/^(chrome:(?!\/\/(global\/content\/commonDialog|browser\/content\/webext-panels)\.x?html)|about:(?!blank))/i.test(location.href)) {
        if (window._gBrowser) {
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	  // Disable keys
          let keys = ["key_openDownloads"];
          for (var i=0; i < keys.length; i++) {
             let keyCommand = window.document.getElementById(keys[i]);
             if (keyCommand != undefined) { 
                keyCommand.removeAttribute("command"); 
                keyCommand.removeAttribute("key"); 
                keyCommand.removeAttribute("modifiers"); 
                keyCommand.removeAttribute("oncommand"); 
                keyCommand.removeAttribute("data-l10n-id"); 
             }
          }
          ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        }
      }
    }
  };
  if (!Services.appinfo.inSafeMode) { new ConfigJS(); }
} catch(ex) {};
