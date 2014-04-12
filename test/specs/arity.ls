# # Specification for the library

/** ^
 * Copyright (c) 2014 Quildreen Motta
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

spec = (require 'hifive')!
_    = require '../../lib/'
g    = (...as) -> as.length

{for-all, data: {Any:BigAny, Array:BigArray}, sized} = require 'claire'
Any  = sized (-> 10), BigAny
List = (a) -> sized (-> 100), BigArray(a)

larger = (n, as) --> as.length > n

assert-arity = (f, n) ->
  for-all(List(Any)).given(larger n).satisfy (as) ->
    (f(g) ...as) is n
  .as-test!

module.exports = spec 'Core.Arity' (o, spec) ->

  o 'nullary(f)([a, b, c, ...]) <=> f()'        (assert-arity _.nullary, 0)
  o 'unary(f)([a, b, c, ...])   <=> f(a)'       (assert-arity _.unary, 1)
  o 'binary(f)([a, b, c, ...])  <=> f(a, b)'    (assert-arity _.binary, 2)
  o 'ternary(f)([a, b, c, ...]) <=> f(a, b, c)' (assert-arity _.ternary, 3)
    
    
