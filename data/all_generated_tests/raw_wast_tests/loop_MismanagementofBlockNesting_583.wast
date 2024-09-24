;; Construct a loop, within which lies another loop with a `br_table` instruction targeting various blocks and loops. In WebAssembly, the `br_table` should correctly jump within the scope, but Wizard Engine may branch to incorrect depths, demonstrating faulty nesting management.

(assert_invalid
  (module
    (func $nested-loop-br-table
      (block $outer
        (loop $inner
          (i32.const 0)
          (br_table $inner $outer)
        )
      )
    )
  )
  "type mismatch"
)