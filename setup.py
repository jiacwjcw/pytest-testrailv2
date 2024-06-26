from setuptools import setup


def read_file(fname):
    with open(fname) as f:
        return f.read()


setup(
    name="pytest-testrail",
    description="pytest plugin for creating TestRail runs and adding results",
    long_description=read_file("README.rst"),
    version="2.9.0",
    author="Allan Kilpatrick",
    author_email="allanklp@gmail.com",
    url="http://github.com/allankp/pytest-testrail/",
    packages=[
        "pytest_testrailv2",
    ],
    package_dir={"pytest_testrailv2": "pytest_testrailv2"},
    install_requires=[
        "pytest>=3.6",
        "requests>=2.20.0",
    ],
    include_package_data=True,
    entry_points={"pytest11": ["pytest-testrail = pytest_testrailv2.conftest"]},
)
