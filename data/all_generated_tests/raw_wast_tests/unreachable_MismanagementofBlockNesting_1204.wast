;; 5. **Test Description:**    Nested `loop` structures containing inner blocks with `unreachable`, and a `br_table` dynamically deciding which blocks or loops to break out from.    - **Constraint Checked:** Assesses if `br_table` correctly maintains nesting block frames when `unreachable` triggers traps within nested loops.    - **Relation to Mismanagement of Block Nesting:** Examines if the depth addressed by `br_table` respects the proper block/loop nesting post-trap conditions.

(assert_invalid
  (module
    (func $type-loop-nested-br_table-unreachable (result i32)
      (block $outer
        (loop $inner
          (block $innermost
            (unreachable)
          )
          (br_table $inner $outer)
        )
      )
    )
  )
  "type mismatch"
)