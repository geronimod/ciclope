Ciclope
=======

Simple utility to show the replication status for MySQL hots. Usefull to inspect seconds behind master status.
 
_NOTE: This gem depends on Rails and ActiveRecord as ORM._

Configuration
-------------

Only has to specify a array of two or more Rails database config names:

> Ciclope.connections = [:production, :production\_in\_aws, :production\_in\_other_location]

The ring will be auto-sorted guessing the master host for each connection, you could bypass this feature setting:

> Ciclope.auto\_sort\_connections = false

Use
---

Actually there is one class methods to inspect replication data and one to show seconds behind master:

> Ciclope.replication\_status \# => returns a array of hashes with replication data
> Ciclope.replication\_seconds\_behind\_master # => returns a simple string with the host status like:
>> host1 ––– 0 seconds –––> host2 ––– 0 seconds –––> host3 ––– 0 seconds –––> host1

TODO
----

Extend and refact in order to let work with others frameworks ruby based (Sinatra, Merb), and others ORMs (DataMapper).

Licence
-------

Copyright (c) 2011 Hugo Gerónimo Díaz

Permission is hereby granted, free of charge, to any
person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the
Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice
shall be included in all copies or substantial portions of
the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
