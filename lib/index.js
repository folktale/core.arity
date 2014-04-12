// Copyright (c) 2014 Quildreen Motta
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation files
// (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

/**
 * Restricts the arity of variadic functions.
 *
 * @module lib/index
 */

// -- Aliases ----------------------------------------------------------
var toArray = Function.call.bind([].slice)


// -- Helpers ----------------------------------------------------------
function curry(n, f) {
  return curried([])

  function curried(args) {
    return function() {
      var newArgs  = toArray(arguments)
      var allArgs  = args.concat(newArgs)
      var argCount = allArgs.length

      return argCount < n?    curried(allArgs)
      :      /* otherwise */  f.apply(null, allArgs.slice(0, n)) }}
}



// -- Implementation ---------------------------------------------------

/**
 * Restricts a variadic function to a nullary one.
 *
 * @method
 * @summary (α₁, α₂, ..., αₙ → β) → Void → β
 */
exports.nullary = curry(2, nullary)
function nullary(f, _) {
  return f()
}


/**
 * Restricts a variadic function to an unary one.
 *
 * @method
 * @summary (α₁, α₂, ..., αₙ → β) → α₁ → β
 */
exports.unary = curry(2, unary)
function unary(f, a) {
  return f(a)
}


/**
 * Restricts a variadic function to a binary one.
 *
 * @method
 * @summary (α₁, α₂, ..., αₙ → β) → α₁ → α₂ → β
 */
exports.binary = curry(3, binary)
function binary(f, a, b) {
  return f(a, b)
}


/**
 * Restricts a variadic function to a ternary one.
 *
 * @method
 * @summary (α₁, α₂, α₃, ..., αₙ → β) → α₁ → α₂ → α₃ → β
 */
exports.ternary = curry(4, ternary)
function ternary(f, a, b, c) {
  return f(a, b, c)
}