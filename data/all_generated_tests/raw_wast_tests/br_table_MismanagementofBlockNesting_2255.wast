;; Test5: Create a complex structure with nested loops and blocks, with `br_table` incorrectly targeting the outermost block from inner loops. Expect `wizard_engine` to provide immediate feedback on the mismatch, while WebAssembly may execute incorrectly or encounter traps due to wrong label references.

(assert_invalid
  (module
    (func $nested-loops-and-br_table
      (block $outermost
        (loop $inner1
          (block $inner_block
            (loop $inner2
              (br_table $outermost $inner_block (i32.const 0))  ;; Incorrect targeting of the outermost block from an inner loop
            ))
          (i32.const 1)
          (br $inner1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)