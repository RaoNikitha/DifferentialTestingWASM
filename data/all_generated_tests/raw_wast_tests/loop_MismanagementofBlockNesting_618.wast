;; 9. **Conditional Loop Exit with Empty Block**: Design a loop that conditionally exits to an empty `block` within an outer structure. This tests the implementation’s ability to manage and validate the flow of invalid and ambiguous nested structures, which can vary due to error-handling mechanisms.

(assert_invalid
  (module (func $conditional-loop-exit-with-empty-block (result i32)
    (block
      (loop (br_if 0 (i32.const 1)) (nop))
    )
  ))
  "type mismatch"
)