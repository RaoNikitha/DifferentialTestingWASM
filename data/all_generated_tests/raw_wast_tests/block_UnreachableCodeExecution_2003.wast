;; 4. Create a `block` with a nested set of instructions culminating in an indirect branch table that targets an `unreachable` instruction if the computed index is out of range, testing label indexing and operand compliance.

(assert_invalid
  (module (func $type-indirect-branch-table-vs-indexing (result i32)
    (block $outer (result i32)
      (block $inner (result i32)
        (br_table 0 (br 1 (i32.const 0)) (i32.const 1))
        (unreachable)
      )
      (i32.const 2)
    )
  ))
  "index out of range in br_table"
)