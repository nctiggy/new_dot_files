var Encryption=function(){return{encryptMessage:function(a,b){var c=null;b?(b=b.substr(0,16),c=CryptoJS.enc.Latin1.parse(b)):c=CryptoJS.enc.Latin1.parse("2TjfWW2jbey5ppmi");var d=CryptoJS.enc.Latin1.parse("iqHBpS3qbu6u7qui"),e=CryptoJS.enc.Utf8.parse(a);return CryptoJS.AES.encrypt(e,c,{iv:d,padding:CryptoJS.pad.Pkcs7,mode:CryptoJS.mode.CBC})},decryptMessage:function(a,b){var c=null;b?(b=b.substr(0,16),c=CryptoJS.enc.Latin1.parse(b)):c=CryptoJS.enc.Latin1.parse("2TjfWW2jbey5ppmi");var d=CryptoJS.enc.Latin1.parse("iqHBpS3qbu6u7qui");return CryptoJS.AES.decrypt(a,c,{iv:d,padding:CryptoJS.pad.Pkcs7,mode:CryptoJS.mode.CBC}).toString(CryptoJS.enc.Utf8)}}}();