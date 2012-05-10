class LazyLoader

	constructor: (cssClass) ->
		@cssClass = cssClass
		@updateImages()

	isElementVisible: (element) ->
		element.getBoundingClientRect().top < window.innerHeight


	updateImages: ->
		lowResElements = document.getElementsByClassName(@cssClass)
		i = 0
		# lowResElements is a live collection, so removing the class of an element
		# also reduces the length
		while i < lowResElements.length
			img = lowResElements[i]
			if @isElementVisible img
				@loadHighRes img
				img.className = img.className.replace(@cssClass, '')
			else
				i++

	loadHighRes: (img) ->
		img.src = img.getAttribute('data-img-src')
		console.info "Fetching: " + img.src

lazy_loader = new LazyLoader('low_res')

window.onload = ->
	lazy_loader.updateImages()
	actualPosition = window.pageYOffset
	window.onscroll = ->
		if window.pageYOffset > actualPosition #scroll down
			lazy_loader.updateImages()
		actualPosition = window.pageYOffset
