;; 5. Design a test with nested `if`-`else` constructs including `call_indirect` within an `else`, followed by a `br` targeting the `if` block itself to check if incorrect label resolution disrupts the function call returns.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table anyfunc (elem))
    (func $test (result i32)
      (block
        (if (i32.const 1)
          (then (call_indirect (type $t) (i32.const 0) (i32.const 42)))
          (else
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)