class LazyLoader

	lowResImages = []

	constructor: (cssClass) ->
		@cssClass = cssClass
		@updateImages()

	isElementVisible = (element) ->
		return element.getBoundingClientRect().top < window.innerHeight


	listLowResImages = (forceFetch) ->
		if (forceFetch || @lowResImages.length == 0)
			@lowResImages = document.getElementsByClassName(@cssClass)
		return this.lowResImages

	updateImages = ->
		this.listLowResImages(true)
		@loadRighRes img for img in @lowResImages when @isElementVisible img

	loadRighRes = (img) ->
		img.className = img.className.replace(@cssClass, '') #keeps other classes applied to element
		img.src = img.getAttribute('data-img-src')
		console.info('loading ' + img.src)

lazy_loader = new LazyLoader('lowResImages')

window.load = ->
	lazy_loader.updateImages()
	actualPosition = window.pageYOffset
	window.onscroll = ->
		if window.pageYOffset > actualPosition #scroll down
			lazy_loader.updateImages()
		actualPosition = window.pageYOffset
