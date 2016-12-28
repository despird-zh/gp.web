/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/
$.AppContext = {};
// prepare the necessary data

		$(document).ready(function() {
			//Gallery.init();
		});

function calculateDivider() {
    var cols = 5;
    if ($(this).width() <= 480) {
        cols = 2
    } else if ($(this).width() <= 767) {
        cols = 3
    } else if ($(this).width() <= 980) {
        cols = 4
    }
    return cols
}
var handleIsotopesGallery = function() {
    "use strict";
    $(window).load(function() {
        var gholder = $("#gallery");
        var cols = calculateDivider();
        var gwidth = $(gholder).width();// - 20;
        var colwidth = gwidth / cols;
        $(gholder).isotope({
            resizable: false,
            masonry: {
                columnWidth: colwidth
            }
        });
        $(window).smartresize(function() {
            var cols = calculateDivider();
            var gwidth = $(gholder).width();// - 20;
            var colwidth = gwidth / cols;
            $(gholder).isotope({
                masonry: {
                    columnWidth: colwidth
                }
            })
        });
        var filters = $("#options .gallery-option-set"),
            filter = filters.find("a");
			
        filter.click(function() {
            var _$this = $(this);
            if (_$this.hasClass("active")) {
                return false
            }
            var filters = _$this.parents(".gallery-option-set");
            filters.find(".active").removeClass("active");
            _$this.addClass("active");
            var parms = {};
            var optkey = filters.attr("data-option-key");
            var optval = _$this.attr("data-option-value");
            optval = optval === "false" ? false : optval;
            parms[optkey] = optval;
            $(gholder).isotope(parms);
            return false
        })
    })
};
var Gallery = function() {
    "use strict";
    return {
        init: function() {
            handleIsotopesGallery()
        }
    }
}()
