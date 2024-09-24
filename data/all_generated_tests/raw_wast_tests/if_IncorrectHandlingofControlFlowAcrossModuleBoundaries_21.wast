;; 2. **Test Description**: An `if-else` construct where the `else` block contains a call to an exported function, with both branches consuming and producing different stack configurations.    **Constraint**: Ensures that calling an exported function from an `else` block doesn't disrupt stack balance or cause state inconsistency.    **Goal**: Identifies if the reset mechanism fails to handle the stack correctly across module boundaries.

(assert_invalid
 (module
  (func $exported (export "exported") (param i32) (result i32)
   (i32.add (local.get 0) (i32.const 1))
  )
  (func (result i32)
   (if (result i32) (i32.const 0)
    (then (i32.const 42))
    (else (call $exported (i32.const 1)) (drop) (i32.const 2))
   )
  )
 )
 "type mismatch"
)