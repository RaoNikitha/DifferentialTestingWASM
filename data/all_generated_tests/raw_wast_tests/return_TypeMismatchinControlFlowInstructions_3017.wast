;; Create a scenario where a `br_table` (branch table) instruction is used within a function, and one of the branch targets leaves the stack with incorrect types, causing a type mismatch at the `return`.

(assert_invalid
  (module
    (func $br_table-return-type-mismatch (result i32)
      (i32.const 0)
      (block $L0 (result i32)
        (i32.const 1)
        (block $L1 (result i32)
          (i32.const 2)
          (br_table $L1 $L0) ; br_table with mismatching types
        )
        (drop)
        (return)
      )
    )
  )
  "type mismatch"
)