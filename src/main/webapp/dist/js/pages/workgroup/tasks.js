;
(function ($, window, undefined) {

	"use strict";
	
	var NetdiskPub = {

		$filter_switch_btn : $('section.content a[gpid="filter-switch-btn"]'),

		$filter_panel : $('section.content div[gpid="wgroup-filter"]'),

		initial : function () {
			var _self = this;
			_self.$filter_switch_btn.bind('click', function () {
				var _$self = $(this);
				NetdiskPub.$filter_panel.toggleClass('hidden');
				if (NetdiskPub.$filter_panel.hasClass('hidden')) {

					_$self.find('i').removeClass('fa-angle-double-up').addClass('fa-angle-double-down');
				} else {
					_$self.find('i').removeClass('fa-angle-double-down').addClass('fa-angle-double-up');
				}
			});
		}
	};

	NetdiskPub.initial();

	$('a[gpid="show-comments-btn"]').bind('click', function(){
		var _$self_p = $(this).parent().parent().parent();
		_$self_p.find('div[gpid="comment-list-container"]').toggleClass('hidden');
	});
	
	var pvar = $('#versionlist').popover({
			html : true,
			placement : 'bottom',
			content : function () {

				return $(this).parent().find('.content').html();
			},
			template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
		});

	$('#informationlist').popover({
		html : true,
		placement : 'bottom',
		content : function () {

			return $(this).parent().find('.content').html();
		},
		template : '<div class="popover "><div class="arrow"></div><div class="popover-inner"><div class="popover-content" style="padding:0px;"><p></p></div></div></div>'
	});

	$('body').on('click', function (e) {
		$('.popup-marker').each(function () {
			//the 'is' for buttons that trigger popups
			//the 'has' for icons within a button that triggers a popup
			if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
				$(this).popover('hide');
			}
		});
	});
})(jQuery, window);
