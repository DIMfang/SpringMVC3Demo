//examples   http://refreshless.com/nouislider/
var range_all_sliders = {
	'min': [     0 ],
	'33%': [   2000 ],
	'66%': [  10000 ],
	'max': [ 500000 ]
};

$('#range-fonds').noUiSlider({
	start: 0,
	step: 1,
	connect: 'lower',
	direction: 'ltr',
		// Support for non-linear ranges by adding intervals.
	range: range_all_sliders,
	// Configure tapping, or make the selected range dragable.
	behaviour: 'tap-drag',
	// Full number format support.
	format: wNumb({
		mark: '.',
		decimals: 2,
	})

});
// Reading/writing + validation from an input? One line.

$('#range-fonds').Link('lower').to($('#range-fonds-input'));

// Optional addon: creating Pips (Percentage In Point);
$('#range-fonds').noUiSlider_pips({
	mode: 'values',
	values: [0,2000,10000,500000],
	density: 3,
	format: wNumb({
		decimals: 0,
		prefix: '$'
	})
});



/////////////////////


//examples   http://refreshless.com/nouislider/
var range_all_sliders_people = {
	'min': [     1 ],
	'33%': [   10 ],
	'66%': [  100 ],
	'max': [ 1000 ]
};

$('#range-people').noUiSlider({
	start: 0,
	step: 1,
	connect: 'lower',
	direction: 'ltr',
		// Support for non-linear ranges by adding intervals.
	range: range_all_sliders_people,
	// Configure tapping, or make the selected range dragable.
	behaviour: 'tap-drag',
	// Full number format support.
	format: wNumb({
		mark: '.',
		decimals: 0,
	})

});
// Reading/writing + validation from an input? One line.

$('#range-people').Link('lower').to($('#range-people-input'));

// Optional addon: creating Pips (Percentage In Point);
$('#range-people').noUiSlider_pips({
	mode: 'values',
	values: [1,10,100,1000],
	density: 3,
	format: wNumb({
		decimals: 0
	})
});