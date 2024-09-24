;; 1. Create a `br_table` with an operand stack type mismatch, where the target labels and default label expect different operand types. Ensure the operand at runtime is out of bounds, forcing the use of the default label. This tests misalignment in stack management and operand type matching, leading to a potential inconsistency in the executed control flow graph (CFG).

(assert_invalid
  (module
    (func $mismatched-stack-type
      (block $outer_block
        (block $inner_block (br_table 0 1 (i32.const 2)) (i64.const 0))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)