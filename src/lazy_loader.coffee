class LazyLoader

	lowResImages = []

	constructor: (cssClass) ->
		@cssClass = cssClass

	isElementVisible = (element) ->
		return element.getBoundingClientRect().top < window.innerHeight


	listLowResImages = (forceFetch) ->
		if (forceFetch || @lowResImages.length == 0)
			@lowResImages = document.getElementsByClassName(@cssClass)
		return this.lowResImages

	updateImages = ->
		this.listLowResImages(true)
		@loadRighRes img for img in @lowResImages when @isElementVisible img

	loadRighRes =  (img) ->
		console.info 'load ' + img.id