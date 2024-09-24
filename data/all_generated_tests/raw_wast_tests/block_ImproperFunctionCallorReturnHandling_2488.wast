;; Create a scenario with a `block` where the `br_table` (branch table) instruction targets multiple labels and the instruction sequence includes both direct and indirect function calls. The goal is to test how each implementation handles complex control flow within a block, ensuring correct function invocation and return sequencing among provided table indices.

(assert_invalid
  (module
    (func $complex-block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 1))
          (br 0 (call 0))
        )
        (call 0)
      )
    )
    (func (result i32) (i32.const 42))
  )
  "type mismatch"
)