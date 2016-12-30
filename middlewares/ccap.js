var config = require('../config');
var z = require('zengming');
var BMP24 = z.BMP24;
var font = z.Font;

exports.makeCapcha = function() {
    var ccpa = {"img":null, "str":""};
    var img = new BMP24(100, 30);
   //img.drawCircle(11, 11, 10, z.rand(0, 0xffffff));
   // img.drawRect(0, 0, img.w-1, img.h-1, z.rand(0, 0xffffff));
    img.fillRect(0, 0, 100, 30, 0xf0f0f0);
    img.drawLine(50, 6, 3, 30, z.rand(0, 0xffffff));
    //return img;

    //画曲线
    var w=img.w/2;
    var h=img.h;
    var color = z.rand(0, 0xffffff);
    var y1=z.rand(-5,5); //Y轴位置调整
    var w2=z.rand(10,15); //数值越小频率越高
    var h3=z.rand(4,6); //数值越小幅度越大
    var bl = z.rand(1,5);
    for(var i=-w; i<w; i+=0.1) {
        var y = Math.floor(h/h3*Math.sin(i/w2)+h/2+y1);
        var x = Math.floor(i+w);
        for(var j=0; j<bl; j++){
            img.drawPoint(x, y+j, color);
        }
    }

    var p = "ABCDEFGHIJKLMNOPQRSTUVWXYZ3456789";
    var str = '';
    for(var i=0; i<4; i++){
        str += p.charAt(Math.random() * p.length |0);
    }
    ccpa.str = str;

    var fonts = [font.font12x24];
    var x = 15, y=2;
    for(var i=0; i<str.length; i++){
        var f = fonts[Math.random() * fonts.length |0];
        y = z.rand(0, 6);
        img.drawChar(str[i], x, y, f, z.rand(0, 0xffffff));
        x += f.w + z.rand(2, 8);
    }

    ccpa.img = img;
    return ccpa;
}