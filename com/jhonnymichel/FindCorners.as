/**
 * 
 * @author jhonnymichel at outlook.com
 *
 **/

package com.jhonnymichel
{
	import flash.display.Stage;
 	/**
	 * 
	 * This is an easy way to adapt your app to any device size. Works across iOS and Android.
   	 * it uses the default scaling method of flash, so you need to set your stageScaleMode to SHOW_ALL on your main class 
   	 * before create a instance of the class:
   	 *
   	 * stage.scaleMode = StageScaleMode.SHOW_ALL;
   	 *
   	 * and then you will be able to reach the corners of the screen.
   	 *
   	 * var corners:FindCorners = new findCorners(this.stage);
   	 * trace (corners.left, corners.bottom, corners.right, corners.top, corners.fullScreenWidth, corners.fullScreenHeight);
   	 *
   	 * TODO:
   	 * transform this class into a singletone, it would be easier to access it from any class (even if you don't singletone it, 
   	 * do not instantiate it more than once. Just pass in the instance as a parameter to other classes).
   	 *
   	 * THIS WILL ONLY WORK PROPERLY ON FULLSCREEN APPS. figure out the math to fix it is also on the todo list.
   	**/
	
	public class FindCorners
	{
		private var _top:Number;
		private var _bottom:Number;
		private var _left:Number;
		private var _right:Number;
		private var _fullScreenWidth:Number;
		private var _fullScreenHeight:Number;
		private var stage:Stage;
		private var displayType:String;
		
		public function FindCorners(s:Stage)
		{
			stage = s;
			setDisplayType();
			setCorners();
		}
		
		private function setDisplayType():void
		{
			if (stage.fullScreenWidth/stage.stageHeight > stage.stageWidth/stage.stageHeight)
				displayType = "wider"
			else
				displayType = "taller"
		}
		
		private function setCorners():void
		{
			if (displayType == "wider")
			{
				_top = 0;
				_bot = stage.stageHeight;
				_left = -findCorners(stage);
				_right = stage.stageWidth + findCorners(stage);
				_fullScreenWidth = stage.stageWidth+findCorners(stage)*2;
				_fullScreenHeight = stage.stageHeight;
				
			}
			else
			{
				_top = -findCorners(stage);
				_bot = stage.stageHeight+findCorners(stage);
				_left = 0;
				_right = stage.stageWidth;
				_fullScreenWidth = stage.stageWidth;
				_fullScreenHeight = stage.stageHeight+findCorners(stage)*2;
			}
		}
		
		private function findCorners(s:Stage):Number
		{
			var scaleProportion:Number
			if (displayType == "wider")
			{
				scaleProportion = stage.fullScreenHeight/s.stageHeight;			
				scaleProportion =  Math.round((stage.fullScreenWidth - stage.stageWidth*scaleProportion)/2 / scaleProportion);
			}
			else
			{
				scaleProportion = stage.fullScreenWidth/s.stageWidth;		
				scaleProportion = Math.round((stage.fullScreenHeight - stage.stageHeight*scaleProportion)/2 / scaleProportion);
			}
			
			return scaleProportion;
			
		}
		
		public function get right():Number
		{
			return _right;
		}
		
		public function get left():Number
		{
			return _left;
		}
		
		public function get bottom():Number
		{
			return _bottom;
		}
		
		public function get top():Number
		{
			return _top;
		}
		public function get fullScreenWidth():Number
		{
			returno _fullScreenWidth;
		}
		public function get fullScreenHeight():Number
		{
			returno _fullScreenHeight;
		}
	}
}
