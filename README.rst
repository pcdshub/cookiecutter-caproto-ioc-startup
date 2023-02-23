=======================================
caproto IOC Startup Script Cookiecutter
=======================================

.. image:: https://travis-ci.org/pcdshub/cookiecutter-caproto-ioc-startup.svg?branch=master
    :target: https://travis-ci.org/pcdshub/cookiecutter-caproto-ioc-startup


Background
----------

Before using this cookiecutter, you should already have a caproto-based IOC
you wish to create startup scripts for.  Please consider starting with this
cookiecutter: https://github.com/caproto/cookiecutter-caproto-ioc

With standard EPICS IOCs, the IOC supporting code tends to be reused many
times, with only a per-IOC startup script configuring which records get created
with what PV prefixes, device IP addresses, and so on.

This cookiecutter aims to do something similar - take your existing IOC source
code and easily template multiple instances of that IOC. Several key
points (and benefits in the author's opinion) of this method are:

    1. Decoupling ``PVGroup`` source code from per-IOC settings
    2. A submodule of the IOC source to specify a released (or unreleased)
       versino of the IOC source code
    3. An independent conda environment per IOC

Notes
-----

If you create an IOC source package by way of our suggested cookiecutter,
https://github.com/caproto/cookiecutter-caproto-ioc, installing it in a
Python environment will yield a useful console entrypoint, allowing for you to
start (in the example provided by the above) ``project_name --list-pvs``.

That ``project_name`` should be set as ``package_repo`` in the cookiecutter,
as it points to the caproto-based source code package.

The ``ioc_organization`` and ``ioc_name`` are the target GitHub organization
and the intended name of the to-be-generated IOC.

Requirements for the Template
-----------------------------

- Python >= 3.5
- `Cookiecutter Python package <http://cookiecutter.readthedocs.org/en/latest/installation.html>`_ >= 1.4.0: This can be installed with pip by or conda depending on how you manage your Python packages:

::

  $ pip install cookiecutter


Starting a New Project
----------------------

::

  $ cookiecutter https://github.com/pcdshub/cookiecutter-caproto-ioc-startup


Zero to IOC
-----------

.. code-block:: sh

  # Use the cookiecutter
  $ cookiecutter https://github.com/pcdshub/cookiecutter-caproto-ioc-startup

  $ cd ioc-my-iocname

  # Customize any settings
  $ vim config.sh

  # Run the IOC
  $ ./st.cmd
  [I 17:33:28.970       server:  133] Asyncio server starting up...
  [I 17:33:28.971       server:  146] Listening on 0.0.0.0:5064
  [I 17:33:28.972       server:  205] Server startup complete.
  [I 17:33:28.973       server:  207] PVs available:
      SIM:SampleValue
      SIM:SampleScanned
  This happens at IOC boot!
  Initial value was: 0.0
  Now it is: 0.1

  ^C
  [I 17:33:30.442       server:  212] Server task cancelled. Will shut down.
  [I 17:33:30.442       server:  222] Server exiting....


Installing Development Requirements
-----------------------------------
::

  $ pip install -Ur requirements.txt
  $ pip install -Ur dev-requirements.txt


Cookiecutter?
-------------

To learn more about cookiecutter:

- Project Homepage: https://cookiecutter.readthedocs.io/en/latest/
- Github: https://github.com/audreyr/cookiecutter
