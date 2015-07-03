hello: cygroonga.so
	python hello.py

cygroonga.so: setup.py ccygroonga.pxd cygroonga.pyx
	python setup.py build_ext --inplace
