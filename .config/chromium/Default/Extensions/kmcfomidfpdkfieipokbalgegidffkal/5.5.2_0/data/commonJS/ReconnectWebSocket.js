!function(a){a.ReconnectingWebSocket=function(a,b){this.uuid=null,this.reconnectInterval=250,this.timeoutInterval=2e3,this.automaticOpen=!0,this.protocols=b||[],this.readyState=WebSocket.CONNECTING,this.url=null,this.reconnectAttempts=0,this.urlArray=a;var c,d=this,e=!1,f=function(){function a(a){var b=(Math.random().toString(16)+"000000000").substr(2,8);return a?"-"+b.substr(0,4)+"-"+b.substr(4,4):b}return a()+a(!0)+a(!0)+a()};this.onopen=function(a){},this.onclose=function(a){},this.onmessage=function(a){},this.onerror=function(a){},this.send=function(a){if(c)return c.send(a);throw"INVALID_STATE_ERR : Pausing to reconnect websocket"},this.close=function(a){c&&(a?d.reconnectAttempts=-1:e=!0,c.close())},this.open=function(a,b){c=new WebSocket(b),c.onopen=function(a){d.readyState=WebSocket.OPEN,d.uuid=f(),d.url=b,d.reconnectAttempt=!1,d.reconnectAttempts=0,d.onopen(a)},c.onmessage=function(a){d.onmessage(a)},c.onerror=function(a){d.onerror(a)},c.onclose=function(b){c=null,e?(d.readyState=WebSocket.CLOSED,d.onclose(b)):(d.readyState=WebSocket.CONNECTING,a||!1||d.onclose(b),++d.reconnectAttempts,d.reconnectAttempts<d.urlArray.length?d.open(!0,d.urlArray[d.reconnectAttempts]):(d.close(),d.reconnectAttempts=0))}},this.refresh=function(){c?d.close(!0):(d.reconnectAttempts=0,c=null,d.readyState=WebSocket.CONNECTING,d.reconnectAttempts<d.urlArray.length?d.open(!0,d.urlArray[d.reconnectAttempts]):(d.close(),d.reconnectAttempts=0))},!0===this.automaticOpen&&this.open(!1,d.urlArray[0])},a.ReconnectingWebSocket}(this);