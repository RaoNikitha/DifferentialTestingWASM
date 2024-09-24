;; 5. Include a `block` where the `instr*` sequence contains multiple `br_if` statements with a mix of true and false conditions. Check if they branch correctly or incorrectly based on condition evaluations.

(assert_invalid
  (module (func $mixed-br-if-blocks
    (block (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 1))
      (i32.const 2)
      (br_if 0 (i32.const 0))
      (i32.const 3)
    )
    (i32.const 4)
  ))
  "type mismatch"
)