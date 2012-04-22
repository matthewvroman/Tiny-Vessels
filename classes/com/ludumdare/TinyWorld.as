package com.ludumdare
{
	
	import com.ludumdare.Menu;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class TinyWorld extends MovieClip
	{
		public var menuScreen:Menu = new Menu();
		public var levelScreen:Level = new Level();
		
		private var backgroundMusic:BckgrndMusic = new BckgrndMusic();
		private var musicSoundChannel:SoundChannel = new SoundChannel();
		private var musicSoundTransform:SoundTransform = new SoundTransform(1.0,0);
		
		public function TinyWorld()
		{
			super();
			musicSoundChannel = backgroundMusic.play(0,1000);
			addScreen("Menu");
			menuScreen.playBtn.addEventListener(MouseEvent.MOUSE_UP, playBtnClicked);
			levelScreen.mButton.addEventListener(MouseEvent.MOUSE_UP,menuBtnClicked);
		}
		
		public function addScreen(screen:String){
			trace("adding screen: " + screen);
			if(screen=="Menu"){
				this.addChild(menuScreen);
			}else if(screen=="Level"){
				levelScreen.restart();
				this.addChild(levelScreen);
			}
		}
		
		public function playBtnClicked(e:MouseEvent){
			trace("Play!");
			this.removeChild(menuScreen);
			addScreen("Level");
		}
		
		public function menuBtnClicked(e:MouseEvent){
			trace("Menu");
			this.removeChild(levelScreen);
			this.addChild(menuScreen);
		}
		
		
		
		
	}
}