;; 4. **Test Description:**    Creating a loop that includes a function returning a different type than expected by the loop block's result type. This tests whether the loop handles mismatches in return types from functions.

(assert_invalid
  (module (func $mismatch-return-type
    (loop (result i32)
      (call $different-result-type)
    )
  ) (func $different-result-type (result f32) (f32.const 0)))
  "type mismatch"
)