all:
	g++ soapNNallSingle.cpp -O3 -larmadillo -o allOne
	g++ soapNNall.cpp -O3 -larmadillo -o allTwo
	g++ scanLJ.cpp -O3 -larmadillo -o scanH
	g++ soapNNsurface.cpp -O3 -larmadillo -o surfaceTwo
	g++ soapNNsurfaceSingle.cpp -O3 -larmadillo -o surfaceOne
