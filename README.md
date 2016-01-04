这是一款基于AS3写的权重随机算法，代码简单。

var list:Array = [ { name:"淘宝", hot:47 }, { name:"百度搜索", hot:55 }, { name:"看爱奇艺", hot:23 }, { name:"百度地图", hot:10 }, { name:"开心消消乐", hot:2 }, { name:"酷我音乐", hot:5 } ];

//调用一个方法，就可以算出权重比例

var weightList:Vector.<Weight>  = WeightUtil.calculateWeights(list, "hot");

//随机获取一个权重数据
var matchWeight:Weight = WeightUtil.random(weightList);
