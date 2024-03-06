package com.disney.toontown.ui
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class InvisibleButton extends Sprite
   {
       
      
      private var _link:String = "";
      
      public function InvisibleButton()
      {
         super();
         this.alpha = 0;
      }
      
      public function set link(param1:String) : void
      {
         this._link = param1;
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
      }
      
      public function removeListeners() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.clickHandler);
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(this._link),"_self");
      }
   }
}
