;; 5. A function uses `br_if` inside a `block` to return to the start of the function when a non-zero condition is met. The test checks if the branch is taken only when intended i.e., condition is non-zero, catching errors if the condition improperly influences the branch.

(assert_invalid
  (module
    (func $br_if_in_block (param i32) (result i32)
      (block
        get_local 0
        br_if 0
      )
      i32.const 42
    )
  )
  "type mismatch"
)