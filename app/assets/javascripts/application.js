// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){

	var s, textInput = {
		settings:{
			selector:$("input#searchBox"),
			selector_val:$("input#searchBox").attr('value')
		},
		init:function(){
			s = this.settings,
			this.bindActions();
		},
		bindActions:function(){
			s.selector.on('focus',function(){
				textInput.empty(s.selector);
			});
			s.selector.on('blur',function(){
				textInput.refill(s.selector_val);
			});
			s.selector.on('keypress',function(e){
				if(e.keyCode == 13) { textInput.runRailsMethod(s.selector); };
			});
		},
		empty:function(valu){
			valu.val("");
		},
		refill:function(){
			s.selector.val(s.selector_val);
		},
		runRailsMethod:function(that){
			console.log(that.val());
			//<%= remote_function :url => { :action => "callTwitter", :with => that.val() } %>
		}
	};

	textInput.init();

});




