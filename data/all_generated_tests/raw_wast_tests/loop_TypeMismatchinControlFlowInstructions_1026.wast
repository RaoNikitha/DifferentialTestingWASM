;; 7. Design a `loop` test featuring `br` instructions that assume incorrect types for their target labels, leading to type mismatches when the stack is unwound to the loop’s entry.

(assert_invalid
  (module
    (func $invalid_br_type_stack_unwind
      (block $outer_block
        (loop $inner_loop (result i32)
          (br $outer_block)
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)