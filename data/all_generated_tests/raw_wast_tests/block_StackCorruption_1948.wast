;; 9. Design a test featuring a `block` with a `br_if` branching instruction conditioned on stack top values, ensuring that stack height variations lead to different execution flows. Monitor the resultant stack state for corruption, focusing on label index errors during conditional branching.

(assert_invalid
  (module (func $conditional-block-br_if (result i32)
    (i32.const 1)
    (block (result i32)
      (block
        (i32.const 2)
        (br_if 0 (i32.const 1))
        (i32.const 3)
      )
      (i32.add)
    )
    (i32.const 4)
  ))
  "type mismatch"
)