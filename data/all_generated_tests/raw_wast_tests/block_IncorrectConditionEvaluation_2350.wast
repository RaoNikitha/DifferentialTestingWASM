;; Test Description 1: A `block` containing a `br_if` instruction that should only branch if the top stack value is non-zero. Validate whether the branch is correctly taken based on different top stack values (zero and non-zero). Ensure the execution behaves according to the condition evaluation.

(assert_invalid
  (module (func $block-br_if-test (result i32)
    (block (result i32) 
      (i32.const 0) 
      (br_if 0 (i32.const 0)) 
      (i32.const 1)
    )
  ))
  "type mismatch"
)