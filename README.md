# OpenProcurement Search Buildout

## Requirements

- python 2.7
- ElasticSearch 1.7 (not 2.x) 

## Installation

    $ cd openprocurement.search.buildout
    $ python bootstrap.py
    $ bin/buildout

## First Start

    $ bin/circusd --daemon

then check var/log files

## First Query

    $ curl 127.0.0.1:8484/search?query=test

## Configuration

    $ vi etc/search.ini

