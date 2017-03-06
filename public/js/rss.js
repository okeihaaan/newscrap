$(function() {
	$.ajax({
		url: 'rss.php',
		xmlType: 'xml',
		success: function(xml) {
			var row = 0;
			var data = [];
			var nodeName;
			var output = $('#rss');
			
			$(xml).find('item').each(function() {
				data[row] = {};
				$(this).children().each(function() {
				    nodeName = $(this)[0].nodeName;
				    data[row][nodeName] = {};
				    attributes = $(this)[0].attributes;
				    for (var i in attributes) {
						data[row][nodeName][attributes[i].name] = attributes[i].value;
				    }
					data[row][nodeName]['text'] = $(this).text();
				});
				row++;
			});

			output.wrapInner('<ul></ul>');
			for (i in data) {			
				output.find('ul').append('<li><a href="' + data[i].link.text + '">' + data[i].title.text + '</a>' + data[i].description.text + '</li>');

			}
        }
    });
});