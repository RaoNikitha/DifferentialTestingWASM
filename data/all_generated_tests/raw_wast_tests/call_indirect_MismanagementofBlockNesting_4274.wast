;; 3. **Dynamic function call resolution within nested if-else blocks**:    - **Description**: Create nested if-else blocks with conditional `call_indirect` instructions pointing to different function types, some matching and some mismatching the expected type. Observe if nesting levels impact type checking and correct trapping.    - **Expected outcome**: Ensure accurate dynamic resolution and traps happening only for type mismatches with correct nesting handling in both engines.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i64)))
    (func $f1 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $f2 (param i64) (result i64) (i64.add (local.get 0) (i64.const 1)))
    (table funcref (elem $f1 $f2))
    (func $nested-if-else
      (i32.const 0)
      (if (result i32)
        (then
          (i32.const 1)
          (if (result i32)
            (then (call_indirect (type $sig1) (i32.const 0)))
            (else (call_indirect (type $sig2) (i64.const 1)))
          )
        )
        (else
          (i32.const 1)
          (if (result i32)
            (then (call_indirect (type $sig2) (i64.const 1)))
            (else (call_indirect (type $sig1) (i32.const 0)))
          )
        )
      )
    )
  )
  "type mismatch"
)