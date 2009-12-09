package ghostcat.util.display
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import ghostcat.events.ItemClickEvent;
	
	[Event(name="change",type="flash.events.Event")]
	public class SelectGroup extends EventDispatcher
	{
		public var children:Array;
		public var field:String;
		private var _selectedIndex:int = -1;
		public var eventTarget:EventDispatcher;
		
		public function SelectGroup(children:Array,field:String = "selected")
		{
			this.children = children;
			this.field = field;
			this.eventTarget = this;
		}
		
		public function get selectedIndex():int
		{
			return _selectedIndex;
		}

		public function set selectedIndex(value:int):void
		{
			if (_selectedIndex == value)
				return;
			
			_selectedIndex = value;
			
			for (var i:int = 0;i < children.length;i++)
				children[i][field] = (i == value)
			
			if (this.eventTarget)
				this.eventTarget.dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function get selectedChild():*
		{
			if (_selectedIndex == -1)
				return null;
			else if (_selectedIndex >= children.length)
				return null;
			else 
				return children[_selectedIndex];
		}
		
		public function set selectedChild(v:*):void
		{
			this.selectedIndex = children.indexOf(v);
		}

	}
}