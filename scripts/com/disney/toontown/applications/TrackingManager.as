package com.disney.toontown.applications
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   
   public class TrackingManager
   {
       
      
      public var cto:Object;
      
      private var urlToLoad:URLRequest;
      
      private var loader:Loader;
      
      private var loaderContext:LoaderContext;
      
      public var trackerObj:Object;
      
      public function TrackingManager()
      {
         this.urlToLoad = new URLRequest("http://disney.go.com/stat/flash/analyticReportingAS3.swf");
         super();
         Security.allowDomain("*");
         this.cto = new Object();
         this.loader = new Loader();
         this.loaderContext = new LoaderContext();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadCompleteHandler);
         this.loaderContext.applicationDomain = ApplicationDomain.currentDomain;
         this.loader.load(this.urlToLoad,this.loaderContext);
      }
      
      private function loadCompleteHandler(param1:Event) : void
      {
         var _loc2_:Class = this.loader.contentLoaderInfo.applicationDomain.getDefinition("com.disney.WebAnalytics.WebAnalyticsManager") as Class;
         this.trackerObj = new _loc2_();
         trace("TrackingManager: trackerObj created");
      }
      
      public function submitPageView(param1:String) : void
      {
         if(param1 && this.trackerObj)
         {
            this.cto.trackType = "pageView";
            this.cto.pageName = param1;
            this.trackerObj.submitTracking(this.cto);
         }
         else
         {
            trace("TrackingManager: submitPageView Failed");
         }
      }
      
      public function submitLinkClick(param1:String, param2:String) : void
      {
         if((param1 || param2) && this.trackerObj)
         {
            this.cto.trackType = "linkTrack";
            this.cto.linkId = param1;
            this.cto.linkPosition = param2;
            this.trackerObj.submitTracking(this.cto);
         }
         else
         {
            trace("TrackingManager: submitLinkClick Failed");
         }
      }
   }
}
