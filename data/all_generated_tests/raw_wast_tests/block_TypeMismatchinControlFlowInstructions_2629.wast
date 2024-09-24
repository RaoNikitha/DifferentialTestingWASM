;; - **Test 10 Description**:   Craft a `block` that includes a `loop` with mismatched input types (e.g., the loop expects `i32`, but `block` provides `f64`). This test checks whether both `block` and nested control instruction `loop` respect and enforce correct type constraints, capturing potential mismatches accurately.

(assert_invalid
  (module (func $type-loop-mismatch (result i32)
    (block (result i32)
      (loop (result i32) (f64.const 0.0) (br 0))
    )
  ))
  "type mismatch"
)