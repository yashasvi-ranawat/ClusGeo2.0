all:
	g++ soapNNallSingle.cpp -O3 -larmadillo -o allOne
	g++ soapNNall.cpp -O3 -larmadillo -o allTwo
	g++ scanLJ.cpp -O3 -larmadillo -o scanH
	g++ soapNNsurface.cpp -O3 -larmadillo -o surfaceTwo
	g++ soapNNsurfaceSingle.cpp -O3 -larmadillo -o surfaceOne
	g++ eliminateSurfaces.cpp -O3 -larmadillo -o elimSurf
	g++ soapNNHydrogen.cpp -O3 -larmadillo -o Hsoap
	g++ soapNNHydrogenSingle.cpp -O3 -larmadillo -o HsoapOne 
	g++ eliminateHs.cpp -O3 -larmadillo -o elimH

