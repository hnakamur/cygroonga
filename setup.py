from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
    name='cygroonga',
    version='0.1.0',
    ext_modules=cythonize([
        Extension("cygroonga", ["cygroonga.pyx"],
            libraries=["groonga"])
    ]),
    install_requires=[
        'Cython==0.22.1',
    ],
)
