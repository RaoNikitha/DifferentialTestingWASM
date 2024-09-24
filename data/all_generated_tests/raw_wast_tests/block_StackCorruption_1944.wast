;; 5. Create a complex test with nested `block` instructions incorporating multiple `br` and `br_table` branches. Ensure each `block` modifies the stack values distinctly before branching. Monitor for stack corruption, particularly focusing on whether label indices are managed correctly when transitioning between differing nesting levels.

(assert_invalid
  (module
    (func $nested-blocks-brs
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (br 1 (i32.mul (i32.const 3) (i32.const 4)))
        )
        (br 0)
      )
      (i32.add)  ;; This should fail since the stack is not correctly unwound.
    )
  )
  "type mismatch"
)