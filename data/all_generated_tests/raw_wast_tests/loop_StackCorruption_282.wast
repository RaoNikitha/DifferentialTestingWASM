;; 3. Validate a `loop` with a sequence of `call` instructions to functions returning multiple values. Ensure that branching back into the loop does not corrupt the stack despite varying return types and counts.

(assert_invalid
  (module
    (type $sig1 (func (result i32 i32)))
    (type $sig2 (func (result i64)))
    (func $f1 (type $sig1) (i32.const 1) (i32.const 2))
    (func $f2 (type $sig2) (i64.const 1))
    (func (result i32)
      (loop (result i32)
        (call $f1) 
        (call $f2)
        (br 0)
      )
    )
  )
  "type mismatch"
)