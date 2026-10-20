from setuptools import setup, find_packages

setup(
    name='apiverve_seoquickvalidator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues. Pass any URL to inspect title lengths, meta descriptions, H1 headings, viewport and canonical tags, image alt text, and unverified external links.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/seovalidator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
