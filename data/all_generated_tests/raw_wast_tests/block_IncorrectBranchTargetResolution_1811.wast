;; 2. **Test Description**: Design an instruction sequence with multiple `block` instructions and use `br_if` to conditionally branch to these blocks based on stack conditions. Verify consistent behavior in targeting the correct label in each implementation.

(assert_invalid
  (module (func $conditional-branch-test (param i32) (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 1 (local.get 0))
      )
      (i32.const 0)
    )
    (i32.add)
  ))
  "type mismatch"
)