from setuptools import setup, find_packages

setup(
    name='gcp-storage-manager',
    version='1.0',
    packages=find_packages(),
    install_requires=[
        'google-cloud-storage==2.0.0',
        'google-auth==2.0.0'
    ],
)
