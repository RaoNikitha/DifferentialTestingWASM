;; 6. **`nop` in Nested Function Calls**:    Define functions containing nested control structures, with `nop` instructions included. Validate that function calls respect stack frames and scope, handling `nop` correctly within nested control flow.

(assert_invalid
  (module
    (func $outerFunc
      (block
        (loop
          (call $innerFunc)
          (nop)
          br 1
        )
      )
    )
    (func $innerFunc (param i32) (result i32)
      (if (i32.const 1)
        (then
          (nop)
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)