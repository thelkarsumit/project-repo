from setuptools import setup, find_packages

setup(
    name='gcp-python-project',
    version='1.0',
    packages=find_packages(),
    install_requires=[
        'google-cloud-resource-manager==1.7.0',
        'google-auth==2.0.0',
        'google-api-python-client==2.19.0'
    ],
)
