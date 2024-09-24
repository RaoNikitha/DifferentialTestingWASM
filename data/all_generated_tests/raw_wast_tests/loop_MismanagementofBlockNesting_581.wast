;; Create a loop containing a nested block where the nested block has its own loop inside. Use `br_table` to branch to different depths in the nested blocks. WebAssembly should correctly handle the branching, while Wizard Engine may incorrectly misinterpret the nested labels.

(assert_invalid
  (module
    (func $nested_loops
      (loop (result i32)
        (br_table 0 1 0
          (block (loop
            (br_table 1 0 (i32.const 1))
          ))
        )
      )
    )
  )
  "type mismatch"
)