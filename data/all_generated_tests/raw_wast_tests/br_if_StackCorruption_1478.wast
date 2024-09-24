;; Test 9: Develop a test incorporating a function with nested blocks and loops, utilizing `br_if` inside those blocks and loops. Ensure the operand stack does not get corrupted when conditionally branching in and out of different nesting levels.

(assert_invalid
  (module
    (func $test-nested-blocks-loops
      (block (loop (block (br_if 2 (i32.const 1)))))
      (i32.const 0) (br_if 0)
    )
  )
  "type mismatch"
)