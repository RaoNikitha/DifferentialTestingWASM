;; Test 5: Create a function that calls another nested function, passing the evaluation of an expression as an argument. The nested function should contain a `br_if` that branches based on this argument.

(assert_invalid
  (module
    (func $nested (param i32)
      (block $exit
        (br_if $exit (local.get 0))
        (i32.const 42)
      )
    )
    (func $caller
      (call $nested
        (i32.eq (i32.const 1) (i32.const 1))
      )
    )
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param)))
    (type $sig3 (func (result i32)))
    (func $type-check (call_indirect (type $sig3) (i32.const 0) (i32.const 0)))
  )
  "type mismatch"
)