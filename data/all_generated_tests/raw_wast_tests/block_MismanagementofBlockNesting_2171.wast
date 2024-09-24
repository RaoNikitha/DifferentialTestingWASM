;; 2. **Test Description**:    Construct a set of nested blocks followed by a `block` that uses `br` and `br_if` instructions to branch to a higher nesting level. Here, the aim is to observe if the mismatched nesting depth is correctly interpreted by breaking out of all preceding nested blocks.

(assert_invalid
  (module (func $test-nested-blocks (result i32)
    (block (block (block (br 3))))
    (i32.const 0)
  ))
  "type mismatch"
)