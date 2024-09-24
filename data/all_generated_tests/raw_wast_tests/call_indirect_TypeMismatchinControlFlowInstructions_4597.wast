;; 6. Incorporate a `call_indirect` instruction within a `block` that expects no return type but introduces a function which returns an `i32`. This will check for consistency within `block` type constraints and return type mismatches.

(assert_invalid
  (module
    (type $i32 (func (result i32)))
    (table funcref (elem $ret32))
    (func $ret32 (result i32) (i32.const 32))
    (func $test
      (block
        (call_indirect (type $i32) (i32.const 0))
      )
    )
  )
  "type mismatch"
)