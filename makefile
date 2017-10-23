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
	g++ setUniqHydrogen.cpp -O3 -larmadillo -o putH
	g++ getEta1.cpp -O3 -larmadillo -o Eta1
	g++ getEta2.cpp -O3 -larmadillo -o Eta2
	g++ getEta3.cpp -O3 -larmadillo -o Eta3
	g++ getEta1One.cpp -O3 -larmadillo -o Eta1One
	g++ getEta2One.cpp -O3 -larmadillo -o Eta2One
	g++ getEta3One.cpp -O3 -larmadillo -o Eta3One

