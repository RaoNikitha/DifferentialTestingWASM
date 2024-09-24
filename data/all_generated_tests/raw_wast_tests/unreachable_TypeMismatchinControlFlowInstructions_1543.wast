;; 4. Use multiple levels of nested blocks where the innermost block has an `unreachable`. Follow this with a mismatched type instruction such as `f64.add`, to verify if the outer block properly detects type mismatches.

(assert_invalid
  (module (func $type-nested-block-unreachable (result i32)
    (block (block (block (unreachable)) (f64.add)))
  ))
  "type mismatch"
)