;; 1. **Test with Unresolved Forward Branch**: Create a block where a `br_if` targets a future instruction that doesn’t exist, causing it to loop infinitely due to an unfulfilled branch condition.

(assert_invalid
  (module
    (func (block
      (block (result i32) (br_if 0 (i32.const 1))) (br_if 1 (i32.const 0))
    ))
  )
  "branch target not found"
)