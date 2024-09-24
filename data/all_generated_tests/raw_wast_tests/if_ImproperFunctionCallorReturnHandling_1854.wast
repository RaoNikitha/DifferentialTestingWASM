;; 5. An `if` instruction where a `call_indirect` within the `then` block points to a function not present in the corresponding function table but has a correct type signature. The `else` block performs a loop with an internal function call. This test checks type checking and table lookup mechanisms.

(assert_invalid
 (module
  (func $type-function-indirect-then-loop (result i32)
   (if (result i32) (i32.const 1)
    (then (call_indirect (type $sig) (i32.const 0) (i32.const 1)))
    (else (loop $loop (br $loop)))
   )
  )
  (type $sig (func (param i32) (result i32)))
 )
 "function index out of bounds"
)