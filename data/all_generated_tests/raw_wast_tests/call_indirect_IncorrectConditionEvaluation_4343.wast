;; 2. Test Description 2: Construct a `call_indirect` instruction with a valid table and function, but the operand index is intentionally set to an out-of-bounds value. Implement a `br_if` condition with a true value to see if the trap is correctly triggered.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (local.get 0))
    (func $call (param i32) (result i32)
      (call_indirect (type $sig)
        (i32.add (local.get 0) (i32.const 100))
      )
    )
  )
  "out of bounds table index"
)