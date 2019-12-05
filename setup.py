#!/usr/bin/env python

from __future__ import absolute_import
from setuptools import setup

if __name__ == '__main__':
    # Provide static information in setup.json
    # such that it can be discovered automatically
    setup(packages=["detail", "figure"],
          name="discover-cofs",
          author="Leopold Talirz",
          author_email="info@materialscloud.org",
          description="bokeh application for COF discover section.",
          license="MIT",
          classifiers=["Programming Language :: Python"],
          version="0.1.0",
          install_requires=[
              "bokeh~=1.3.4", "jsmol-bokeh-extension~=0.2.1", "pandas~=0.24.2",
              "sqlalchemy~=1.0.19", "ruamel.yaml~=0.16.5"
          ],
          extras_require={
              "pre-commit": [
                  "pre-commit==1.11.0", "yapf==0.24.0", "prospector==0.12.11",
                  "pylint==1.9.3"
              ]
          })
