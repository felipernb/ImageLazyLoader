class LazyLoader

	lowResImages = []

	constructor: (cssClass) ->
		@cssClass = cssClass
		@updateImages()

	isElementVisible: (element) ->
		element.getBoundingClientRect().top < window.innerHeight


	listLowResImages: (forceFetch) ->
		if (forceFetch || @lowResImages.length == 0)
			@lowResImages = document.getElementsByClassName(@cssClass)
		this.lowResImages

	updateImages: ->
		@loadHighRes img for img in @listLowResImages(true) when @isElementVisible img

	loadHighRes: (img) ->
		img.src = img.getAttribute('data-img-src')

lazy_loader = new LazyLoader('low_res')

window.onload = ->
	lazy_loader.updateImages()
	actualPosition = window.pageYOffset
	window.onscroll = ->
		if window.pageYOffset > actualPosition #scroll down
			lazy_loader.updateImages()
		actualPosition = window.pageYOffset
