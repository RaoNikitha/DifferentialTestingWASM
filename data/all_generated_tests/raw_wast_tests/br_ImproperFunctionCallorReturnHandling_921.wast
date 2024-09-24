;; 2. **Test Description:** Create an `if` block that contains a `call_indirect` branching to a table of functions with differing signatures. Immediately follow with a `br` instruction targeting the `if` block's enclosing scope. Check if stack unwinding and function calls correctly match.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func))
    (table funcref (elem 0 1))
    (func $func1 (type $sig1) (i32.const 1))
    (func $func2 (type $sig2) (nop))
    (func $test
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
          (call_indirect (type $sig2) (i32.const 1))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)