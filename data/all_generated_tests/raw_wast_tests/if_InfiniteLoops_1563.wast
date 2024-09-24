;; 4. **Test Description**:    Loop followed by an `if` with mismatching block types in then and else parts conditioned by `br_if`:    - Tests if the type check influences the loop break condition, affecting infinite loop detection.

(assert_invalid
  (module
    (func $loop-if-type-mismatch
      (loop (result i32)
        (br_if 0 (i32.const 1))
        (if (result i64) (i32.const 1)
          (then (i64.const 1))
          (else (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)