import numpy
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(["juffen_cython.pyx"], annotate=True, compiler_directives={'language_level': 3}),
    include_dirs=[numpy.get_include()]
    )
