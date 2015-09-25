hello: cygroonga.so
	python hello.py

cygroonga.so: setup.py ccygroonga.pxd cygroonga.pyx
	python setup.py build_ext --inplace

test: cygroonga.so
	PYTHONPATH=. py.test -v tests

clean:
	@rm -r build cygroonga.c cygroonga.so test.db*
