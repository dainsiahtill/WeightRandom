package
{
	import com.titan.arithmetic.Weight;
	import com.titan.arithmetic.WeightUtil;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author DainSiahTill
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var list:Array = [ { name:"淘宝", hot:47 }, { name:"百度搜索", hot:55 }, { name:"看爱奇艺", hot:23 }, { name:"百度地图", hot:10 }, { name:"开心消消乐", hot:2 }, { name:"酷我音乐", hot:5 } ];
			
			var weightList:Vector.<Weight>  = WeightUtil.calculateWeights(list, "hot");
			for (var i:int = 0; i < weightList.length; i++) 
			{
				var weight:Weight = weightList[i];
				trace(weight.data.name + " hot:" + weight.data.hot);
				trace("proportion:" + weight.proportion);
				trace("between " + Math.floor(weight.lower * 100) + " ~ " + Math.floor(weight.upper * 100));
			}
			
			//测试统计
			var hashmap:Dictionary = new Dictionary();
			for (var j:int = 0; j < 1000000; j++) 
			{
				var matchWeight:Weight = WeightUtil.random(weightList);
				if (hashmap[matchWeight.data.name] == null)
				{
					hashmap[matchWeight.data.name] = 0;
				}
				else
				{
					hashmap[matchWeight.data.name]++;
				}
			}
			
			for (var key:String in hashmap)
			{
				trace(key + ":" + hashmap[key]);
			}
			
			//对比下数据，发现随机出来的数量跟第一次计算的权重比例是很接近的。
		}
		
		
		
		
		
	}
	
}